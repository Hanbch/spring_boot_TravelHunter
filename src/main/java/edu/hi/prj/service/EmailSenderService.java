package edu.hi.prj.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;





@Service
public class EmailSenderService {
	@Autowired
	private JavaMailSender mailSender;

	public void sendEmail(String memail, String subject, String body) {
		SimpleMailMessage message = new SimpleMailMessage();
		
		message.setFrom("travel03188@gmail.com");
		message.setTo(memail);//수신자이메일
		message.setText(body);//메일내용
		message.setSubject(subject);//메일제목
		
		mailSender.send(message);
		
		System.out.println("Mail Sent Successfully...");
	}



}
