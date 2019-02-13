<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>

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
				<li><a href="/subscribe.me">구독</a></li>
				<li><a href="/category/main.ca">전체</a></li>
				<li><a href="#">스포츠</a></li>
				<li><a href="#">먹방</a></li>
				<li><a href="#">뷰티</a></li>
				<li><a href="#">VLOG</a></li>
				<li><a href="#">VOD</a></li>
				<li><a href="/goChannel.ch">Channel</a></li>
				<li class="dropdown magz-dropdown"><a href="#">고객센터 <i class="ion-ios-arrow-right"></i></a>
					<ul class="dropdown-menu">
						<li><a href="/reportView.me">신고하기</a></li>
						<li><a href="/inquireView.me">문의하기</a></li>
					</ul>
				</li>
				<li class="dropdown magz-dropdown"><a href="#">My Page<i class="ion-ios-arrow-right"></i></a>
                     <ul class="dropdown-menu">
                      	<li><a href="checkPwd.me"><i class="leaf icon"></i> My채널</a></li>
                       	<li><a href="#"><i class="leaf icon"></i> My구독</a></li>
						<li class="divider"></li>                     
                        <li><a href="/chargeClover.me"><i class="leaf icon"></i> 클로버 충전하기</a></li>
                        <li><a href="/bankChk.me"><i class="leaf icon"></i> 계좌 인증하기</a></li>
                        <li><a href="/exchangeClover.me"><i class="leaf icon"></i> 환전 신청하기</a></li>
                        <li><a href="/question.me"><i class="leaf icon"></i> My문의 페이지</a></li>
                        <li><a href="/claim.me"><i class="leaf icon"></i>My신고 페이지</a></li>
                        <li><a href="/broadcastTotal.me"><i class="leaf icon"></i>방송 통계</a></li>
                        <li><a href="/note.me"><i class="leaf icon"></i>내 쪽지</a></li>
                        <li class="divider"></li>
                        <li><a href="/modify_myPage.me"><i class="icon ion-person"></i> 내 정보 수정</a></li>
                        <li><a href="#"><i class="icon ion-log-out"></i> 로그아웃</a></li>
                     </ul>
                 </li>
                 <li><a href="/broadTest.bc">BroadTest</a>
                 <li><a href="/broadTest2.bc">BroadTest2</a>
                 <li><a href="/broadTest2.bc">BroadTest3</a>
			</ul>
		</div>
	</div>
</nav>
