package kz.kstu.almasov.diplomaproject.controller;

import kz.kstu.almasov.diplomaproject.entity.dto.SearchToiDTO;
import kz.kstu.almasov.diplomaproject.entity.toi.Place;
import kz.kstu.almasov.diplomaproject.entity.toi.Toi;
import kz.kstu.almasov.diplomaproject.entity.toi.Type;
import kz.kstu.almasov.diplomaproject.entity.user.Role;
import kz.kstu.almasov.diplomaproject.entity.user.User;
import kz.kstu.almasov.diplomaproject.service.ToiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/toi")
public class ToiController {

    @Autowired
    private ToiService toiService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        // true passed to CustomDateEditor constructor means convert empty String to null
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @GetMapping("/toiList/{user}")
    public String toiListOfUser(
            Model model,
            @PathVariable User user,
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.ASC) Pageable pageable
    ) {
        Page<Toi> page = toiService.getToiListOfUser(pageable, user.getId());
        List<Integer> bodyForPagination = getBody(page);

        model.addAttribute("user", user);
        model.addAttribute("page", page);
        model.addAttribute("toiList", page.getContent());
        model.addAttribute("url", "/toi/toiList/" + user.getId());
        model.addAttribute("body", bodyForPagination);
        model.addAttribute("querySymbol", "?");
        return "toiList";
    }

    @GetMapping("/toiList")
    public String toiList(
            Model model,
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.ASC) Pageable pageable
    ) {
        Page<Toi> page = toiService.getToiList(pageable);
        List<Integer> bodyForPagination = getBody(page);

        model.addAttribute("page", page);
        model.addAttribute("toiList", page.getContent());
        model.addAttribute("url", "/toi/toiList");
        model.addAttribute("body", bodyForPagination);
        model.addAttribute("querySymbol", "?");
        return "toiList";
    }

    @PostMapping("/createToi")
    public String createToi(
            @Valid Toi toi,
            BindingResult bindingResult,
            Model model,
            @AuthenticationPrincipal User user,
            @RequestParam String selectedType,
            @RequestParam String selectedPlace
    ) throws ParseException {
        String view;
        toi.setType(Type.valueOf(selectedType.toUpperCase()));
        toi.setPlace(Place.valueOf(selectedPlace.toUpperCase()));
        String date = ControllerUtil.getFormatedDate(toi.getDate());
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtil.getErrors(bindingResult);
            model.addAttribute("selectedType", selectedType);
            model.addAttribute("selectedPlace", selectedPlace);
            model.addAttribute("selectedDate", date);
            model.addAttribute("creatingToi", toi);
            model.mergeAttributes(errorsMap);
            view = "/createToi";
        } else {
            toiService.createToi(user, toi);
            view = "redirect:/toi/toiList";
        }
        return view;
    }

    @GetMapping("/createToi")
    public String createToiPage() {
        return "createToi";
    }

    @GetMapping("/searchToi")
    public String searchToi(
            SearchToiDTO toi,
            @RequestParam(required = false, defaultValue = "name") String sort,
            Model model,
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.ASC) Pageable pageable
    ) {
        Page<Toi> page = toiService.getToiList(toi, pageable);
        List<Integer> bodyForPagination = getBody(page);

        String date1 = ControllerUtil.getFormatedDate(toi.getDate1());
        String date2 = ControllerUtil.getFormatedDate(toi.getDate2());


        String url = getUrl(toi, date1, date2, sort);

        model.addAttribute("url", url);
        model.addAttribute("querySymbol", "&");
        model.addAttribute("page", page);
        model.addAttribute("toiList", page.getContent());
        model.addAttribute("searchedToi", toi);
        model.addAttribute("selectedDate1", date1);
        model.addAttribute("selectedDate2", date2);
        model.addAttribute("sort", sort);
        model.addAttribute("body", bodyForPagination);
        return "toiList";
    }

    private String getUrl(SearchToiDTO toi, String date1, String date2, String sort) {
        String name = toi.getName().replace(' ', '+');

        if (toi.getCity() == null) {
            toi.setCity("");
        }
        String numberOfGuests = "";
        if (toi.getNumberOfGuests() != null) {
            numberOfGuests = toi.getNumberOfGuests().toString();
        }

        String url = "/toi/searchToi?name=" + name + "&type=" + toi.getType() + "&date1=" + date1 + "&date2=" + date2
                + "&city=" + toi.getCity() + "&numberOfGuests=" + numberOfGuests + "&place=" + toi.getPlace()
                + "&sort=" + sort;
        return url;
    }

    private List<Integer> getBody(Page<Toi> page) {
        List<Integer> body = new ArrayList<>();
        if (page.getTotalPages() <= 7) {
            for (int i = 1; i <= page.getTotalPages(); i++) {
                body.add(i);
            }
        } else {
            int totalPages = page.getTotalPages();
            int pageNumber = page.getNumber() + 1;

            List<Integer> head = getHeadList(pageNumber);
            List<Integer> tail = getTailList(totalPages, pageNumber);
            List<Integer> bodyBefore = getBodyBefore(pageNumber, totalPages);
            List<Integer> bodyAfter = getBodyAfter(pageNumber, totalPages);

            body.addAll(head);
            body.addAll(bodyBefore);
            if (pageNumber > 3 && pageNumber < (totalPages - 2)) {
                body.add(pageNumber);
            }
            body.addAll(bodyAfter);
            body.addAll(tail);
        }
        return body;
    }

    private List<Integer> getHeadList(int pageNumber) {
        List<Integer> head = new ArrayList<>();
        if (pageNumber > 4) {
            head.add(1);
            head.add(-1);
        } else {
            head.add(1);
            head.add(2);
            head.add(3);
        }
        return head;
    }

    private List<Integer> getBodyBefore(int pageNumber, int totalPages) {
        List<Integer> bodyBefore = new ArrayList<>();
        if (pageNumber > 4 && pageNumber < (totalPages - 1)) {
            bodyBefore.add(pageNumber - 2);
            bodyBefore.add(pageNumber - 1);
        }
        return bodyBefore;
    }

    private List<Integer> getBodyAfter(int pageNumber, int totalPages) {
        List<Integer> bodyAfter = new ArrayList<>();
        if (pageNumber > 2 && pageNumber < (totalPages - 3)) {
            bodyAfter.add(pageNumber + 1);
            bodyAfter.add(pageNumber + 2);
        }
        return bodyAfter;
    }

    private List<Integer> getTailList(int totalPages, int pageNumber) {
        List<Integer> tail = new ArrayList<>();
        if (pageNumber < (totalPages-3)) {
            tail.add(-1);
            tail.add(totalPages);
        } else {
            tail.add(totalPages-2);
            tail.add(totalPages-1);
            tail.add(totalPages);
        }
        return tail;
    }

    @GetMapping("{toi}")
    public String toiPage(@PathVariable Toi toi, Model model) {
        model.addAttribute("toi", toi);
        return "toiPage";
    }


}
