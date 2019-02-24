package com.kh.tt.category.model.dao;

import java.util.List;

import com.kh.tt.category.model.vo.CategoryVod;

public interface CategoryDao {

	// 카테고리 - vod
	List<CategoryVod> vodList(int cNo);

}
