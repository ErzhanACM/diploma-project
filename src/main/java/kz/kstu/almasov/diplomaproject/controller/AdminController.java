package kz.kstu.almasov.diplomaproject.controller;

import kz.kstu.almasov.diplomaproject.entity.user.User;
import kz.kstu.almasov.diplomaproject.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@PreAuthorize("hasAuthority('ADMIN')")
public class AdminController {

    @Autowired
    private UserService userService;

    @GetMapping("/user/userList")
    public String userList(Model model) {
        userService.getUserList(model);
        return "userList";
    }

    @GetMapping("/user/userEdit/{user}")
    public String userEditForm(@PathVariable User user, Model model) {
        userService.getUserForEditForm(user, model);
        return "userEdit";
    }

    @PostMapping("/user/userList")
    public String saveUser(
            @RequestParam String username,
            @RequestParam Map<String, String> formData,
            @RequestParam("userId") User user
    ) {
        userService.updateUserRoles(username, formData, user);
        return "redirect:/user/userList";
    }

}
