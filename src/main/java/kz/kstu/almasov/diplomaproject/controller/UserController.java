package kz.kstu.almasov.diplomaproject.controller;

import kz.kstu.almasov.diplomaproject.entity.user.Role;
import kz.kstu.almasov.diplomaproject.entity.user.User;
import kz.kstu.almasov.diplomaproject.entity.dto.UserDTO;
import kz.kstu.almasov.diplomaproject.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        // true passed to CustomDateEditor constructor means convert empty String to null
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @GetMapping("{user}")
    public String userPage(@PathVariable User user, Model model, Principal principal) {
        User authorizedUser = userService.getUserByUsername(principal.getName());
        boolean myPage = authorizedUser.getId().equals(user.getId());
        boolean isAuthorizedUserTamadaOrRestaurantAdmin = authorizedUser.getRoles().contains(Role.TAMADA) || authorizedUser.getRoles().contains(Role.RESTAURANT);
        boolean isTamada = user.getRoles().contains(Role.TAMADA);
        boolean isRestaurantAdmin = user.getRoles().contains(Role.RESTAURANT);

        model.addAttribute("myPage", myPage);
        model.addAttribute("isAuthorizedUserTamadaOrRestaurantAdmin", isAuthorizedUserTamadaOrRestaurantAdmin);
        model.addAttribute("isTamada", isTamada);
        model.addAttribute("isRestaurantAdmin", isRestaurantAdmin);
        model.addAttribute("user", user);
        return "userPage";
    }

    @GetMapping("/editProfile")
    public String editProfile(Model model, Principal principal) {
        UserDTO user = userService.getUserDtoByUsername(principal.getName());
        model.addAttribute("user", user);
        return "editProfile";
    }

    @PostMapping("/updateUser")
    public String updateUser(
            @Valid UserDTO user,
            BindingResult bindingResult,
            Model model
    ) {
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtil.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("user", user);
        } else {
            if (userService.updateUser(user, model)) {
                model.addAttribute("message", "Changes successfully saved!");
            }
        }
        return "/editProfile";
    }

}
