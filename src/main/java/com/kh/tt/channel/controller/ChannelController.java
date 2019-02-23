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
import com.kh.tt.channel.model.vo.BoardClaim;
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
		m = cs.selectmInfo(uNo);// 채널 주인 정보 출력
		System.out.println(m);
		//채널 베너랑 프로필 사진 담아가기
		mav.setViewName("channel/channel");
		mav.addObject("m", m);

		return mav;

	}

	// VOD리스트 페이지
	@RequestMapping("vod_List.ch")
	public ModelAndView vod_List(HttpServletRequest request, Board b, @RequestParam(defaultValue = "1") int curPage,
			int CuNo, Member m) {

		m = cs.selectmInfo(CuNo);// 채널 주인 정보 출력
		int listCount = cs.getLisCount(b);

		pagination pagination = new pagination(listCount, curPage);

		System.out.println("vod_list : " + pagination);
		System.out.println("vod_list : " + curPage);

		List<Board> list;

		if (curPage == 1) {

			list = cs.vodList(pagination.getStartIndex() + 1, pagination.getPageSize() + pagination.getStartIndex());
		} else {
			list = cs.vodList(pagination.getStartIndex() + 1, (pagination.getPageSize() + pagination.getStartIndex()));
		}
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
		m = cs.selectmInfo(CuNo);// 채널 주인 정보 출력
		cs.increaseViewC(bNo, session);
		System.out.println(msg);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("channel/vod_oneList");
		Board b = cs.vodOne(bNo);// VOD게시글 정보

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
	public String addSubscribe(Model model, int uNo, int CuNo, int bNo,Member m) {
		System.out.println("구독 : " + CuNo);// 채널 회원 번호
		System.out.println("구독 : " + uNo);// 로그인 회원 번호
		System.out.println("구독 : " + bNo);// 게시물번호
		m = cs.selectmInfo(CuNo);// 채널 주인 정보 출력
		
		int ChNo=m.getChNo();//채널 주인 채널 번호
		
		int result = cs.addSubscirbe(ChNo, uNo);
		
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

	// 댓글 목록 출력 메소드
	@RequestMapping("listDet.ch")
	public ModelAndView listDet(@RequestParam int bNo, @RequestParam(defaultValue = "1") int curPage,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int count = cs.listDetCount(bNo);// 댓글 갯수 뽑아오기
		System.out.println("댓글 개수 : " + count);

		pagination pagination = new pagination(count, curPage);

		System.out.println("listDet : " + pagination);
		List<Board> list;

		if (curPage == 1) {
			list = cs.listDet(bNo, pagination.getStartIndex() + 1,
					pagination.getPageSize() + pagination.getStartIndex());
		} else {
			list = cs.listDet(bNo, pagination.getStartIndex() + 1,
					(pagination.getPageSize() + pagination.getStartIndex()));
		}

		System.out.println("list출력전 : " + list);
		mav.setViewName("channel/replyPage");
		mav.addObject("list", list);
		mav.addObject("count", count);
		mav.addObject("pagination", pagination);

		return mav;

	}

	// 댓글 추가하기 메소드
	@RequestMapping("insertDet.ch")
	public ModelAndView insertDet(Board db, HttpSession session,Member m,
			@RequestParam(value = "ReplyContent") String ReplyContent, @RequestParam(value = "CuNo") int CuNo,
			@RequestParam(value = "bNo") int bNo, @RequestParam(value = "uNo") int uNo) {
		
		m = cs.selectmInfo(CuNo);// 채널 주인 정보 출력
		int ChNo=m.getChNo();//채널 주인 채널 번호
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ChNo", ChNo);// 채널 번호
		map.put("ReplyContent", ReplyContent);// 댓글 내용
		map.put("uNo", uNo);// 작성자 번호
		map.put("bNo", bNo);// 게시물 번호

		cs.insertDet(map);// 댓글 추가 완료
		ModelAndView mav = new ModelAndView();
		mav.setViewName("channel/vod_oneList");

		return mav;
	}

	// 댓글 삭제하기 메소드
	@RequestMapping("deleteDet.ch")
	public String deleteDet(Member m,@RequestParam(value = "CuNo") int CuNo, @RequestParam(value = "bNo") int bNo,
			@RequestParam(value = "buId") String buId) {
		System.out.println("삭제 : " + buId);
		System.out.println("삭제 : " + CuNo);
		System.out.println("삭제 : " + bNo);

		m = cs.selectmInfo(CuNo);// 채널 주인 정보 출력
		int ChNo=m.getChNo();//채널 주인 채널 번호
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("ChNo", CuNo);
		map.put("bNo", bNo);
		cs.deleteDet(map);
		System.out.println(cs.deleteDet(map));

		int onebNo = cs.onebNo(bNo);

		return "redirect:vod_oneList.ch" + "?bNo=" + onebNo + "&&CuNo=" + CuNo;

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
	public ModelAndView report(@RequestParam int bNo) {
		System.out.println("신고하기 전송시 게시물 번호 : " + bNo);
		ModelAndView mav = new ModelAndView();
		mav.addObject("bNo", bNo);
		mav.setViewName("channel/reportMessage");
		return mav;
	}

	@RequestMapping("insertBReport.ch")
	public String insertReport() {

		System.out.println("도착");
		return null;

	}

	// VOD업로드 메소드
	@RequestMapping("insertvod.ch")
	public String insertvod(int CuNo,Member m,Model model, Board b, Attachment a, HttpSession session, HttpServletRequest request,
			@RequestParam(value = "video", required = false) MultipartFile video) {

		m = cs.selectmInfo(CuNo);// 채널 주인 정보 출력
		int ChNo=m.getChNo();//채널 주인 채널 번호
		HashMap<String,Object> map=new HashMap<String,Object>();
		
		System.out.println("Board" + b);
		System.out.println("Video" + video);
		b.setBchNo(ChNo);

		String root = request.getSession().getServletContext().getRealPath("resources");

		String filePath = root + "\\uploadFiles";

		System.out.println("filePath" + filePath);

		String originFileName = video.getOriginalFilename();
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		String changeName = CommonUtils.getRandomString();

		System.out.println("changeName" + changeName);

		try {
			video.transferTo(new File(filePath + "\\" + changeName + ext));

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
			
			return "redirect:goVodAdmin.ch"+"?CuNo="+CuNo;// VOD관리 페이지로 이동

		} catch (Exception e) {
			new File(filePath + "\\" + changeName + ext).delete();

			model.addAttribute("msg", "VOD 업로드 실패!");
			return "common/errorPage";
		}

	}

	// ***********관리자************

	// 배너프로필 설정 페이지로 이동하는 메서드(관리자 메인)
	@RequestMapping("/goBannerProfile.ch")
	public ModelAndView goBannerProfile(int CuNo, Member m) {
		m = cs.selectmInfo(CuNo);// 채널 주인 정보 출력
		System.out.println("채널 주인 정보 : "+m);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("channel_admin/bannerAndProfile");
		mav.addObject("m", m);
		return mav;
	}

	@RequestMapping("updateBimg.ch")
	public ModelAndView updateBimg(Model model, HttpSession session,int CuNo,Attachment a, HttpServletRequest request,Member m,
			@RequestParam(value = "banner", required = false) MultipartFile image){
		System.out.println("updateBimg.ch : " + image);
		System.out.println(CuNo);// 채널 주인 회원번호
		
		m = cs.selectmInfo(CuNo);// 채널 주인 정보 출력
		int ChNo=m.getChNo();//채널 주인 채널 번호
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\uploadFiles\\banner";
		ModelAndView mav = new ModelAndView();

		String originFileName = image.getOriginalFilename();
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		
		//사진 형식이 아닐시 
		if(!ext.equals(".jpg")&&!ext.equals(".png")&&!ext.equals(".jpeg")) {
			mav.addObject("msg", "사진이 아닌 파일입니다.(jpg,png.jpeg)");
			mav.setViewName("channel_admin/bannerAndProfile");
			return mav;
		}
		//-----------------
		
		String changeName = CommonUtils.getRandomString();
		
		try {
			image.transferTo(new File(filePath + "\\" + changeName + ext));
			
			a.setAtName(originFileName);//원본이름
			a.setAtMName(changeName);//바뀐이름
			a.setAtPath(filePath);//파일경로
			a.setAtCHno(ChNo);//채널 번호
			
			
			int result=cs.insertBimg(a);
			System.out.println("베너 삽입  : "+result);
			
			mav.addObject("a", a);
			mav.addObject("ext", ext);
			mav.setViewName("channel_admin/bannerAndProfile");
			return mav;
		} catch (Exception e) {
			
			new File(filePath + "\\" + changeName + ext).delete();

			model.addAttribute("msg", "VOD 업로드 실패!");
			mav.setViewName("common/errorPage");
			return mav;
		}
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
	public ModelAndView goVodAdmin(Member m,HttpServletRequest request, int CuNo,Board b, @RequestParam(defaultValue = "1") int curPage) {
		
		m = cs.selectmInfo(CuNo);// 채널 주인 정보 출력
		int ChNo=m.getChNo();//채널 주인 채널 번호
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
		mav.addObject("m", m);
		
		return mav;
	}

	// VOD 추가 페이지로 이동시키는 메서드
	@RequestMapping("vodAdd.ch")
	public ModelAndView vodAdd(Member m,int CuNo) {
		ModelAndView mav = new ModelAndView();
		m = cs.selectmInfo(CuNo);// 채널 주인 정보 출력
		int ChNo=m.getChNo();//채널 주인 채널 번호
		
		mav.setViewName("channel_admin/vodAdd");
		mav.addObject("m", m);
		return mav;
		
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

	// 채널소개 페이지로 이동하는 메서드
	@RequestMapping("/goChannelIntro")
	public String goChannelIntro() {
		return "channel_admin/channelIntro";
	}

}
