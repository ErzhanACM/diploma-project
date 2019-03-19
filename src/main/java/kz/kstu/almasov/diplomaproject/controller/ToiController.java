package kz.kstu.almasov.diplomaproject.controller;

import kz.kstu.almasov.diplomaproject.entity.toi.Place;
import kz.kstu.almasov.diplomaproject.entity.toi.Toi;
import kz.kstu.almasov.diplomaproject.entity.toi.Type;
import kz.kstu.almasov.diplomaproject.entity.user.User;
import kz.kstu.almasov.diplomaproject.service.ToiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Date;
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

    @GetMapping("/toiList")
    public String toiList(Model model) {
        Iterable<Toi> toiList = toiService.getToiList();
        model.addAttribute("toiList", toiList);
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
    ) {
        String view;
        toi.setType(Type.valueOf(selectedType.toUpperCase()));
        toi.setPlace(Place.valueOf(selectedPlace.toUpperCase()));
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtil.getErrors(bindingResult);
            model.addAttribute("selectedType", selectedType);
            model.addAttribute("selectedPlace", selectedPlace);
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

}
