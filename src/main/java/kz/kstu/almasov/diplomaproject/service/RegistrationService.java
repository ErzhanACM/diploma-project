package kz.kstu.almasov.diplomaproject.service;

import kz.kstu.almasov.diplomaproject.entity.User;
import kz.kstu.almasov.diplomaproject.entity.dto.UserRegistrationDTO;
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
        model.addAttribute("messageTitle", "Registration completed successfully");
        model.addAttribute("message", "An activation code has been sent to your email (" +  user.getEmail() + ") to activate your account");
        return true;
    }

    private void sendEmailConfirmation(User user) {
        user.setActivationCode(UUID.randomUUID().toString());
        if (!StringUtils.isEmpty(user.getEmail())) {
            String message = String.format(
                    "Hello, %s! \n" +
                            "Welcome to APPLICATION_NAME! Please, visit next link: http://localhost:8080/user/activate/%s",
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
