package kz.kstu.almasov.diplomaproject.service;

import kz.kstu.almasov.diplomaproject.entity.Toi;
import kz.kstu.almasov.diplomaproject.entity.User;
import kz.kstu.almasov.diplomaproject.repository.ToiRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ToiService {

    @Autowired
    private ToiRepository toiRepository;

    public void createToi(User user, Toi toi) {
        toi.setCreator(user);
        toiRepository.save(toi);
    }

    public Iterable<Toi> getToiList(String filter) {
        Iterable<Toi> toiList;

        if (filter != null && !filter.isEmpty()) {
            toiList = toiRepository.findByType(filter);
        } else {
            toiList = toiRepository.findAll();
        }

        return toiList;
    }

    public Iterable<Toi> getToiList() {
        Iterable<Toi> toiList = toiRepository.findAll();
        return toiList;
    }
}
