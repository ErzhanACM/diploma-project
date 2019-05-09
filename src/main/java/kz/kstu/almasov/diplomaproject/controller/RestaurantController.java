package kz.kstu.almasov.diplomaproject.controller;

import kz.kstu.almasov.diplomaproject.entity.user.RestaurantAdmin;
import kz.kstu.almasov.diplomaproject.service.RestaurantService;
import kz.kstu.almasov.diplomaproject.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;
import java.util.Map;

@Controller
@RequestMapping("/restaurant")
public class RestaurantController {

    @Autowired
    private RestaurantService restaurantService;

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
            if (restaurantService.updateRestaurantAdmin(restaurantAdmin, model)) {
                view = "redirect:/user/" + restaurantAdmin.getUser().getId();
            }
        }
        return view;
    }
}
