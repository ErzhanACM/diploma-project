package kz.kstu.almasov.diplomaproject.repository;

import kz.kstu.almasov.diplomaproject.entity.review.TamadaReview;
import kz.kstu.almasov.diplomaproject.entity.user.Tamada;
import org.springframework.data.repository.CrudRepository;

public interface TamadaReviewRepository extends CrudRepository<TamadaReview, Long> {

    Iterable<TamadaReview> findByTamadaId(Tamada tamada);


}
