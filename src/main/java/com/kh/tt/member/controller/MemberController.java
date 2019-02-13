package com.kh.tt.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.tt.common.CommonUtils;
import com.kh.tt.common.LoginLoggin;
import com.kh.tt.member.model.exception.LoginException;
import com.kh.tt.member.model.service.MemberService;
import com.kh.tt.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(LoginLoggin.class);
	
	@Autowired
	private MemberService ms;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	private CommonUtils commonUtils = new CommonUtils();
	
	private final String jspPath = "/member/";

	@RequestMapping("goMain.me")
	public String goMain() {
		return "main/mainPage";
	}

	@RequestMapping("loginView.me")
	public String showLoignView() {
		return jspPath + "login";
	}

	@RequestMapping("joinView.me")
	public String showJoinView() {
		return jspPath + "join";
	}

	@RequestMapping("reportView.me")
	public String showReportView() {
		return jspPath + "report";
	}

	@RequestMapping("inquireView.me")
	public String showInquireView() {
		return jspPath + "inquire";
	}

	@RequestMapping("login.me")
	public String loginCheck(Member m, Model model) {
		try {
			Member loginUser = ms.loginMember(m);
			model.addAttribute("loginUser", loginUser);
			return "redirect:goMain.me";
			
		} catch (LoginException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value="logout.me")
	public String logout(SessionStatus status) {
		// 세션의 상태를 확정지어주는 메소드
		status.setComplete();
		
		return "redirect:goMain.me";
	}
	
	@PostMapping(value = "insertMember.me")
	public String insertMember(Member m, Model model) {
	
		System.out.println("member > " + m);
		
		String encPassword = passwordEncoder.encode(m.getUserPwd());
		
		System.out.println("변경 후 암호 > " + encPassword);
		
		m.setUserPwd(encPassword);
		int result = ms.insertMember(m);
		
		if (result > 0) {
			return "redirect:goMain.me";
		} else {
			model.addAttribute("msg", "회원가입 실패 8ㅁ8");
			return "common/errorPage";
		}
		
	}
		
	/**
	 * @author jy
	 * @since 2019.02.12
	 * @category 중복 체크 로직
	 * @param type: 구분용
	 * 		 ,resultValue: jsp value
	 * */
	@RequestMapping(value = "/overlayCheck/{type}.me", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> overlayCheck(@RequestBody Map<String, Object> requestBody
															,@PathVariable String type){
		Map<String, Object> reqMap = (Map)requestBody.get("params");
		String resultValue = (String) reqMap.get("resultValue");
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		switch(type) {
			case "id" : 
				resultMap =  ms.idCheck(resultValue);
			break;
			
			case "nickName" : 
				resultMap =  ms.nickNameCheck(resultValue);
			break;
		}

		logger.info("resultValue : " + resultValue);
		
		return resultMap;
	}
	
	/**
	 * @author jy
	 * @since 2019.02.12
	 * @category 이메일 인증
	 * */
	
	  @RequestMapping(value = "/register", method = RequestMethod.POST)
	    public @ResponseBody HashMap<String, Object> RegisterPost(Member m, Model model,RedirectAttributes rttr) throws Exception{
		  HashMap<String, Object> resultMap = new HashMap<>();
		  
		  String keyCode = commonUtils.getEmailKeyCode();
		  
		  resultMap.put("keyCode", keyCode);
		  
		  return resultMap;
	      
	    }
	
}
