package com.kh.tt.common;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

//메일 보내기 유틸
public class MailHandler {	
	private JavaMailSender mailSender;
    private MimeMessage message;
    private MimeMessageHelper messageHelper;
    
    public MailHandler() { }
    
    public MailHandler(JavaMailSender mailSender) throws MessagingException {
    	this.mailSender = mailSender;
    	this.message 	   = this.mailSender.createMimeMessage();
        this.messageHelper = new MimeMessageHelper(message, true, "UTF-8");
    }
    
    // 이메일 보내기
    public void sendEmail(String fromEmail, String toEmail, String subject, String content) throws UnsupportedEncodingException, MessagingException {
		setEmailInfo(fromEmail, fromEmail, toEmail); // 이메일 정보
		setSubject(subject); // 제목
		setContent(content); // 내용
		send(); 			 // 보내기
	}
    
    // 이메일 타이틀
    private void setSubject(String subject) throws MessagingException {
        messageHelper.setSubject(subject);
    }
    
    // 이메일 내용
    private void setContent(String htmlContent) throws MessagingException {
        messageHelper.setText(htmlContent, true);
    }
    
    //보내는 사람 이메일, 받는 사람 이메일
    private void setEmailInfo(String fromEmail, String fromName, String toEmail) throws UnsupportedEncodingException, MessagingException{
    	messageHelper.setFrom(fromEmail, fromName); // 보내는 사람
    	messageHelper.setTo(toEmail); // 받는사람
    }
    
    private void addInline(String contentId, DataSource dataSource) throws MessagingException {
        messageHelper.addInline(contentId, dataSource);
    }
    
    private void send() {
        mailSender.send(message);
    }
}
