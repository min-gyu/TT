package com.kh.tt.category.model.service;

import java.util.List;

import com.kh.tt.category.model.vo.CategoryVod;

public interface CategoryService {

	// 카테고리 - vod 조회순
	List<CategoryVod> countVodList(int cNo);

	// 카테고리 - vod 업로드순
	List<CategoryVod> latestVodList(int cNo);

}
