package kz.kstu.almasov.diplomaproject.controller;

import kz.kstu.almasov.diplomaproject.entity.user.Role;
import kz.kstu.almasov.diplomaproject.entity.dto.UserRegistrationDTO;
import kz.kstu.almasov.diplomaproject.service.RegistrationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.Map;
import java.util.TreeSet;

@Controller
public class RegistrationController {

    @Autowired
    private RegistrationService registrationService;

    @GetMapping("/registration")
    public String registrationPage() {
        return "registration";
    }

    @PostMapping("/registration")
    public String registrate(
            @RequestParam("role") String role,
            @Valid UserRegistrationDTO user,
            BindingResult bindingResult,
            Model model
    ) {
        String view;
        user.setRoles(new TreeSet<>());
        user.getRoles().add(Role.valueOf(role.toUpperCase()));
        user.getRoles().add(Role.USER);
        view = "/registration";
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtil.getErrors(bindingResult);
            model.addAttribute("user", user);
            model.addAttribute("selectedRole", role);
            model.mergeAttributes(errorsMap);
        } else {
            if (registrationService.registrateUser(user, model)) {
                view = "information";
            } else {
            }
            model.addAttribute("selectedRole", role);
        }
        return view;
    }

    @GetMapping("/user/activate/{code}")
    public String activateUser(Model model, @PathVariable String code) {
        registrationService.activateUser(model, code);
        return "information";
    }

    @PostMapping("/updateUser")
    public String updateUser() {
        return "/login";
    }

}
