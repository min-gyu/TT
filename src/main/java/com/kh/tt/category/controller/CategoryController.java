package com.kh.tt.category.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/category/")
public class CategoryController {

	private final String jspPath = "/category/";
	
	@RequestMapping(value="main")
	public String main(){
		
		return jspPath + "/main";
	}
	
	@RequestMapping(value="{kind}")
	public String views(@PathVariable Integer kind){
		String resultJsp = ""; 
		switch (kind) {
			case 1:
				
			break;
		}
		return resultJsp;
	}
}
