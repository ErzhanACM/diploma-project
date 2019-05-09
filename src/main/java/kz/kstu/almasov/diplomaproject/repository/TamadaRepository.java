package kz.kstu.almasov.diplomaproject.repository;

import kz.kstu.almasov.diplomaproject.entity.user.Tamada;
import kz.kstu.almasov.diplomaproject.entity.user.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

public interface TamadaRepository extends PagingAndSortingRepository<Tamada, Long> {

    Tamada findByUser(User user);

    Page<Tamada> findAll(Pageable page);

    @Query("FROM Tamada t WHERE (:servicesPrice IS NULL OR t.servicesPrice <= :servicesPrice) AND (:experience IS NULL OR t.experience >= :experience)")
    Page<Tamada> findByParameters(@Param("servicesPrice") Integer servicesPrice, @Param("experience") Integer experience, Pageable pageable);
}
