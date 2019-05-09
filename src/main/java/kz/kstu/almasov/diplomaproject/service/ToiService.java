package kz.kstu.almasov.diplomaproject.service;

import kz.kstu.almasov.diplomaproject.entity.dto.SearchToiDTO;
import kz.kstu.almasov.diplomaproject.entity.toi.Place;
import kz.kstu.almasov.diplomaproject.entity.toi.Toi;
import kz.kstu.almasov.diplomaproject.entity.toi.Type;
import kz.kstu.almasov.diplomaproject.entity.user.User;
import kz.kstu.almasov.diplomaproject.repository.ToiRepository;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Service
public class ToiService {

    @Autowired
    private ToiRepository toiRepository;

    public void createToi(User user, Toi toi) {
        toi.setCreator(user);
        toiRepository.save(toi);
    }

    public Page<Toi> getToiPage(Pageable pageable) {
        Page<Toi> toiList = toiRepository.findAll(pageable);
        return toiList;
    }

    public Page<Toi> getToiPage(SearchToiDTO toi, Pageable pageable) {
        String name = "%" + toi.getName() + "%";
        Type type = null;
        if (Strings.isNotEmpty(toi.getType())) {
            type = Type.valueOf(toi.getType().toUpperCase());
        }
        if (Strings.isEmpty(toi.getCity())) {
            toi.setCity(null);
        }
        Place place;
        if (Strings.isEmpty(toi.getPlace())) {
            place = null;
        } else {
            place = Place.valueOf(toi.getPlace().toUpperCase());
        }

        Page<Toi> page = toiRepository.findByParameters(name, type, toi.getDate1(), toi.getDate2(), toi.getCity(), toi.getNumberOfGuests(), place, pageable);
        return page;
    }

    private Sort orderBy(String sortOption) {
        return new Sort(Sort.Direction.ASC, sortOption);
    }

    public Page<Toi> getToiListOfUser(Pageable pageable, Long userId) {
        Page<Toi> toiList = toiRepository.findByCreator(userId, pageable);
        return toiList;
    }
}
