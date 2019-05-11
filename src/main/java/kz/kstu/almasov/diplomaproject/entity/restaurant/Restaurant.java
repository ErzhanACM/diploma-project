package kz.kstu.almasov.diplomaproject.entity.restaurant;

import kz.kstu.almasov.diplomaproject.entity.user.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.List;

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
    private String city;
    private String address;
    private String description;

    @ElementCollection
    @CollectionTable(name="restaurant_image_file", joinColumns=@JoinColumn(name="restaurant_id"))
    private List<String> imageFileNames;

}
