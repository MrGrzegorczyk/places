package pl.places.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pl.places.model.User;
import pl.places.model.User.Role;
import pl.places.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public String getUsersPage(Model model) {

		List<User> users = userService.findAll();
		model.addAttribute("usersList", users);
		return "users";
	}

	@RequestMapping(value = "/create-user", method = RequestMethod.GET)
	public String getUserForm() {
		return "user-create";
	}

	@RequestMapping(value = "/create-user", method = RequestMethod.POST)
	public String saveUser(@RequestParam(required = false) Long id, @RequestParam(required = true) String login,
			@RequestParam(required = true) String firstName, @RequestParam(required = true) String lastName,
			@RequestParam(required = true) String email, @RequestParam(required = true) String password) {

		Role role = Role.USER;
		User user = new User(login, firstName, lastName, email, password, role);
		user.setId(id);
		userService.save(user);
		return "redirect:/users";
	}

	@RequestMapping(value = "/users/delete/{id}", method = RequestMethod.POST)
	public String deleteUser(@PathVariable Long id) {

		userService.delete(id);

		return "redirect:/users";
	}

	@RequestMapping(value = "/users/edit/{id}", method = RequestMethod.GET)
	public String getUserEditPage(@PathVariable Long id, Model model) {

		User user = userService.findOne(id);
		model.addAttribute("user", user);
		return "user-create";
	}

}
