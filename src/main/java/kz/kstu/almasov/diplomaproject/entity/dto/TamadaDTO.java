package kz.kstu.almasov.diplomaproject.entity.dto;

import kz.kstu.almasov.diplomaproject.entity.user.Tamada;
import kz.kstu.almasov.diplomaproject.entity.user.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TamadaDTO {

    private Long id;

    private User user;

    private Double rating;
    private Integer servicesPrice;

    private List<String> languages;
    private Integer numberOfLanguages;
    private String experience;
    private String workDescription;

    public static TamadaDTO from(Tamada tamada) {
        return new TamadaDTO(tamada.getId(), tamada.getUser(), tamada.getRating(), tamada.getServicesPrice(),
                tamada.getLanguages(), tamada.getLanguages().size(), tamada.getExperience(), tamada.getWorkDescription());
    }

}
