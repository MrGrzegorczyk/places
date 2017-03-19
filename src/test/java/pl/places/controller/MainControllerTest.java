package pl.places.controller;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;

import pl.places.model.User;
import pl.places.model.User.Role;
import pl.places.service.EmailService;
import pl.places.service.UserService;

@RunWith(MockitoJUnitRunner.class)
public class MainControllerTest {

	@Mock
	private UserService userService;
	@Mock
	private EmailService emailService;
	@InjectMocks
	private MainController controller = new MainController();

	@Test
	public void shouldRegisterUser() {
		User user = new User("Testuser", "John", "Shith", "john@gmail.com", "testpass1234", Role.USER);
		String view = controller.register(user);

		assertEquals("redirect:/login", view);
	}

}
