package kz.kstu.almasov.diplomaproject.repository;

import kz.kstu.almasov.diplomaproject.entity.toi.Place;
import kz.kstu.almasov.diplomaproject.entity.toi.Toi;
import kz.kstu.almasov.diplomaproject.entity.toi.Type;
import kz.kstu.almasov.diplomaproject.entity.user.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import java.util.Date;

public interface ToiRepository extends PagingAndSortingRepository<Toi, Long> {

    Page<Toi> findAll(Pageable page);

    @Query("FROM Toi t WHERE (:name IS NULL OR LOWER(t.name) LIKE LOWER(:name)) AND (:toiType IS NULL OR t.type = :toiType) AND ((CAST(:date1 AS date) IS NULL OR t.date >= :date1) AND (CAST(:date2 AS date) IS NULL OR t.date <= :date2)) AND (:city IS NULL OR t.city = :city) AND (:numberOfGuests IS NULL OR t.numberOfGuests >= :numberOfGuests) AND (:place IS NULL OR t.place >= :place)")
    Page<Toi> findByParameters(@Param("name") String name, @Param("toiType") Type type, @Param("date1") Date date1, @Param("date2") Date date2, @Param("city") String city, @Param("numberOfGuests") Integer numberOfGuests, @Param("place") Place place, Pageable pageable);

    @Query("SELECT t FROM Toi t JOIN t.creator u WHERE u.id = :user_id")
    Page<Toi> findByCreator(@Param("user_id") Long user_id, Pageable pageable);
}
