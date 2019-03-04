<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kh.tt.member.model.vo.Member" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="menu">
	<div class="container">
		<div class="brand">
			<a href="#"> <img src="/resources/images/logo.png" alt="Today's TV"></a>
		</div>
		<div class="mobile-toggle">
			<a href="#" data-toggle="menu" data-target="#menu-list"><i class="ion-navicon-round"></i></a>
		</div>
		<div class="mobile-toggle">
			<a href="#" data-toggle="sidebar" data-target="#sidebar"><i class="ion-ios-arrow-left"></i></a>
		</div>
		<div id="menu-list">
			<ul class="nav-list">
				<li><a href="/subscribe.sub">구독</a></li>
				<li><a href="/category/main.ca">전체</a></li>
				<li><a href="/category/sports.ca">스포츠</a></li>
				<li><a href="#">먹방</a></li>
				<li><a href="#">뷰티</a></li>
				<li><a href="#">VLOG</a></li>
				<li><a href="/category/vod.ca">VOD</a></li>
				<li class="dropdown magz-dropdown"><a href="#">고객센터 <i class="ion-ios-arrow-right"></i></a>
					<ul class="dropdown-menu">
						<li><a href="/claimView.me">신고하기</a></li>
						<li><a href="/questionView.me">문의하기</a></li>
					</ul>
				</li>
				
				<c:if test="${ !empty sessionScope.loginUser }">
					<li class="dropdown magz-dropdown"><a href="#">My Page<i class="ion-ios-arrow-right"></i></a>
	                     <ul class="dropdown-menu">
	                      	<!-- <li><a href="#"><i class="leaf icon"></i> My채널</a></li>
	                       	<li><a href="#"><i class="leaf icon"></i> My구독</a></li> -->   
							<li class="divider"></li>                  
	                        <li><a href="/chargeClover.me"><i class="leaf icon"></i> 클로버 충전하기</a></li>
	                        <li><a href="/bankChk.me?mUno=${sessionScope.loginUser.uno}"><i class="leaf icon"></i> 계좌 인증하기</a></li>
	                        <li><a href="/exchangeClover.me?mUno=${sessionScope.loginUser.uno}"><i class="leaf icon"></i> 환전 신청하기</a></li>
	                        <li><a href="/question.me?cqUno=${sessionScope.loginUser.uno}"><i class="leaf icon"></i> My문의 페이지</a></li>
	                        <li><a href="/claim.me?cqUno=${sessionScope.loginUser.uno}"><i class="leaf icon"></i>My신고 페이지</a></li>
	                        <li><a href="/broadcastTotal.me"><i class="leaf icon"></i>방송 통계</a></li>
	                        <!-- <li><a href="/note.me"><i class="leaf icon"></i>내 쪽지</a></li> -->
	                        <li class="divider"></li>
	                        <li><a href="/modifyMyPage.me?mUno=${sessionScope.loginUser.uno}"><i class="icon ion-person"></i> 내 정보 수정</a></li>
	                        <li><a href="#"><i class="icon ion-log-out"></i> 로그아웃</a></li>
	                     </ul>
	                 </li>
                 </c:if>
                 
				 <c:if test="${ (!empty loginUser) and (!empty loginUser.bank) }">
        	 	 	<c:url var="broadUrl" value="/goBroadCast.bc">
          	 			 <c:param name="owner" value="${ sessionScope.loginUser.userId }"/>     	
              	 	</c:url>
	             	 <li id="broadLi">
						 <a href="${ broadUrl }">
						 	<i class="fas fa-video" id="broadCatsIcon"></i>
						 	<div style="display:inline">방송하기</div>
						 </a>
					 </li>
       			 </c:if>
                 <!-- <li><a href="/goBroadCast.bc?owner=user01">user01 방송</a></li> -->
			</ul>
		</div>
	</div>
</nav>
