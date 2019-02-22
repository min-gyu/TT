package com.kh.tt.channel.model.vo;

import java.sql.Date;

public class Reply {
	 private int bNo; //게시물 번호
	 private int buNo; //작성자 번호
	 private String buId;//작성자 아이디
	 private String bnickName;//작성자 닉네임
	 private int bCate;//카테고리 번호
	 private String bTitle; //제목
	 private String bContent; //내용
	 private Date bwDate;//작성일
	 private Date bmDate;//수정일
	 private int bCount;//조회수
	 private int bLevel;//레벨
	 private int bupNo;//상위 게시물 번호
	 private String bAttachs;//첨부파일여부
	 private String bDels;//삭제상태
	 private String bType;//게시물 구분(VOD , 게시판)

}
