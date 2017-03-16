package pl.places.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pl.places.config.SecurityConfig;
import pl.places.model.User;
import pl.places.service.EmailService;
import pl.places.service.UserService;

@Controller
public class MainController {

	@Autowired
	private UserService userService;

	@Autowired
	private EmailService emailService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getMainPage() {

		return "main";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getLoginPage() {

		return "login";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String getRegisterPage() {

		return "register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(@ModelAttribute User user) {

		try {
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(SecurityConfig.PASSWORD_STRENGHT);
			String encodedPassword = encoder.encode(user.getPassword());
			user.setPassword(encodedPassword);
			userService.save(user);

		} catch (Exception e) {

			return "redirect:/register";
		}

		emailService.sendEmail("noreply@places.pl", user.getEmail(), getRegisterEmailSubject(user),
				getRegisterEmailBody(user));

		return "redirect:/login";
	}

	private String getRegisterEmailSubject(User user) {
		return "Welcome " + user.getFirstName();
	}

	private String getRegisterEmailBody(User user) {
		return "Hi " + user.getFirstName() + ",\nWelcome in Places.pl \nBest, \nTeam Places.pl";
	}

}
