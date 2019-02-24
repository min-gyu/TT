package com.kh.tt.category.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.kh.tt.category.model.vo.CategoryVod;

@Repository
public class CategoryDaoImpl implements CategoryDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 카테고리 - vod
	@Override
	public List<CategoryVod> vodList(int cNo) {
		return sqlSession.selectList("Category.vodList", cNo);
	}

}
