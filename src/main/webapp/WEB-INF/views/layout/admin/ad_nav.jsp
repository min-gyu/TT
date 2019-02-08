<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>

<style>
	th{
		text-align:center;
		background-color:green;
		color:white;
	}
</style>	

<nav class="menu">
	<div class="container">
		<div class="brand">
			<a href="#"> <img src="/resources/images/logo.png"
				alt="Magz Logo">
			</a>
		</div>
		<div class="mobile-toggle">
			<a href="#" data-toggle="menu" data-target="#menu-list"><i class="ion-navicon-round"></i></a>
		</div>
		<div class="mobile-toggle">
			<a href="#" data-toggle="sidebar" data-target="#sidebar"><i class="ion-ios-arrow-left"></i></a>
		</div>
		<div id="menu-list">
			<ul class="nav-list">
				<li><a href="/adminMain.ad">회원 관리</a></li>
				<li><a href="#">신고 관리</a></li>
				<li><a href="#">카테고리 관리</a></li>

				<li><a href="/chargeClover.ad">클로버 관리</a></li>
				<li><a href="/adminInquiry.ad">문의관리</a></li>
				<li><a href="/adminBoard.ad">게시글 관리</a></li>
				<li><a href="/adminVod.ad">VOD관리</a></li>
				<li><a href="/adminStatistics.ad">통계관리</a></li>

				
			</ul>
		</div>
	</div>
</nav>
