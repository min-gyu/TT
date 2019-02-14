package com.kh.tt.common;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;

import javax.mail.MessagingException;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

/**
 * @auth : 이주영
 * @since : 2019.02.13
 * @category : 이메일 인증 및 메일 관련 기능
 * */
@Component
public class MailUtils {
	private Logger logger = Logger.getLogger(getClass());
	
	private final String fromEmail  = "ljy960819@gmail.com";
	private CommonUtils commonUtils = new CommonUtils();
	private FileIO fileIO 			= new FileIOImpl();
	
	private MailHandler mailHandler;
	
	public MailUtils() { }
	
	public MailUtils(MailHandler mailHandler) {
		this.mailHandler = mailHandler;
	}
	
	public String sendAuthEmail(String toEmail) throws UnsupportedEncodingException, MessagingException {
		StringBuilder fileSB =  fileIO.read("auth.html");
		String keyCode 		 = commonUtils.getEmailKeyCode();
		String contentHtml 	 = fileSB.toString().replace("####", keyCode);
		String subject 		 = "인증번호를 확인해주세요.";
		mailHandler.sendEmail(fromEmail, toEmail, subject, contentHtml);
		return keyCode;
	}
}
