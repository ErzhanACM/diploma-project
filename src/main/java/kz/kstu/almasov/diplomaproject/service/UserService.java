package kz.kstu.almasov.diplomaproject.service;

import kz.kstu.almasov.diplomaproject.entity.Role;
import kz.kstu.almasov.diplomaproject.entity.User;
import kz.kstu.almasov.diplomaproject.entity.dto.UserDTO;
import kz.kstu.almasov.diplomaproject.repository.UserRepository;
import kz.kstu.almasov.diplomaproject.validation.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserValidator userValidator;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepository.findByUsername(username);
    }

    public void getUserList(Model model) {
        model.addAttribute("users", userRepository.findAll());
    }

    public void getUserForEditForm(User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
    }

    public void updateUserRoles(String username, Map<String, String> formData, User user) {
        user.setUsername(username);
        user.getRoles().clear();

        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());

        for (String key : formData.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }

        userRepository.save(user);
    }


    public boolean updateUser(UserDTO userDTO, Model model) {
        User user = getUserFromUserDto(userDTO);
        if (!userValidator.validate(user, userDTO.getOldEmail())) {
            model.mergeAttributes(userValidator.getErrorMap());
            model.addAttribute("user", userDTO);
            return false;
        }
        userRepository.save(user);
        model.addAttribute("user", UserDTO.from(user));
        return true;
    }

    protected User getUserFromUserDto(UserDTO userDTO) {
        User user = userRepository.findById(userDTO.getId()).get();
        user.setEmail(userDTO.getEmail());
        user.setFirstName(userDTO.getFirstName());
        user.setSecondName(userDTO.getSecondName());
        user.setPatronymic(userDTO.getPatronymic());
        user.setCity(userDTO.getCity());
        user.setAddress(userDTO.getAddress());
        user.setPhone(userDTO.getPhone());
        user.setSkype(userDTO.getSkype());
        user.setAboutMyself(userDTO.getAboutMyself());
        return user;
    }


    public UserDTO getUserDtoByUsername(String username) {
        User userFromDb = userRepository.findByUsername(username);
        UserDTO user = UserDTO.from(userFromDb);
        return user;
    }
}
