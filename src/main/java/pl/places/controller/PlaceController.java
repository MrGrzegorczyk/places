package pl.places.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pl.places.model.Place;
import pl.places.model.User;
import pl.places.service.PlaceService;

@Controller
public class PlaceController {

	@Autowired
	private PlaceService placeService;

	@RequestMapping(value = "/places", method = RequestMethod.GET)
	public String getPlacesPage(Model model) {

		List<Place> placeList = placeService.findAll();

		model.addAttribute("placesList", placeList);

		return "places";
	}

	@RequestMapping(value = "/places/my", method = RequestMethod.GET)
	public String getMyPlacesPage(Model model, @AuthenticationPrincipal User user) {

		List<Place> placeList = placeService.findAll(user.getId());

		model.addAttribute("myPlacesList", placeList);

		return "places-my";
	}

	@RequestMapping(value = "/place/create", method = RequestMethod.GET)
	public String getCreatePlaceForm(Model model, @AuthenticationPrincipal User user) {

		Place place = new Place();
		place.setUserId(user.getId());
		model.addAttribute("place", place);

		return "place-create";
	}

	@RequestMapping(value = "/place/edit/{id}", method = RequestMethod.GET)
	public String getEditPlaceForm(Model model, @PathVariable Long id) {

		Place place = placeService.findOne(id);

		model.addAttribute("place", place);

		return "place-create";
	}

	@RequestMapping(value = "/place/save", method = RequestMethod.POST)
	public String postCreatePlace(@ModelAttribute @Valid Place place, BindingResult result,
			@AuthenticationPrincipal User user) {

		if (result.hasErrors()) {
			for (ObjectError error : result.getAllErrors()) {
				System.out.println(error.toString());
			}
			return "place-create";
		}
		place.setUserId(user.getId());

		placeService.save(place);

		return "redirect:/places";
	}

	@RequestMapping(value = "/place/delete/{id}", method = RequestMethod.POST)
	public String postDeletePlace(@PathVariable Long id) {

		placeService.delete(id);

		return "redirect:/places";
	}

}
