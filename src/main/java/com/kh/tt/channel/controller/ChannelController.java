package com.kh.tt.channel.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tt.common.CommonUtils;
import com.kh.tt.common.PageInfo;
import com.kh.tt.member.model.service.MemberService;
import com.kh.tt.member.model.vo.Member;
import com.kh.tt.channel.model.service.ChannelService;
import com.kh.tt.channel.model.vo.Attachment;
import com.kh.tt.channel.model.vo.Board;
import com.kh.tt.channel.model.vo.pagination;

@Controller
public class ChannelController {
	@Autowired
	private ChannelService cs;

	// ---------채널 ----------------
	@RequestMapping("sidebar.ch")
	public String NewFile() {
		return "channel/NewFile";
	}

	// 채널 메인
	@RequestMapping("goChannel.ch")
	public ModelAndView goChannel(@RequestParam int uNo, Member m) {
		System.out.println("채널주인회원번호 : " + uNo);
		ModelAndView mav = new ModelAndView();
		m = cs.selectmInfo(uNo);
		System.out.println(m);
		mav.setViewName("channel/channel");
		mav.addObject("m", m);
		return mav;

	}

	// VOD리스트 페이지
	@RequestMapping("vod_List.ch")
	public ModelAndView vod_List(HttpServletRequest request, Board b, @RequestParam(defaultValue = "1") int curPage,
			int CuNo, Member m) {

		m = cs.selectmInfo(CuNo);
		int listCount = cs.getLisCount(b);

		pagination pagination = new pagination(listCount, curPage);

		System.out.println(pagination);

		List<Board> list = cs.vodList(pagination.getStartIndex(), pagination.getPageSize());

		ModelAndView mav = new ModelAndView();
		mav.setViewName("channel/vod_List");
		mav.addObject("list", list);
		mav.addObject("listCount", listCount);
		mav.addObject("pagination", pagination);
		mav.addObject("m", m);
		return mav;

	}

	// VOD상세보기 페이지
	@RequestMapping("vod_oneList.ch")
	public ModelAndView vod_oneList(@RequestParam int bNo, HttpSession session, int CuNo, Member m, String msg) {
		System.out.println(bNo);
		System.out.println("vod_oneList.ch : " + CuNo);
		m = cs.selectmInfo(CuNo);
		cs.increaseViewC(bNo, session);
		System.out.println(msg);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("channel/vod_oneList");
		Board b = cs.vodOne(bNo);

		Attachment a = cs.vodOneR(bNo);
		mav.addObject("b", b);
		System.out.println("경로뽑기  " + a.getAtPath());
		System.out.println("바뀐이름  " + a.getAtMName());
		mav.addObject("a", a);
		mav.addObject("m", m);
		mav.addObject("msg", msg);

		/* return "channel/vod_oneList"; */
		return mav;
	}

	// 구독하기 메소드-채널번호 , 로그인 회원 번호
	@RequestMapping("addSubscribe.ch")
	public String addSubscribe(Model model, int uNo, int CuNo, int bNo) {
		System.out.println("구독 : " + CuNo);// 채널 번호
		System.out.println("구독 : " + uNo);// 로그인 회원 아이디
		System.out.println("구독 : " + bNo);// 게시물번호
		int result = cs.addSubscirbe(CuNo, uNo);
		System.out.println("결과 확인 : " + result);
		if (result == 1) {
			model.addAttribute("msg", "이미 구독 하셨습니다!");
			model.addAttribute("CuNo", CuNo);

		} else {
			model.addAttribute("msg", "구독이 완료되었습니다!");
		}
		model.addAttribute("CuNo", CuNo);
		return "redirect:vod_oneList.ch" + "?bNo=" + bNo;

	}

	// 게시물 번호 , 로그인 회원번호 , 채널 번호 , 내용
	@RequestMapping("insertDet.ch")
	public String insertDet(Board db, HttpSession session, @RequestParam(value = "ReplyContent") String ReplyContent,
			@RequestParam(value = "CuNo") int CuNo, @RequestParam(value = "bNo") int bNo,
			@RequestParam(value="uNo")int uNo) {
		
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("CuNo", CuNo);//채널 번호
		map.put("ReplyContent",ReplyContent);//댓글 내용
		map.put("uNo", uNo);//작성자 번호
		map.put("bNo", bNo);//게시물 번호
		
		cs.insertDet(map);//댓글 추가 완료
		
		
		return null;
	}

	// 게시판 리스트 페이지
	@RequestMapping("board_List.ch")
	public String board_List() {

		return "channel/board_List";
	}

	// 게시판 작성 페이지
	@RequestMapping("board_write.ch")
	public String board_write() {
		return "channel/board_write";
	}

