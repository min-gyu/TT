package com.kh.tt.category.model.service;

import java.util.List;

import com.kh.tt.category.model.vo.CategoryVod;

public interface CategoryService {

	// 카테고리 - vod
	List<CategoryVod> vodList(int cNo);

}
