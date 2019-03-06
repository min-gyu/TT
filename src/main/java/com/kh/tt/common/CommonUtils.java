package com.kh.tt.common;

import java.util.UUID;

import com.kh.tt.member.model.vo.Member;

public class CommonUtils {
	public static String getRandomString() {
		//32비트의 랜덤 문자를 생성해주는 메소드
		return UUID.randomUUID().toString().replaceAll("-", "");
		//-라는 특수문자가 있을 경우 제거해주는 메소드
	}
	
	/**
	 * @since : 2019.02.12
	 * @author : ljy
	 * @category : 이메일 6자리 인증 코드 발급
	 * */
	public String getEmailKeyCode() {
		//32비트의 랜덤 문자를 생성해주는 메소드
		String keyCode = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 6);//-라는 특수문자가 있을 경우 제거해주는 메소드
		return keyCode;
	}
}
