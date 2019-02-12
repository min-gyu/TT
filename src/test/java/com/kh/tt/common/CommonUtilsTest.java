package com.kh.tt.common;

import java.io.UnsupportedEncodingException;
import java.util.Properties;
import java.util.UUID;

import javax.mail.MessagingException;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

public class CommonUtilsTest {

	private CommonUtils common;
	private MailHandler mail;
	private JavaMailSenderImpl javaMailSender;
	
	@Before
	public void init() throws MessagingException {
		common = new CommonUtils();
		javaMailSender = new JavaMailSenderImpl();
		
		javaMailSender.setHost("smtp.gmail.com");
		javaMailSender.setPort(587);
		javaMailSender.setUsername("ljy960819@gmail.com");
		javaMailSender.setPassword("wndud960819!");
		
		Properties  prop = javaMailSender.getJavaMailProperties();
					prop.setProperty("mail.transport.protocol", "smtp");
					prop.setProperty("mail.smtp.auth", "true");
					prop.setProperty("mail.smtp.starttls.enable", "true");
					prop.setProperty("mail.debug", "true");
		javaMailSender.setJavaMailProperties(prop);
		
		mail = new MailHandler(javaMailSender);
	}
	
	
	@Test
	@Ignore
	public void getEmailKeyCodeTest() {
		String key = common.getEmailKeyCode();
		System.out.println(key);
	}
	
	@Test
	public void sendEmailTest() throws UnsupportedEncodingException, MessagingException {
		String keyCode = common.getEmailKeyCode();
		String fromEmail = "ljy960819@gmail.com";
		String toEmail 	 = "ljy960819@gmail.com";
		String htmlContent = "<h1>테스트 용 인증 코드 : " + keyCode + "</h1>";
		
		mail.setEmailInfo(fromEmail, fromEmail, toEmail); // 이메일 정보
		mail.setSubject("인증코드는 " + keyCode + " 입니다."); // 제목
		mail.setContent(htmlContent); // 내용
		
		mail.send(); // 보내기
	}

	public void sendEmail(String keyCode, String toEmail, String fromEmail) {
		
	}
}
