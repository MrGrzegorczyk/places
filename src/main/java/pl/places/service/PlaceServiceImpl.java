package pl.places.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.places.dao.PlaceDao;
import pl.places.model.Place;

@Service
public class PlaceServiceImpl implements PlaceService {

	@Autowired
	private PlaceDao placeDao;

	@Override
	public List<Place> findAll() {
		return placeDao.findAll();
	}

	@Override
	public Place findOne(Long id) {
		return placeDao.findOne(id);
	}

	@Override
	public void save(Place place) {
		placeDao.save(place);
	}

	@Override
	public void delete(Long id) {
		placeDao.delete(id);
	}

	public List<Place> findLast10Places() {
		return placeDao.findTop10ByOrderByIdDesc();
	}

	@Override
	public List<Place> findAll(Long userId) {
		return placeDao.findByUserId(userId);
	}
}
