package pl.places.service;

public interface EmailService {

	void sendEmail(String fromAddress, String toAddress, String subject, String body);

}
