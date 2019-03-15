package kz.kstu.almasov.diplomaproject.repository;

import kz.kstu.almasov.diplomaproject.entity.toi.Toi;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ToiRepository extends CrudRepository<Toi, Long> {

    List<Toi> findByType(String type);
    
}
