package kz.kstu.almasov.diplomaproject.repository;

import kz.kstu.almasov.diplomaproject.entity.user.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Long> {

    User findByUsername(String username);

    User findByActivationCode(String code);

    User findByEmail(String email);
}
