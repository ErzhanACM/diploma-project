package kz.kstu.almasov.diplomaproject.entity.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.util.List;
import java.util.Objects;

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

    @ElementCollection(fetch = FetchType.EAGER)
    @Fetch(value = FetchMode.SUBSELECT)
    @CollectionTable(name="tamada_language", joinColumns=@JoinColumn(name="tamada_id"))
    private List<String> languages;

    private Integer experience;
    private String workDescription;

    @ElementCollection(fetch = FetchType.EAGER)
    @Fetch(value = FetchMode.SUBSELECT)
    @CollectionTable(name="tamada_image_file", joinColumns=@JoinColumn(name="tamada_id"))
    private List<String> imageFileNames;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Tamada)) return false;
        Tamada tamada = (Tamada) o;
        return Objects.equals(id, tamada.id);
    }
}
