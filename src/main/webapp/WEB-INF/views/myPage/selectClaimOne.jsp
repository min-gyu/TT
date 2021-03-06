<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

input[type=text], select {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

div.formtag {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 40px;
}
</style>
	
		
	<section class="home">
		<div class="container">
		
		<div class="row">
			<br>
			<h2>My신고 상세 보기</h2>
			<div class="line"></div>
		</div>
		
		<div class="center-block">
		<div class="formtag">
			<form class="form-horizontal" role="form">
				<div class="form-group">
					<label for="inputReportReason" class="col-sm-2 control-label">신고사항</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" value="${claimOne.getCqClass()}" readonly>
					
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputTitle" class="col-sm-2 control-label">제목</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="title" name="title" value="${claimOne.getCqTitle() }" readonly>
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputRId" class="col-sm-2 control-label">신고 아이디</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" id="reportId" name="reportId" value="${claimOne.getCqTargetId() }" readonly>
					</div>
				</div>
				
			

				<div class="form-group">
					<label for="inputContent" class="col-sm-2 control-label">내용</label>
					<div class="col-sm-8">
						<textarea class="form-control" id="content" name="content" rows="3" placeholder="${claimOne.getCqContent()}" readonly></textarea>
					</div>
				</div>
			
				<div class="form-group">
					<label class="col-sm-2 control-label">파일첨부</label>
					<div class="col-sm-8" style="text-align: left;">
						<!-- <input type="text" id="fileName" class="form-control" name="fileName" style="width: 70%; display: inline;" readonly="readonly"> -->
						<img style="width: 500px; " src="${ contextPath }/resources/uploadFiles/${ imgName}.jpg" ></img>
						
					</div>
				</div>
			</form>
			</div>
		</div>
		</div>
	</section>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />