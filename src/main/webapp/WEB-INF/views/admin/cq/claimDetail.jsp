<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/layout/mainHeader.jsp" />

<style type="text/css">
	input[type=text], select {
		width: 100%;
		padding: 12px 20px;
		margin: 8px 0;
		display: inline-block;
		border: 1px solid #ccc;
		border-radius: 4px;
		box-sizing: border-box;
	}
	
	input[type=text]:focus {
		background-color: #EFFBF5;
		border: 3px solid #555;
	}
	
	div.formtag {
		border-radius: 5px;
		background-color: #f2f2f2;
		padding: 40px;
	}
</style>

<script type="text/javascript">
	function goList(){
		location.href="/claimList.ad";
	}
	
	function validClaim(){
		var cno = $("#cno").val();
		console.log(cno);
		location.href="/correctClaim.ad?cno=" + cno;
	}
</script>

<section class="home">
	<div class="container">
		<div class="row">
			<div class="center-block">
				<h2>신고 내역</h2>
				<br><br>
			</div>
		</div>

		<div class="formtag">
			<form action="#">
				<!-- 신고 글 번호 / 글 작성자 번호 / 신고 회원 번호 -->
				<input type="hidden" id="cno" name="cno" value="${ca.getCqNo()}" readonly>
				<input type="hidden" id="uno" name="uno" value="${ca.getUno()}" readonly>
				<input type="hidden" id="targetUno" name="targetUno" value="${ca.getTargetNo()}" readonly>
				
				<label for="inputReportReason">신고사항</label>
				<input type="text" id="cqClass" name="cqClass" value="${ca.getCqClass()}" readonly>
				
				<label for="inputTitle">제목</label>
				<input type="text" id="title" name="title" value="${ca.getCqTitle()}" readonly>
				
				<label for="inputRId">신고 아이디</label>
				<input type="text" id="reportId" name="reportId" value="${ca.getUserId()}" readonly>
				
				<label for="inputContent">내용</label>
				<input type="text" id="content" name="content" value="${ca.getCqContent()}" readonly style="height:150px;">
				
				<label>첨부파일</label>
				<div class="center-block">
					<img src="${ contextPath }/resources/uploadFiles/${ca.getModifyName()}.jpg"
						style="height: 200px; width: 300px;"></img>
				</div>
				
				<br><br>
				
				<div class="center-block">
					<button type="button" class="btn btn-success" onclick="validClaim();">유효한 신고</button>
					<button type="button" class="btn btn-light" onclick="goList();">목록으로</button>
				</div>
			</form>
		</div>


	</div>
</section>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />