package pl.places.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pl.places.model.User;

@Repository
public interface UserDao extends JpaRepository<User, Long> {

	User findByEmail(String email);

}
