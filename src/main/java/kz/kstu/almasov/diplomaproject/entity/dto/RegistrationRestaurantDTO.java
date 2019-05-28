package kz.kstu.almasov.diplomaproject.entity.dto;

import kz.kstu.almasov.diplomaproject.entity.user.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RegistrationRestaurantDTO {

    private Long id;
    private User administrator;
    private String avatarFileName;

    @NotBlank(message = "restaurant.name.empty.error")
    @Length(max = 100, message = "restaurant.name.length.error")
    private String name;

    @Pattern(regexp = "\\d*", message = "rating.correct.error")
    private String rating;

    @NotBlank(message = "restaurant.pricePerPerson.empty.error")
    @Pattern(regexp = "\\d*", message = "pricePerPerson.correct.error")
    private String pricePerPerson;

    @NotBlank(message = "restaurant.capacity.empty.error")
    @Pattern(regexp = "\\d*", message = "capacity.correct.error")
    private String capacity;

    @NotBlank(message = "restaurant.city.empty.error")
    private String city;

    @NotBlank(message = "restaurant.address.empty.error")
    private String address;

    @NotBlank(message = "restaurant.description.empty.error")
    @Length(max = 1000, message = "restaurant.description.length.error")
    private String description;

    private List<String> imageFileNames;
}
