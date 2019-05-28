package kz.kstu.almasov.diplomaproject.repository;

import kz.kstu.almasov.diplomaproject.entity.restaurant.Restaurant;
import kz.kstu.almasov.diplomaproject.entity.review.RestaurantReview;
import kz.kstu.almasov.diplomaproject.entity.review.TamadaReview;
import kz.kstu.almasov.diplomaproject.entity.user.Tamada;
import kz.kstu.almasov.diplomaproject.entity.user.User;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;

public interface RestaurantReviewRepository  extends CrudRepository<RestaurantReview, Long> {

    Iterable<RestaurantReview> findByRestaurantId(Restaurant restaurant);

    @Transactional
    @Modifying
    @Query("DELETE FROM RestaurantReview rr WHERE rr.id = :review_id")
    void deleteReview(@Param("review_id") Long review_id);

    TamadaReview findByRestaurantIdAndUserId(Restaurant restaurantId, User userId);
}
