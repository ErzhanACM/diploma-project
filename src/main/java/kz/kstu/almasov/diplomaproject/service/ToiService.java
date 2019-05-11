package kz.kstu.almasov.diplomaproject.service;

import kz.kstu.almasov.diplomaproject.entity.dto.SearchToiDTO;
import kz.kstu.almasov.diplomaproject.entity.toi.Place;
import kz.kstu.almasov.diplomaproject.entity.toi.Toi;
import kz.kstu.almasov.diplomaproject.entity.toi.Type;
import kz.kstu.almasov.diplomaproject.entity.user.Tamada;
import kz.kstu.almasov.diplomaproject.entity.user.User;
import kz.kstu.almasov.diplomaproject.repository.ToiRepository;
import kz.kstu.almasov.diplomaproject.repository.UserRepository;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

@Service
public class ToiService {

    @Autowired
    private ToiRepository toiRepository;

    @Autowired
    private UserService userService;

    public void createToi(User user, Toi toi) {
        toi.setCreator(user);
        toiRepository.save(toi);
    }

    public Page<Toi> getToiPage(Pageable pageable) {
        Page<Toi> toiList = toiRepository.findAll(pageable);
        return toiList;
    }

    public Page<Toi> getFavoriteToisOfUser(User user, Pageable pageable) {
        List<Toi> tois = user.getFavouriteTois();
        Page<Toi> page = new PageImpl<>(tois, pageable, tois.size());
        return page;
    }

    public Page<Toi> getToiPage(SearchToiDTO toi, Pageable pageable, boolean favorite, User user) {
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
        Page<Toi> page = toiRepository.findByParameters(name, type, toi.getDate1(), toi.getDate2(), toi.getCity(), toi.getNumberOfGuests(), place, toi.getCreator(), pageable);
        if (favorite) {
            page = checkFavoriteTois(page, pageable, user);
        }
        return page;
    }

    private Page<Toi> checkFavoriteTois(Page<Toi> page, Pageable pageable, User user) {
        List<Toi> favoriteTois = user.getFavouriteTois();
        List<Toi> tois = new ArrayList<>(page.getContent());
        Iterator<Toi> iterator = tois.iterator();
        while (iterator.hasNext()) {
            Toi toi = iterator.next();
            if (!favoriteTois.contains(toi)) {
                iterator.remove();
            }
        }
        Page<Toi> newPage = new PageImpl<>(tois, pageable, tois.size());
        return newPage;
    }

    private Sort orderBy(String sortOption) {
        return new Sort(Sort.Direction.ASC, sortOption);
    }

    public Page<Toi> getToiListOfUser(Pageable pageable, Long userId) {
        Page<Toi> toiList = toiRepository.findByCreator(userId, pageable);
        return toiList;
    }

    public boolean isFavorite(Toi toi, User user) {
        return user.getFavouriteTois().contains(toi);
    }
}
