package kz.kstu.almasov.diplomaproject.repository;

import kz.kstu.almasov.diplomaproject.entity.restaurant.Restaurant;
import kz.kstu.almasov.diplomaproject.entity.review.RestaurantReview;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface RestaurantReviewPageRepository extends PagingAndSortingRepository<RestaurantReview, Long> {

    Page<RestaurantReview> findByRestaurantId(Restaurant tamada, Pageable pageable);

}