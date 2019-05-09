package kz.kstu.almasov.diplomaproject.entity.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
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

    @Transient
    private Double rating;

    private Integer servicesPrice;

    @ElementCollection
    @CollectionTable(name="tamada_language", joinColumns=@JoinColumn(name="tamada_id"))
    private List<String> languages;

    private Integer experience;

    private String workDescription;
}