	// 게시판 상세보기 페이지
	@RequestMapping("board_oneList.ch")
	public String board_oneList(Model model, Board b) {

		return "channel/board_oneList";
	}

	// 게시판 수정하기 페이지
	@RequestMapping("update_board.ch")
	public String board_update() {
		return "channel/update_board";
	}

	// 게시판 신고하기 팝업 페이지
	@RequestMapping("report.ch")
	public String report() {
		return "channel/reportMessage";
	}

	// VOD업로드 메소드
	@RequestMapping("insertvod.ch")
	public String insertvod(Model model, Board b, Attachment a, HttpSession session, HttpServletRequest request,
			@RequestParam(value = "video", required = false) MultipartFile video) {

		System.out.println("Board" + b);
		System.out.println("Video" + video);

		String root = request.getSession().getServletContext().getRealPath("resources");

		String filePath = root + "\\uploadFiles";

		System.out.println("filePath" + filePath);

		String originFileName = video.getOriginalFilename();
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		String changeName = CommonUtils.getRandomString();

		System.out.println("changeName" + changeName);

		try {
			video.transferTo(new File(filePath + "\\" + changeName + ext));

			System.out.println(video);

			cs.insertVod(b);

			System.out.println(originFileName);
			System.out.println(changeName);
			System.out.println(filePath);

			// 게시물 번호 뽑아오기 --start
			cs.selectbNo(b);
			Board boardOne = cs.selectbNo(b);
			int bNo = boardOne.getbNo();
			// 게시물 번호 뽑아오기 --end

			a.setAtName(originFileName);
			a.setAtMName(changeName);
			a.setAtPath(filePath);
			a.setAtBno(bNo);

			cs.insertAt(a);

			return "redirect:goVodAdmin.ch";// VOD관리 페이지로 이동

		} catch (Exception e) {
			new File(filePath + "\\" + changeName + ext).delete();

			model.addAttribute("msg", "VOD 업로드 실패!");
			return "common/errorPage";
		}

	}

	// ---------관리자------------
	@RequestMapping("manage_C.ch")
	public String manage_C(int CuNo, Member m) {

		System.out.println(CuNo);
		return "channel_admin/channel_admin";
	}

	@RequestMapping("manage_Black.ch")
	public String manage_Black() {
		return "channel_admin/channel_black";
	}

	@RequestMapping("manage_Chat.ch")
	public String manage_Chat() {
		return "channel_admin/channel_chat";
	}

	@RequestMapping("manage_Cate.ch")
	public String manage_Cate() {
		return "channel_admin/channel_category";
	}

	// VOD 관리페이지로 이동시키는 메서드
	@RequestMapping("goVodAdmin.ch")
	public ModelAndView goVodAdmin(HttpServletRequest request, Board b, @RequestParam(defaultValue = "1") int curPage) {

		List<Board> list;
		System.out.println("현재 페이지" + curPage);
		int listCount = cs.getLisCount(b);

		pagination pagination = new pagination(listCount, curPage);
		System.out.println("pagination" + pagination);

		if (curPage == 1) {

			list = cs.vodList(pagination.getStartIndex() + 1, pagination.getPageSize() + pagination.getStartIndex());
		} else {
			list = cs.vodList(pagination.getStartIndex() + 1, (pagination.getPageSize() + pagination.getStartIndex()));
		}
		System.out.println("list" + list);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("channel_admin/vodAdmin");
		mav.addObject("list", list);
		mav.addObject("listCount", listCount);
		mav.addObject("pagination", pagination);
		return mav;
	}

	// VOD 추가 페이지로 이동시키는 메서드
	@RequestMapping("vodAdd.ch")
	public String vodAdd() {
		return "channel_admin/vodAdd";
	}

	// VOD 수정 페이지로 이동하는 메서드
	@RequestMapping("vodRevise")
	public String vodRevies() {
		return "channel_admin/vodRevise";
	}

	// 구독자 관리 페이지로 이동하는 메서드
	@RequestMapping("subscriberAdmin.ch")
	public String goSubscriberAdmin() {
		return "channel_admin/subscriberAdmin";
	}

	// 매니저 관리 페이지로 이동하는 메서드
	@RequestMapping("/managerAdmin.ch")
	public String goManagerAdmin() {
		return "channel_admin/managerAdmin";
	}

	// 배너프로필 설정 페이지로 이동하는 메서드
	@RequestMapping("/goBannerProfile.ch")
	public String goBannerProfile() {
		return "channel_admin/bannerAndProfile";
	}

	// 채널소개 페이지로 이동하는 메서드
	@RequestMapping("/goChannelIntro")
	public String goChannelIntro() {
		return "channel_admin/channelIntro";
	}

}
