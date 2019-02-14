package com.kh.tt.admin.model.dao;

import java.util.List;

import com.kh.tt.admin.model.exception.AdminException;
import com.kh.tt.member.model.vo.Member;

public interface AdminDao {

	List<Member> selectMemberList() throws AdminException;

	List<Member> selectBanList() throws AdminException;

	List<Member> selectLeaveList() throws AdminException;

}
