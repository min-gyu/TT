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
    
    public MailHandler(JavaMailSender mailSender) throws MessagingException {
        this.mailSender = mailSender;
        message = this.mailSender.createMimeMessage();
        messageHelper = new MimeMessageHelper(message, true, "UTF-8");
    }
    
    
    // 이메일 타이틀
    public void setSubject(String subject) throws MessagingException {
        messageHelper.setSubject(subject);
    }
    
    // 이메일 내용
    public void setContent(String htmlContent) throws MessagingException {
        messageHelper.setText(htmlContent, true);
    }
    
    //보내는 사람 이메일, 받는 사람 이메일
    public void setEmailInfo(String fromEmail, String fromName, String toEmail) throws UnsupportedEncodingException, MessagingException{
    	messageHelper.setFrom(fromEmail, fromName); // 보내는 사람
    	messageHelper.setTo(toEmail); // 받는사람
    }
    
    public void addInline(String contentId, DataSource dataSource) throws MessagingException {
        messageHelper.addInline(contentId, dataSource);
    }
    
    public void send() {
        mailSender.send(message);
    }
}
