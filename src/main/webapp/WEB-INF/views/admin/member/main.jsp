<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/layout/admin/ad_header.jsp" />

<script>
	function memberList(){
		location.href="/memberList.ad";
	}
	
	function banList(){
		location.href="/banList.ad";
	}
	
	function leaveList(){
		location.href="/leaveList.ad";
	}
</script>

<section>
	<div class="center-block">
		<h1>트리뷰 추가예정</h1>
		<button class="btn btn-success" onclick="memberList()">회원정보조회</button>
		<button class="btn btn-success" onclick="banList()">정지회원</button>
		<button class="btn btn-success" onclick="leaveList()">탈퇴회원</button>
	</div>
</section>
		
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
