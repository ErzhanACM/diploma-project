package kz.kstu.almasov.diplomaproject.validation;

import kz.kstu.almasov.diplomaproject.entity.user.User;
import kz.kstu.almasov.diplomaproject.entity.dto.UserDTO;
import kz.kstu.almasov.diplomaproject.entity.dto.UserRegistrationDTO;
import kz.kstu.almasov.diplomaproject.repository.UserRepository;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserValidator extends AbstractValidator {

    @Autowired
    private UserRepository userRepository;

    public boolean validate(UserRegistrationDTO user) {
        boolean sentence = true;
        getErrorMap().clear();
        if (!checkUsername(user.getUsername())) {
            getErrorMap().put("usernameError", "user.username.already.exists.error");
            sentence = false;
        }
        if (!checkEmail(user.getEmail())) {
            getErrorMap().put("emailError", "user.email.already.exists.error");
            sentence = false;
        }
        if (!checkPasswords(user.getPassword(), user.getPassword2())) {
            getErrorMap().put("passwordError", "user.password.confirmation.different.error");
            sentence = false;
        }
        return sentence;
    }

    public boolean validate(UserDTO userDTO) {
        boolean sentence = true;
        getErrorMap().clear();
        if (!checkEmail(userDTO.getEmail(), userDTO.getOldEmail())) {
            getErrorMap().put("emailError", "user.email.already.exists.error");
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

    private boolean checkPasswords(String password, String password2) {
        if (Strings.isNotEmpty(password) && Strings.isNotEmpty(password2) && !password.equals(password2)) {
            return false;
        } else {
            return true;
        }
    }

}
