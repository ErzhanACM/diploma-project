package kz.kstu.almasov.diplomaproject.entity.dto;

import kz.kstu.almasov.diplomaproject.entity.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.NumberFormat;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.xml.bind.DatatypeConverter;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {

    private Long id;

    @NotBlank(message = "Username can not be empty")
    private String username;

    @NotBlank(message = "Password can not be empty")
    private String password;

    @Email(message = "Email is not correct!")
    @NotBlank(message = "Email can not be empty")
    private String email;

    private String oldEmail;

    private String firstName;
    private String secondName;
    private String patronymic;
    private String city;
    private String address;

    private String phone;

    private String skype;
    private String aboutMyself;

    public UserDTO(
            Long id, String email, String firstName, String secondName, String patronymic, String city, String address,
            String phone, String skype, String aboutMyself
    ) {
        this.id = id;
        this.email = email;
        this.firstName = firstName;
        this.secondName = secondName;
        this.patronymic = patronymic;
        this.city = city;
        this.address = address;
        this.phone = phone;
        this.skype = skype;
        this.aboutMyself = aboutMyself;
    }

    public static UserDTO from(User user) {
        return new UserDTO(user.getId(), user.getEmail(), user.getFirstName(), user.getSecondName(), user.getPatronymic(),
                user.getCity(), user.getAddress(), user.getPhone(), user.getSkype(), user.getAboutMyself());
    }

}
