package kz.kstu.almasov.diplomaproject.repository;

import kz.kstu.almasov.diplomaproject.entity.review.TamadaReview;
import kz.kstu.almasov.diplomaproject.entity.toi.Toi;
import kz.kstu.almasov.diplomaproject.entity.user.Tamada;
import kz.kstu.almasov.diplomaproject.entity.user.User;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;

public interface TamadaReviewRepository extends CrudRepository<TamadaReview, Long> {

    Iterable<TamadaReview> findByTamadaId(Tamada tamada);

    @Transactional
    @Modifying
    @Query("DELETE FROM TamadaReview tr WHERE tr.id = :review_id")
    void deleteReview(@Param("review_id") Long review_id);

    TamadaReview findByTamadaIdAndUserId(Tamada tamadaId, User userId);
}
