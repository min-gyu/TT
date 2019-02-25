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
	
	// 카테고리 - vod 조회순
	@Override
	public List<CategoryVod> countVodList(int cNo) {
		return cd.countVodList(cNo);
	}

	// 카테고리 - vod 업로드순
	@Override
	public List<CategoryVod> latestVodList(int cNo) {
		return cd.latestVodList(cNo);
	}

}
