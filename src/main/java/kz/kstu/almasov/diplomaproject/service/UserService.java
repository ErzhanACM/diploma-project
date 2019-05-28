package kz.kstu.almasov.diplomaproject.service;

import kz.kstu.almasov.diplomaproject.entity.dto.UserDTO;
import kz.kstu.almasov.diplomaproject.entity.dto.UserRegistrationDTO;
import kz.kstu.almasov.diplomaproject.entity.restaurant.Restaurant;
import kz.kstu.almasov.diplomaproject.entity.toi.Toi;
import kz.kstu.almasov.diplomaproject.entity.user.*;
import kz.kstu.almasov.diplomaproject.repository.UserRepository;
import kz.kstu.almasov.diplomaproject.validation.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService {

    @Value("${upload.path}")
    private String uploadPath;

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
        if (!userValidator.validate(userDTO)) {
            model.mergeAttributes(userValidator.getErrorMap());
            model.addAttribute("user", userDTO);
            return false;
        }
        User user = getUserFromUserDto(userDTO);
        userRepository.save(user);
        return true;
    }

    protected User getUserFromUserDto(UserDTO userDTO) {
        User user = userRepository.findById(userDTO.getId()).get();
        user.setEmail(userDTO.getEmail());
        user.setBirthday(userDTO.getBirthday());
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

    protected User getUserFromUserRegistrationDto(UserRegistrationDTO userRegistrationDTO) {
        User user = new User();
        user.setEmail(userRegistrationDTO.getEmail());
        user.setUsername(userRegistrationDTO.getUsername());
        user.setPassword(userRegistrationDTO.getPassword());
        user.setRoles(userRegistrationDTO.getRoles());
        return user;
    }

    public User getUserByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public void updateAvatar(User user, MultipartFile file) throws IOException {
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        String uuidFile = UUID.randomUUID().toString();
        String resultFileName = uuidFile + "." + file.getOriginalFilename();

        file.transferTo(new File(uploadPath + "/" + resultFileName));
        user.setAvatarFileName(resultFileName);
        userRepository.save(user);
    }

    public void addToiToFavorites(User user, Toi toi) {
        List<Toi> favoriteTois = new ArrayList<>();
        favoriteTois.addAll(user.getFavoriteTois());
        favoriteTois.add(toi);
        user.getFavoriteTois().clear();
        userRepository.save(user);
        user.setFavoriteTois(favoriteTois);
        userRepository.save(user);
    }

    public void deleteToiFromFavorites(User user, Toi toi) {
        user.getFavoriteTois().remove(toi);
        userRepository.save(user);
    }

    public void addTamadaToFavorites(User user, Tamada tamada) {
        List<Tamada> favoriteTamadas = new ArrayList<>();
        favoriteTamadas.addAll(user.getFavoriteTamadas());
        favoriteTamadas.add(tamada);
        user.getFavoriteTamadas().clear();
        userRepository.save(user);
        user.setFavoriteTamadas(favoriteTamadas);
        userRepository.save(user);
    }

    public void deleteTamadaFromFavorites(User user, Tamada tamada) {
        user.getFavoriteTamadas().remove(tamada);
        userRepository.save(user);
    }

    public void addRestaurantToFavorites(User user, Restaurant restaurant) {
        List<Restaurant> favoriteRestaurants = new ArrayList<>();
        favoriteRestaurants.addAll(user.getFavoriteRestaurants());
        favoriteRestaurants.add(restaurant);
        user.getFavoriteRestaurants().clear();
        userRepository.save(user);
        user.setFavoriteRestaurants(favoriteRestaurants);
        userRepository.save(user);
    }


    public void deleteRestaurantFromFavorites(User user, Restaurant restaurant) {
        user.getFavoriteRestaurants().remove(restaurant);
        userRepository.save(user);
    }
}
