package kz.kstu.almasov.diplomaproject.controller;

import kz.kstu.almasov.diplomaproject.entity.dto.TamadaDTO;
import kz.kstu.almasov.diplomaproject.entity.dto.UserDTO;
import kz.kstu.almasov.diplomaproject.entity.review.TamadaReview;
import kz.kstu.almasov.diplomaproject.entity.user.Language;
import kz.kstu.almasov.diplomaproject.entity.user.Tamada;
import kz.kstu.almasov.diplomaproject.entity.user.User;
import kz.kstu.almasov.diplomaproject.service.TamadaService;
import kz.kstu.almasov.diplomaproject.service.UserService;
import kz.kstu.almasov.diplomaproject.util.PaginationManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/tamada")
public class TamadaController {

    @Autowired
    private TamadaService tamadaService;

    @Autowired
    private PaginationManager<Tamada> paginationManager;

    @PostMapping("/updateTamada")
    public String updateTamada(
            @RequestParam Map<String, String> form,
            @Valid Tamada tamada,
            BindingResult bindingResult,
            Model model
    ) {
        String view = "/editProfile";
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtil.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("tamada", tamada);
        } else {
            if (tamadaService.updateTamada(tamada, model, form)) {
                view = "redirect:/user/" + tamada.getUser().getId();
            }
        }
        model.addAttribute("user", UserDTO.from(tamada.getUser()));
        return view;
    }

    @GetMapping("/tamadaList")
    public String tamadaList(
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.ASC) Pageable pageable,
            Model model
    ) {
        Page<Tamada> page = tamadaService.getTamadaPage(pageable);
        List<Integer> bodyForPagination = paginationManager.getBody(page);

        model.addAttribute("page", page);
        model.addAttribute("tamadaList", page.getContent());
        model.addAttribute("url", "/tamada/tamadaList");
        model.addAttribute("body", bodyForPagination);
        model.addAttribute("querySymbol", "?");
        return "tamadaList";
    }

    @GetMapping("/searchTamada")
    public String searchTamada(
            @Valid TamadaDTO tamada,
            BindingResult bindingResult,
            Model model,
            @RequestParam Map<String, String> form,
            @RequestParam(required = false, defaultValue = "servicesPrice") String sort,
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.ASC) Pageable pageable
    ) {
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtil.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("searchedTamada", tamada);
        } else {
            Page<Tamada> page = tamadaService.getTamadaPage(tamada, pageable, form);
            List<Integer> bodyForPagination = paginationManager.getBody(page);
            String url = getUrl(tamada, sort);

            model.addAttribute("searchedTamada", tamada);
            model.addAttribute("page", page);
            model.addAttribute("tamadaList", page.getContent());
            model.addAttribute("url", url);
            model.addAttribute("body", bodyForPagination);
            model.addAttribute("querySymbol", "&");
        }
        model.addAttribute("sort", sort);
        return "tamadaList";
    }

    @GetMapping("/addReview")
    public String addReviewPage(
            @RequestParam User user,
            @RequestParam Tamada tamada,
            Model model
    ) {
        model.addAttribute("user", user);
        model.addAttribute("tamada", tamada);
        return "createReview";
    }

    @PostMapping("/addReview")
    public String addReview(
            @Valid TamadaReview tamadaReview,
            BindingResult bindingResult,
            Model model
    ) {
        String view = "createReview";
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtil.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("tamadaReview", tamadaReview);
            model.addAttribute("tamada", tamadaReview.getTamadaId());
        } else {
            tamadaService.saveReview(tamadaReview);
            view = "redirect:/user/" + tamadaReview.getTamadaId().getUser().getId();
        }
        return view;
    }

    private String getUrl(TamadaDTO tamada, String sort) {
        String url = "/tamada/searchTamada?rating=" + tamada.getRating() + "&experience=" + tamada.getExperience() + "&sort=" + sort;
        return url;
    }

}
