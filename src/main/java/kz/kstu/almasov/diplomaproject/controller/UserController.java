package kz.kstu.almasov.diplomaproject.controller;

import kz.kstu.almasov.diplomaproject.entity.dto.TamadaDTO;
import kz.kstu.almasov.diplomaproject.entity.user.*;
import kz.kstu.almasov.diplomaproject.entity.dto.UserDTO;
import kz.kstu.almasov.diplomaproject.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

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
        Tamada tamada = userService.getTamada(user);
        RestaurantAdmin restaurantAdmin = userService.getRestaurantAdmin(user);
        boolean myPage = authorizedUser.getId().equals(user.getId());
        boolean isAuthorizedUserTamadaOrRestaurantAdmin = authorizedUser.getRoles().contains(Role.TAMADA) || authorizedUser.getRoles().contains(Role.RESTAURANT);

        model.addAttribute("myPage", myPage);
        model.addAttribute("isAuthorizedUserTamadaOrRestaurantAdmin", isAuthorizedUserTamadaOrRestaurantAdmin);
        model.addAttribute("user", user);
        if (restaurantAdmin != null) {
            model.addAttribute("restaurantAdmin", restaurantAdmin);
        }
        if (tamada != null) {
            model.addAttribute("tamada", TamadaDTO.from(tamada));
        }
        return "userPage";
    }

    @GetMapping("/editProfile")
    public String editProfile(Model model, Principal principal) {
        User userFromDb = userService.getUserByUsername(principal.getName());
        UserDTO user = UserDTO.from(userFromDb);
        Tamada tamada = userService.getTamada(userFromDb);
        RestaurantAdmin restaurantAdmin = userService.getRestaurantAdmin(userFromDb);
        model.addAttribute("user", user);
        if (restaurantAdmin != null) {
            model.addAttribute("restaurantAdmin", restaurantAdmin);
        }
        if (tamada != null) {
            model.addAttribute("tamada",tamada);
        }
        return "editProfile";
    }

    @PostMapping("/updateUser")
    public String updateUser(
            @Valid UserDTO user,
            BindingResult bindingResult,
            Model model
    ) {
        String view = "/editProfile";
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtil.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("user", user);
        } else {
            if (userService.updateUser(user, model)) {
                view = "redirect:/user/" + user.getId();
            }
        }
        return view;
    }

    @PostMapping("/updateTamada")
    public String updateTamada(
            @RequestParam Map<String, String> form,
            @Valid Tamada tamada,
            BindingResult bindingResult,
            Model model
    ) {
        String view = "/editProfile";
        Set<String> languages = Arrays.stream(Language.values()).map(Language::name).collect(Collectors.toSet());
        tamada.setLanguages(new ArrayList<>());
        for (String key : form.keySet()) {
            if (languages.contains(key.toUpperCase())) {
                tamada.getLanguages().add(key);
            }
        }
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtil.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("tamada", tamada);
        } else {
            if (userService.updateTamada(tamada, model)) {
                view = "redirect:/user/" + tamada.getUser().getId();
            }
        }
        model.addAttribute("user", UserDTO.from(tamada.getUser()));
        return view;
    }

    @PostMapping("/updateRestaurantAdmin")
    public String updateRestaurantAdmin(
            @Valid RestaurantAdmin restaurantAdmin,
            BindingResult bindingResult,
            Model model
    ) {
        String view = "/editProfile";
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtil.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("restaurantAdmin", restaurantAdmin);
        } else {
            if (userService.updateRestaurantAdmin(restaurantAdmin, model)) {
                view = "redirect:/user/" + restaurantAdmin.getUser().getId();
            }
        }
        return view;
    }

    @GetMapping("/updateAvatar")
    public String updateAvatarPage() {
        return "addImg";
    }

    @PostMapping("/updateAvatar")
    public String updateAvatar(
            @AuthenticationPrincipal User user,
            @RequestParam("file") MultipartFile file,
            Model model
    ) throws IOException {
        String view = "/updateAvatar";
        if (file != null) {
            userService.updateAvatar(user, file);
            model.addAttribute("user", user);
            view = "redirect:/user/" + user.getId();
        } else {
            model.addAttribute("message", "file.error.correct");
        }

        return view;
    }

}
