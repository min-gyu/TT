package com.kh.tt.common;

import java.util.UUID;

public class CommonUtils {
	public static String getRandomString() {
		
		//32비트의 랜덤 문자를 생성해주는 메소드
		return UUID.randomUUID().toString().replaceAll("-", "");//-라는 특수문자가 있을 경우 제거해주는 메소드
	}
}
