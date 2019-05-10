package kz.kstu.almasov.diplomaproject.service;

import kz.kstu.almasov.diplomaproject.entity.dto.TamadaDTO;
import kz.kstu.almasov.diplomaproject.entity.review.TamadaReview;
import kz.kstu.almasov.diplomaproject.entity.user.Language;
import kz.kstu.almasov.diplomaproject.entity.user.Tamada;
import kz.kstu.almasov.diplomaproject.entity.user.User;
import kz.kstu.almasov.diplomaproject.repository.TamadaRepository;
import kz.kstu.almasov.diplomaproject.repository.TamadaReviewPageRepository;
import kz.kstu.almasov.diplomaproject.repository.TamadaReviewRepository;
import kz.kstu.almasov.diplomaproject.validation.UserValidator;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.validation.Valid;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class TamadaService {

    @Autowired
    private TamadaRepository tamadaRepository;

    @Autowired
    private TamadaReviewRepository tamadaReviewRepository;

    @Autowired
    private TamadaReviewPageRepository tamadaReviewPageRepository;

    @Autowired
    private UserValidator userValidator;

    public Tamada getTamada(User user) {
        Tamada tamada = tamadaRepository.findByUser(user);
        if (tamada != null) {
            Double rating = getRatingFromRewievs(tamada);
            tamada.setRating(rating);
        }
        return tamada;
    }

    public boolean updateTamada(Tamada tamada, Model model, Map<String, String> form) {
        if (!userValidator.validate(tamada)) {
            model.mergeAttributes(userValidator.getErrorMap());
            model.addAttribute("tamada", tamada);
            return false;
        }
        Set<String> languages = getLanguagesAsSet();
        tamada.setLanguages(new ArrayList<>());
        for (String key : form.keySet()) {
            if (languages.contains(key.toUpperCase())) {
                tamada.getLanguages().add(key);
            }
        }
        tamadaRepository.save(tamada);
        return true;
    }

    private Set<String> getLanguagesAsSet() {
        Set<String> languages = Arrays.stream(Language.values()).map(Language::name).collect(Collectors.toSet());
        return languages;
    }

    public Page<Tamada> getTamadaPage(Pageable pageable) {
        Page<Tamada> page = tamadaRepository.findAll(pageable);
        setRatingFromReviews(page);
        return page;
    }

    public Page<Tamada> getTamadaPage(TamadaDTO tamada, Pageable pageable, Map<String, String> form) {
        Double rating = 0.0;
        if (Strings.isNotEmpty(tamada.getRating())) {
            rating = new Double(tamada.getRating());
        }
        Integer servicesPrice = null;
        if (Strings.isNotEmpty(tamada.getServicesPrice())) {
            servicesPrice = new Integer(tamada.getServicesPrice());
        }
        Integer experience = null;
        if (Strings.isNotEmpty(tamada.getExperience())) {
            experience = new Integer(tamada.getExperience());
        }
        Page<Tamada> page = tamadaRepository.findByParameters(servicesPrice, experience, pageable);
        setRatingFromReviews(page);

        Set<String> languages = getLanguagesAsSet();
        List<String> languagesFromForm = new ArrayList<>();
        for (String key : form.keySet()) {
            if (languages.contains(key.toUpperCase())) {
                languagesFromForm.add(key);
            }
        }
        return removeTamadasByRatingAndLanguages(page, rating, languagesFromForm, pageable);
    }

    private Page<Tamada> removeTamadasByRatingAndLanguages(Page<Tamada> page, Double rating, List<String> languages, Pageable pageable) {
        List<Tamada> tamadas = new ArrayList<>(page.getContent());
        Iterator<Tamada> iterator = tamadas.iterator();
        while (iterator.hasNext()) {
            Tamada tamada = iterator.next();
            boolean ratingCase = (rating == 0.0) || (tamada.getRating() >= rating);
            boolean languagesCase = !checkLanguages(tamada, languages);
            if (!ratingCase || languagesCase) {
                iterator.remove();
            }
        }
        Page<Tamada> newPage = new PageImpl<>(tamadas, pageable, tamadas.size());
        return newPage;
    }

    private boolean checkLanguages(Tamada tamada, List<String> languages) {
        for (String language : languages) {
            if (!tamada.getLanguages().contains(language)) {
                return false;
            }
        }
        return true;
    }


    private void setRatingFromReviews(Page<Tamada> page) {
        for (Tamada tamada : page.getContent()) {
            tamada.setRating(getRatingFromRewievs(tamada));
        }
    }

    private Double getRatingFromRewievs(Tamada tamada) {
        List<TamadaReview> reviews = getListFromIterable(tamadaReviewRepository.findByTamadaId(tamada));
        double sum = 0;
        for (TamadaReview review : reviews) {
            sum += review.getRating();
        }
        int reviewsNumber = reviews.size();
        Double rating = 0.0;
        if (reviewsNumber != 0) {
            rating = sum / reviewsNumber;
        }
        return rating;
    }

    private List<TamadaReview> getListFromIterable(Iterable<TamadaReview> reviews) {
        List<TamadaReview> list = new ArrayList<>();
        for (TamadaReview review : reviews) {
            list.add(review);
        }
        return list;
    }

    public void saveReview(TamadaReview tamadaReview) {
        tamadaReviewRepository.save(tamadaReview);
    }

    public Page<TamadaReview> getTamadaReviewPage(Tamada tamada, Pageable pageable) {
        return tamadaReviewPageRepository.findByTamadaId(tamada, pageable);
    }

    public void deleteTamadaReview(TamadaReview review) {
        tamadaReviewRepository.deleteReview(review.getId());
    }
}
