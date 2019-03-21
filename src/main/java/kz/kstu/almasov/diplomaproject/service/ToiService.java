package kz.kstu.almasov.diplomaproject.service;

import kz.kstu.almasov.diplomaproject.entity.toi.Toi;
import kz.kstu.almasov.diplomaproject.entity.user.User;
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
        System.out.println("TOI SAVED TO DB\n____________\n" + toi + "\n___________\n");
    }

    public Iterable<Toi> getToiList() {
        Iterable<Toi> toiList = toiRepository.findAll();
        return toiList;
    }
}
