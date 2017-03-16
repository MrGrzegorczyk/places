package pl.places.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pl.places.model.Place;
import pl.places.service.PlaceService;

@Controller
public class PlaceController {

	@Autowired
	private PlaceService placeService;

	@RequestMapping(value = "/places", method = RequestMethod.GET)
	public String getPlacesPage(Model model) {

		List<Place> placeList = placeService.findAll();

		model.addAttribute("placeList", placeList);

		return "places";
	}

	@RequestMapping(value = "/place/create", method = RequestMethod.GET)
	public String getCreatePlaceForm(Model model) {

		model.addAttribute("place", new Place());

		return "place-create";
	}

	@RequestMapping(value = "/place/edit/{id}", method = RequestMethod.GET)
	public String getEditPlaceForm(Model model, @PathVariable Long id) {

		Place place = placeService.findOne(id);

		model.addAttribute("place", place);

		return "place-create";
	}

	@RequestMapping(value = "/place/save", method = RequestMethod.POST)
	public String postCreatePlace(@ModelAttribute @Valid Place place, BindingResult result) {

		if (result.hasErrors()) {
			return "place-create";
		}

		placeService.save(place);

		return "redirect:/places";
	}

	@RequestMapping(value = "/place/delete/{id}", method = RequestMethod.POST)
	public String postDeletePlace(@PathVariable Long id) {

		placeService.delete(id);

		return "redirect:/places";
	}

}
