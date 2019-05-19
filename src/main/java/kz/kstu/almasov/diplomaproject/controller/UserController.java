package kz.kstu.almasov.diplomaproject.controller;

import kz.kstu.almasov.diplomaproject.entity.dto.TamadaDTO;
import kz.kstu.almasov.diplomaproject.entity.toi.Toi;
import kz.kstu.almasov.diplomaproject.entity.user.*;
import kz.kstu.almasov.diplomaproject.entity.dto.UserDTO;
import kz.kstu.almasov.diplomaproject.service.RestaurantService;
import kz.kstu.almasov.diplomaproject.service.TamadaService;
import kz.kstu.almasov.diplomaproject.service.ToiService;
import kz.kstu.almasov.diplomaproject.service.UserService;
import kz.kstu.almasov.diplomaproject.util.PaginationManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
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

    @Autowired
    private TamadaService tamadaService;

    @Autowired
    private RestaurantService restaurantService;

    @Autowired
    private PaginationManager<Toi> paginationManager;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        // true passed to CustomDateEditor constructor means convert empty String to null
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @GetMapping("{user}")
    public String userPage(
            @AuthenticationPrincipal User authenticatedUser,
            @PathVariable User user,
            Model model,
            Principal principal
    ) {
        User authorizedUser = userService.getUserByUsername(principal.getName());
        Tamada tamada = tamadaService.getTamada(user);
        RestaurantAdmin restaurantAdmin = restaurantService.getRestaurantAdmin(user);
        boolean myPage = authorizedUser.getId().equals(user.getId());

        model.addAttribute("myPage", myPage);
        model.addAttribute("user", user);
        if (restaurantAdmin != null) {
            model.addAttribute("restaurantAdmin", restaurantAdmin);
        }
        if (tamada != null) {
            model.addAttribute("tamada", TamadaDTO.from(tamada));
            boolean isFavorite = tamadaService.isFavorite(tamada, authenticatedUser);
            model.addAttribute("isFavorite", isFavorite);
        }
        return "userPage";
    }

    @GetMapping("/editProfile")
    public String editProfile(
            Model model,
            Principal principal
    ) {
        User userFromDb = userService.getUserByUsername(principal.getName());
        UserDTO user = UserDTO.from(userFromDb);
        Tamada tamada = tamadaService.getTamada(userFromDb);
        RestaurantAdmin restaurantAdmin = restaurantService.getRestaurantAdmin(userFromDb);
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

    @PostMapping("/addToiToFavorites/{toi}")
    public String addToiToFavorites(
            @PathVariable Toi toi,
            @AuthenticationPrincipal User user,
            Model model
    ) {
        userService.addToiToFavorites(user, toi);
        return "redirect:/toi/" + toi.getId();
    }

    @PostMapping("/deleteToiFromFavorites/{toi}")
    public String deleteToiFromFavorites(
            @PathVariable Toi toi,
            @AuthenticationPrincipal User user,
            Model model
    ) {
        userService.deleteToiFromFavorites(user, toi);
        return "redirect:/toi/" + toi.getId();
    }

    @PostMapping("/addTamadaToFavorites/{tamada}")
    public String addTamadaToFavorites(
            @PathVariable Tamada tamada,
            @AuthenticationPrincipal User user,
            Model model
    ) {
        userService.addTamadaToFavorites(user, tamada);
        return "redirect:/user/" + tamada.getUser().getId();
    }

    @PostMapping("/deleteTamadaFromFavorites/{tamada}")
    public String deleteTamadaFromFavorites(
            @PathVariable Tamada tamada,
            @AuthenticationPrincipal User user,
            Model model
    ) {
        userService.deleteTamadaFromFavorites(user, tamada);
        return "redirect:/user/" + tamada.getUser().getId();
    }

}
