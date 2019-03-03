package kz.kstu.almasov.diplomaproject.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Toi {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotBlank(message = "Name of toi can not be empty!")
   // @Length(max = 100, message = "Name of toi too long! (more than 100 symbols)")
    private String name;

    @NotBlank(message = "Type of toi can not be empty!")
    private String type;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User creator;

    public Toi(String name, String type, User creator) {
        this.name = name;
        this.type = type;
        this.creator = creator;
    }

    public String getCreatorUsername() {
        return creator != null ? this.creator.getUsername() : "<none>";
    }

    @Override
    public String toString() {
        return "Toi{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", type='" + type + '\'' +
                ", creator=" + creator +
                '}';
    }
}
