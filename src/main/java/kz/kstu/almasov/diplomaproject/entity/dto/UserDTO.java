package kz.kstu.almasov.diplomaproject.entity.dto;

import kz.kstu.almasov.diplomaproject.entity.user.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Past;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {

    private Long id;

    @Email(message = "user.email.correct.error")
    @NotBlank(message = "user.email.empty.error")
    private String email;

    private String oldEmail;

    @Temporal(TemporalType.DATE)
    @Past(message = "user.birthday.time.error")
    private Date birthday;

    private String firstName;
    private String secondName;
    private String patronymic;
    private String city;
    private String address;

    private String phone;

    private String skype;
    private String aboutMyself;

    public static UserDTO from(User user) {
        return new UserDTO(user.getId(), user.getEmail(), user.getEmail(), user.getBirthday(), user.getFirstName(),
                user.getSecondName(), user.getPatronymic(), user.getCity(), user.getAddress(), user.getPhone(),
                user.getSkype(), user.getAboutMyself());
    }

}
