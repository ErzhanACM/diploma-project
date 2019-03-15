package kz.kstu.almasov.diplomaproject.controller;

import kz.kstu.almasov.diplomaproject.entity.toi.Toi;
import kz.kstu.almasov.diplomaproject.entity.user.User;
import kz.kstu.almasov.diplomaproject.service.ToiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.Map;

@Controller
@RequestMapping("/toi")
public class ToiController {

    @Autowired
    private ToiService toiService;

    @GetMapping("/toiList")
    public String toiList(
            @RequestParam(required = false, defaultValue = "") String filter,
            Model model
    ) {
        Iterable<Toi> toiList = toiService.getToiList(filter);
        model.addAttribute("toiList", toiList);
        model.addAttribute("filter", filter);
        return "toiList";
    }

    @PostMapping("/createToi")
    public String createToi(
            @Valid Toi toi,
            BindingResult bindingResult,
            Model model,
            @AuthenticationPrincipal User user
    ) {
        String view;
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtil.getErrors(bindingResult);
            model.addAttribute("creatingToi", toi);
            view = "/createToi";
            model.mergeAttributes(errorsMap);
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
