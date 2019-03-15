package kz.kstu.almasov.diplomaproject.entity.dto;

import kz.kstu.almasov.diplomaproject.entity.user.Role;
import kz.kstu.almasov.diplomaproject.entity.user.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.util.Set;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserRegistrationDTO {

    @NotBlank(message = "Username can not be empty")
    private String username;

    @NotBlank(message = "Password can not be empty")
    private String password;

    @NotBlank(message = "Password confirmation can not be empty")
    private String password2;

    @Email(message = "Email is not correct!")
    @NotBlank(message = "Email can not be empty")
    private String email;

    private Set<Role> roles;

    public UserRegistrationDTO(String username, String password, String email, Set<Role> roles) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.roles = roles;
    }

    public static UserRegistrationDTO from(User user) {
        return new UserRegistrationDTO(user.getUsername(), user.getPassword(), user.getEmail(), user.getRoles());
    }

}
