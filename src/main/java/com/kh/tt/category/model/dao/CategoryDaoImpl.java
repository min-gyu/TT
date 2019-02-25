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
	
	// 카테고리 - vod 조회순
	@Override
	public List<CategoryVod> countVodList(int cNo) {
		return sqlSession.selectList("Category.countVodList", cNo);
	}

	// 카테고리 - vod 조회순
	@Override
	public List<CategoryVod> latestVodList(int cNo) {
		return sqlSession.selectList("Category.latestVodList", cNo);
	}

}
