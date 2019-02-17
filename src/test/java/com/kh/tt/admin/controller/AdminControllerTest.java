package com.kh.tt.admin.controller;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.tt.admin.model.dao.AdminDaoImpl;
import com.kh.tt.admin.model.exception.AdminException;
import com.kh.tt.admin.model.service.AdminService;
import com.kh.tt.admin.model.service.AdminServiceImpl;
import com.kh.tt.member.model.vo.Member;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;

public class AdminControllerTest {
	
	private AdminDaoImpl dao;
	
	@Before
	public void init() {
		dao = new AdminDaoImpl();
	}
	
	@Test
	public void memberListTest() throws AdminException {
		//List<Member> mList = svc.selectMemberList();
		//List<Member> mList = dao.selectMemberList();
		//System.out.println(mList);
		
		
	}

}
