package pl.places.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pl.places.model.Place;

@Repository
public interface PlaceDao extends JpaRepository<Place, Long> {

}
