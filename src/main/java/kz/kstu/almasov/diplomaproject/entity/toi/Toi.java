package kz.kstu.almasov.diplomaproject.entity.toi;

import kz.kstu.almasov.diplomaproject.entity.user.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.Future;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Toi {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotBlank(message = "Name of toi can not be empty!")
    @Length(max = 100, message = "Name of toi is too long! (more than 100 symbols)")
    private String name;

    @Enumerated(EnumType.STRING)
    private Type type;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User creator;

    @Basic
    @Temporal(TemporalType.DATE)
    @Future(message = "Date value should be in the future!")
    @NotNull(message = "Date value can not be empty!")
    private Date date;

    @NotBlank(message = "Whereabouts can not be empty!")
    private String whereabouts;

    @Enumerated(EnumType.STRING)
    private Place place;

    private Integer numberOfGuests;

    @Length(max = 255, message = "description is too long! (more than 100 symbols)")
    private String description;


}
