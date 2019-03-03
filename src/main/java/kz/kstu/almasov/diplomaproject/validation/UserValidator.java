package kz.kstu.almasov.diplomaproject.validation;

import kz.kstu.almasov.diplomaproject.entity.User;
import kz.kstu.almasov.diplomaproject.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserValidator implements Validator<User> {

    @Autowired
    private UserRepository userRepository;

    @Override
    public boolean validate(User user) {
        boolean sentence;
        User userFromDb = userRepository.findByUsername(user.getUsername());
        if (userFromDb != null) {
            sentence = false;
        } else {
            sentence = true;
        }
        return sentence;
    }
}
