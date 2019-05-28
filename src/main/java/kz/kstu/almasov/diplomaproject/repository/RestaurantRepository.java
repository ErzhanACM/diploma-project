package kz.kstu.almasov.diplomaproject.repository;

import kz.kstu.almasov.diplomaproject.entity.restaurant.Restaurant;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

public interface RestaurantRepository extends PagingAndSortingRepository<Restaurant, Long> {

    @Query("SELECT r FROM Restaurant r WHERE (:name IS NULL OR LOWER(r.name) LIKE LOWER(:name)) AND (:city IS NULL OR r.city = :city) AND (:address IS NULL OR LOWER(r.address) LIKE :address) AND (:capacity IS NULL OR r.capacity >= :capacity) AND (:price IS NULL OR r.pricePerPerson <= :price)")
    Page<Restaurant> findByParameters(@Param("name") String name, @Param("city") String city, @Param("address") String address, @Param("capacity") Integer capacity, @Param("price") Integer price, Pageable pageable);

    @Query("SELECT r FROM Restaurant r JOIN r.administrator u WHERE u.id = :user_id")
    Page<Restaurant> findByAdministrator(@Param("user_id") Long user_id, Pageable pageable);
}
