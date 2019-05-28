package kz.kstu.almasov.diplomaproject.entity.restaurant;

import kz.kstu.almasov.diplomaproject.entity.toi.Toi;
import kz.kstu.almasov.diplomaproject.entity.user.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.List;
import java.util.Objects;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Restaurant {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User administrator;

    private String avatarFileName;

    @NotBlank(message = "restaurant.name.empty.error")
    @Length(max = 100, message = "restaurant.name.length.error")
    private String name;

    @Transient
    private Double rating;

    private Integer pricePerPerson;
    private Integer capacity;

    @NotBlank(message = "restaurant.city.empty.error")
    private String city;

    @NotBlank(message = "restaurant.address.empty.error")
    private String address;

    @NotBlank(message = "restaurant.description.empty.error")
    @Length(max = 1000, message = "restaurant.description.length.error")
    private String description;

    @ElementCollection
    @CollectionTable(name="restaurant_image_file", joinColumns=@JoinColumn(name="restaurant_id"))
    private List<String> imageFileNames;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Restaurant restaurant = (Restaurant) o;
        return Objects.equals(id, restaurant.id);
    }

}
