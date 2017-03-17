package pl.places.service;

import java.util.List;

import pl.places.model.Place;

public interface PlaceService {

	List<Place> findAll();

	Place findOne(Long id);

	void save(Place place);

	void delete(Long id);

	List<Place> findLast10Places();

	List<Place> findAll(Long userId);
}
