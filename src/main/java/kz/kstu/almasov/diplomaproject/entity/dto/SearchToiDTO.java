package kz.kstu.almasov.diplomaproject.entity.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Basic;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SearchToiDTO {

    private String name;
    private String type;

    @Temporal(TemporalType.DATE)
    private Date date1;
    private Date date2;
    private String city;
    private String place;
    private Integer numberOfGuests;

    public Date getDate1() {
        return date1;
    }

    public void setDate1(Date date1) {
        this.date1 = date1;
    }
}
