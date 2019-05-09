package kz.kstu.almasov.diplomaproject.service;

import kz.kstu.almasov.diplomaproject.entity.user.RestaurantAdmin;
import kz.kstu.almasov.diplomaproject.entity.user.User;
import kz.kstu.almasov.diplomaproject.repository.RestaurantAdminRepository;
import kz.kstu.almasov.diplomaproject.validation.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class RestaurantService {

    @Autowired
    private RestaurantAdminRepository restaurantAdminRepository;

    @Autowired
    private UserValidator userValidator;

    public RestaurantAdmin getRestaurantAdmin(User user) {
        return restaurantAdminRepository.findByUser(user);
    }

    public boolean updateRestaurantAdmin(RestaurantAdmin restaurantAdmin, Model model) {
        if (!userValidator.validate(restaurantAdmin)) {
            model.mergeAttributes(userValidator.getErrorMap());
            model.addAttribute("restaurantAdmin", restaurantAdmin);
            return false;
        }
        restaurantAdminRepository.save(restaurantAdmin);
        return true;
    }
}
