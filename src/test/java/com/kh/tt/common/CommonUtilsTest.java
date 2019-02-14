package com.kh.tt.common;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.util.Properties;

import javax.mail.MessagingException;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import org.apache.log4j.Logger;

//@RunWith(SpringJUnit4ClassRunner.class)
public class CommonUtilsTest {
	private Logger logger = Logger.getLogger(getClass());
	private CommonUtils common;
	private MailHandler mail;
	private JavaMailSenderImpl javaMailSender;
	
	@Before
	@Ignore
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
	public void test() {
		String path = FileSystems.getDefault().getPath(".").toAbsolutePath().toString();
        System.out.println("현재 프로젝트의 경로 : " + path );
	}
	
	@Test
	@Ignore
	public void mailContent() {
		
		FileIO fileIO = new FileIOImpl();
		//String projectPath = System.getProperty("user.dir");
		//C:\Users\cstonny\eclipse\jee-oxygen\eclipse\src\main\webapp\WEB-INF\views\common\email\auth.html
		//C:\Users\cstonny\eclipse\jee-oxygen\eclipse\src\main\webapp\WEB-INF\views\common\email\auth.html
		//C:\Users\cstonny\git\TT\src\main\webapp\WEB-INF\views\common\email
		StringBuilder fileSB =  fileIO.read("auth.html");
		
		String convertStr = "####";
		String key = common.getEmailKeyCode();
		
		String contentHtml = fileSB.toString().replace(convertStr, key);

		logger.info(contentHtml);
	}
	
	@Test
	@Ignore
	public void getEmailKeyCodeTest() {
		String key = common.getEmailKeyCode();
		System.out.println(key);
	}
	
	@Test
	@Ignore
	public void sendEmailTest() throws UnsupportedEncodingException, MessagingException {
		String keyCode = common.getEmailKeyCode();
		String fromEmail = "ljy960819@gmail.com";
		String toEmail 	 = "ljy960819@gmail.com";
		String subject = "인증코드는 " + keyCode + " 입니다.";
		String htmlContent = "<h1>테스트 용 인증 코드 : " + keyCode + "</h1>";

		/*
		mail.setEmailInfo(fromEmail, fromEmail, toEmail); // 이메일 정보
		mail.setSubject("인증코드는 " + keyCode + " 입니다."); // 제목
		mail.setContent(htmlContent); // 내용
		mail.send(); // 보내기
		*/
		
		mail.sendEmail(fromEmail, toEmail, subject, htmlContent);
	}

	public void sendEmail(String keyCode, String toEmail, String fromEmail) {
		
	}
}
