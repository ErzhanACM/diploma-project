package kz.kstu.almasov.diplomaproject.controller;

import kz.kstu.almasov.diplomaproject.entity.User;
import kz.kstu.almasov.diplomaproject.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
