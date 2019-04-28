package kz.kstu.almasov.diplomaproject.repository;

import kz.kstu.almasov.diplomaproject.entity.user.RestaurantAdmin;
import kz.kstu.almasov.diplomaproject.entity.user.Tamada;
import kz.kstu.almasov.diplomaproject.entity.user.User;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface RestaurantAdminRepository extends PagingAndSortingRepository<RestaurantAdmin, Long> {

    RestaurantAdmin findByUser(User user);
}
