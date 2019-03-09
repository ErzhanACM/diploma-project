package kz.kstu.almasov.diplomaproject.validation;

import kz.kstu.almasov.diplomaproject.entity.User;
import kz.kstu.almasov.diplomaproject.repository.UserRepository;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserValidator extends AbstractValidator<User> {

    @Autowired
    private UserRepository userRepository;

    @Override
    public boolean validate(User user) {
        boolean sentence = true;
        if (!checkUsername(user.getUsername())) {
            getErrorMap().put("usernameError", "User with such username already exists!");
            sentence = false;
        }
        if (!checkEmail(user.getEmail())) {
            getErrorMap().put("emailError", "User with such email already exists!");
            sentence = false;
        }
        return sentence;
    }

    public boolean validate(User user, String oldEmail) {
        boolean sentence = true;
        if (!checkEmail(user.getEmail(), oldEmail)) {
            getErrorMap().put("emailError", "User with such email already exists!");
            sentence = false;
        }
        return sentence;
    }

    private boolean checkUsername(String username) {
        User userWithUsername = userRepository.findByUsername(username);
        if (userWithUsername != null) {
            return false;
        } else {
            return true;
        }
    }

    private boolean checkEmail(String email) {
        User userWithUsername = userRepository.findByEmail(email);
        if (userWithUsername != null) {
            return false;
        } else {
            return true;
        }
    }

    private boolean checkEmail(String email, String oldEmail) {
        boolean sentence = true;
        if (Strings.isNotEmpty(email) && Strings.isNotEmpty(oldEmail) && !email.equals(oldEmail)) {
            sentence = checkEmail(email);
        }
        return sentence;
    }

}
