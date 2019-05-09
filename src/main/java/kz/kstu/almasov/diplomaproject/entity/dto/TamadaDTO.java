package kz.kstu.almasov.diplomaproject.entity.dto;

import kz.kstu.almasov.diplomaproject.entity.user.Tamada;
import kz.kstu.almasov.diplomaproject.entity.user.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.Pattern;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TamadaDTO {

    private Long id;
    private User user;

    @Pattern(regexp = "\\d*", message = "rating.correct.error")
    private String rating;

    @Pattern(regexp = "\\d*", message = "services.price.correct.error")
    private String servicesPrice;

    private List<String> languages;
    private Integer numberOfLanguages;

    @Pattern(regexp = "\\d*", message = "experience.correct.error")
    private String experience;

    private String workDescription;

    public static TamadaDTO from(Tamada tamada) {
        return new TamadaDTO(tamada.getId(), tamada.getUser(), tamada.getRating().toString(),
                tamada.getServicesPrice().toString(), tamada.getLanguages(), tamada.getLanguages().size(),
                tamada.getExperience().toString(), tamada.getWorkDescription());
    }

}
