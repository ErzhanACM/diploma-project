package kz.kstu.almasov.diplomaproject.entity.dto;

import kz.kstu.almasov.diplomaproject.entity.user.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SearchRestaurantDTO {

    private Long id;
    private User administrator;
    private String avatarFileName;

    private String name;

    @Pattern(regexp = "\\d*", message = "rating.correct.error")
    private String rating;

    @Pattern(regexp = "\\d*", message = "pricePerPerson.correct.error")
    private String pricePerPerson;

    @Pattern(regexp = "\\d*", message = "capacity.correct.error")
    private String capacity;

    private String city;
    private String address;

    private String description;

    private List<String> imageFileNames;
}
