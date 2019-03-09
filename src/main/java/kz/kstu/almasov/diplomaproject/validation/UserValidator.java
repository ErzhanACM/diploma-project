package kz.kstu.almasov.diplomaproject.validation;

import kz.kstu.almasov.diplomaproject.entity.User;
import kz.kstu.almasov.diplomaproject.entity.dto.UserDTO;
import kz.kstu.almasov.diplomaproject.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserValidator extends AbstractValidator<User> {

    @Autowired
    private UserRepository userRepository;

    @Override
    public boolean validate(User user) {
        boolean sentence;
        User userWithUsername = userRepository.findByUsername(user.getUsername());
        User userWithEmail = userRepository.findByEmail(user.getEmail());
        if (userWithUsername != null) {
            sentence = false;
            setMessage("User with such username already exists!");
        } else if (userWithEmail != null) {
            sentence = false;
            setMessage("User with such email already exists!");
        } else {
            sentence = true;
        }
        return sentence;
    }

    public boolean validate(User user, String oldEmail) {

    }

}
