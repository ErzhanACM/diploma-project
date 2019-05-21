package kz.kstu.almasov.diplomaproject.entity.review;

import kz.kstu.almasov.diplomaproject.entity.restaurant.Restaurant;
import kz.kstu.almasov.diplomaproject.entity.user.Tamada;
import kz.kstu.almasov.diplomaproject.entity.user.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class RestaurantReview {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="restaurant_id")
    private Restaurant restaurantId;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="user_id")
    private User userId;

    @NotNull(message = "review.rating.null.error")
    private Integer rating;

    @Length(max = 255, message = "review.text.length.error")
    private String text;

    @Length(max = 30, message = "review.headline.length.error")
    @NotBlank(message = "review.headline.null.error")
    private String headline;

    @Temporal(TemporalType.DATE)
    private Date date;
}