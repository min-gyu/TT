package com.kh.tt.category.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tt.category.model.dao.CategoryDao;
import com.kh.tt.category.model.vo.CategoryVod;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CategoryDao cd;
	
	// 카테고리 - vod
	@Override
	public List<CategoryVod> vodList(int cNo) {
		return cd.vodList(cNo);
	}

}
