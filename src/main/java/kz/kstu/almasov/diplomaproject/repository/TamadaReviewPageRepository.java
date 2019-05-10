package kz.kstu.almasov.diplomaproject.repository;

import kz.kstu.almasov.diplomaproject.entity.review.TamadaReview;
import kz.kstu.almasov.diplomaproject.entity.toi.Toi;
import kz.kstu.almasov.diplomaproject.entity.user.Tamada;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;


public interface TamadaReviewPageRepository extends PagingAndSortingRepository<TamadaReview, Long> {

    Page<TamadaReview> findByTamadaId(Tamada tamada, Pageable pageable);

}
