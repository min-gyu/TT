package com.kh.tt.category.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/category/")
public class CategoryController {

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
	
	@RequestMapping("vodList.ca")
	public String vodList() {
		return null;
	}
}
