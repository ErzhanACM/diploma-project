package kz.kstu.almasov.diplomaproject.entity.dto;

import kz.kstu.almasov.diplomaproject.entity.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {

    private Long id;

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

    public static UserDTO from(User user) {
        return new UserDTO(user.getId(), user.getEmail(), user.getEmail(), user.getFirstName(), user.getSecondName(),
                user.getPatronymic(), user.getCity(), user.getAddress(), user.getPhone(), user.getSkype(), user.getAboutMyself());
    }

}
