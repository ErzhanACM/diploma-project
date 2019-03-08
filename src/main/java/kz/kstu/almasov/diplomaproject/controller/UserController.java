package kz.kstu.almasov.diplomaproject.controller;

import kz.kstu.almasov.diplomaproject.entity.User;
import kz.kstu.almasov.diplomaproject.entity.dto.UserDTO;
import kz.kstu.almasov.diplomaproject.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;
import java.security.Principal;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("{user}")
    public String userPage(@PathVariable User user, Model model) {
        model.addAttribute("user", user);
        return "userPage";
    }

    @GetMapping("/editProfile")
    public String editProfile() {
        return "editProfile";
    }

    @PostMapping("/updateUser")
    public String updateUser(
            @Valid UserDTO user,
            BindingResult bindingResult,
            Model model
    ) {
        String view;
        view = "/editProfile";
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtil.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("user", user);
        } else {
            if (userService.updateUser(user, model)) {
                view = "userPage";
            }
        }
        System.out.println(user);
        return view;
    }

}
