package com.kh.tt.category.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tt.category.model.service.CategoryService;
import com.kh.tt.category.model.vo.CategoryVod;
import com.kh.tt.subscribe.model.service.SubscribeService;
import com.kh.tt.subscribe.model.vo.Subscribe;

@Controller
@RequestMapping("/category/")
public class CategoryController {
	@Autowired
	private CategoryService cs;

	private final String jspPath = "/category/";
	
	@RequestMapping(value="{kind}")
	public String views(@PathVariable Integer kind){
		String resultJsp = ""; 
		switch (kind) {
			case 1:
				
			break;
		}
		return resultJsp;
	}
	
	@RequestMapping("main.ca")
	public String goCategoryMain() {
		return jspPath + "main";
	}
	
	@RequestMapping("sports.ca")
	public String goCategorySports() {
		return jspPath + "sports";
	}
	
	@RequestMapping("vod.ca")
	public String goCategoryVod() {
		return jspPath + "vod";
	}
	
	@RequestMapping(value = "categCountVod.ca")
	public @ResponseBody List<CategoryVod> countVodList(Model model, HttpServletRequest request, HttpServletResponse response) {
		int cNo = Integer.parseInt(request.getParameter("cNo"));
		
		List<CategoryVod> cvList = cs.countVodList(cNo);

		return cvList;
	}
	
	@RequestMapping(value = "categLatestVod.ca")
	public @ResponseBody List<CategoryVod> latestVodList(Model model, HttpServletRequest request, HttpServletResponse response) {
		int cNo = Integer.parseInt(request.getParameter("cNo"));
		
		List<CategoryVod> lvList = cs.latestVodList(cNo);
		
		return lvList;
	}
	
	
	
	
}
