package kz.kstu.almasov.diplomaproject.service;

import kz.kstu.almasov.diplomaproject.entity.user.RestaurantAdmin;
import kz.kstu.almasov.diplomaproject.entity.user.Role;
import kz.kstu.almasov.diplomaproject.entity.user.Tamada;
import kz.kstu.almasov.diplomaproject.entity.user.User;
import kz.kstu.almasov.diplomaproject.entity.dto.UserRegistrationDTO;
import kz.kstu.almasov.diplomaproject.repository.RestaurantAdminRepository;
import kz.kstu.almasov.diplomaproject.repository.TamadaRepository;
import kz.kstu.almasov.diplomaproject.repository.UserRepository;
import kz.kstu.almasov.diplomaproject.validation.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;

import java.util.UUID;

@Service
public class RegistrationService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private TamadaRepository tamadaRepository;

    @Autowired
    private RestaurantAdminRepository restaurantAdminRepository;

    @Autowired
    private MailService mailService;

    @Autowired
    private UserService userService;

    @Autowired
    private UserValidator userValidator;

    public boolean registrateUser(UserRegistrationDTO userRegistrationDTO, Model model) {
        if (!userValidator.validate(userRegistrationDTO)) {
            model.mergeAttributes(userValidator.getErrorMap());
            model.addAttribute("user", userRegistrationDTO);
            return false;
        }
        User user = userService.getUserFromUserRegistrationDto(userRegistrationDTO);
        user.setActive(false);
        sendEmailConfirmation(user);
        userRepository.save(user);
        if (user.getRoles().contains(Role.TAMADA)) {
            registerTamada(user);
        } else if (user.getRoles().contains(Role.RESTAURANT)) {
            registerRestaurantAdmin(user);
        }
        model.addAttribute("messageTitle", "Registration completed successfully");
        model.addAttribute("message", "An activation code has been sent to your email (" +  user.getEmail() + ") to activate your account");
        return true;
    }

    private void registerRestaurantAdmin(User user) {
        RestaurantAdmin restaurantAdmin = new RestaurantAdmin();
        restaurantAdmin.setUser(user);
        restaurantAdminRepository.save(restaurantAdmin);
    }

    private void registerTamada(User user) {
        Tamada tamada = new Tamada();
        tamada.setUser(user);
        tamada.setRating(0d);
        tamada.setServicesPrice(0);
        tamada.setExperience(0);
        tamadaRepository.save(tamada);
    }

    private void sendEmailConfirmation(User user) {
        user.setActivationCode(UUID.randomUUID().toString());
        if (!StringUtils.isEmpty(user.getEmail())) {
            String message = String.format(
                    "Hello, %s! \n" +
                            "Welcome to Mezumi! Please, visit next link: http://localhost:8080/user/activate/%s",
                    user.getUsername(),
                    user.getActivationCode()
            );
            mailService.sendMail(user.getEmail(), "Activation code", message);
        }

    }

    public void activateUser(Model model, String code) {
        User user = userRepository.findByActivationCode(code);
        if (user == null) {
            model.addAttribute("messageTitle", "Error while activate code!");
        } else {
            user.setActivationCode(null);
            user.setActive(true);
            model.addAttribute("messageTitle", "User is successfully activated!");
            userRepository.save(user);
        }
        model.addAttribute("withButton", true);
        model.addAttribute("href", "/login");
        model.addAttribute("buttonTitle", "login");
    }

}
