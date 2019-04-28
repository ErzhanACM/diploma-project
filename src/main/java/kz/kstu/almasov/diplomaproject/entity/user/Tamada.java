package kz.kstu.almasov.diplomaproject.entity.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.lang.Nullable;

import javax.persistence.*;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Pattern;
import java.math.BigDecimal;
import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Tamada {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="user_id")
    private User user;

    private Double rating;
    private Integer servicesPrice;

    @ElementCollection
    @CollectionTable(name="tamada_language", joinColumns=@JoinColumn(name="tamada_id"))
    private List<String> languages;

    @Pattern(regexp = "\\d*", message = "experience.correct.error")
    private String experience;

    private String workDescription;
}
