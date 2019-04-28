package kz.kstu.almasov.diplomaproject.repository;

import kz.kstu.almasov.diplomaproject.entity.user.Tamada;
import kz.kstu.almasov.diplomaproject.entity.user.User;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface TamadaRepository extends PagingAndSortingRepository<Tamada, Long> {


    Tamada findByUser(User user);
}
