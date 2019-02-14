<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		
	<section class="post-content-area single-post-area">
		<div class="center-block">
		
			<form class="form-horizontal" role="form">
				<div class="form-group">
					<label for="inputReportReason" class="col-sm-2 control-label">신고사항</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" value="${claimOne.getCqClass()}" readonly>
						<!-- <select class="form-control" name="reason">
							<option>저작권 침해</option>
							<option>청소년 유해</option> 
							<option>불법 & 문란</option> 
							<option>명예 회손</option> 
							<option>기타 사항</option>
						</select> -->
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputTitle" class="col-sm-2 control-label">제목</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="title" name="title" value="${claimOne.getCqTitle() }" readonly>
					</div>
				</div>
				
				<div class="form-group">
					<%-- <label for="inputId" class="col-sm-2 control-label">아이디</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" id="userID" name="userId" value="${ sessionScope.loginUser.email }" readonly>
					</div> --%>
					
					<label for="inputRId" class="col-sm-2 control-label">신고 아이디</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" id="reportId" name="reportId" value="${claimOne.getCqTargetId() }" readonly>
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputEmail" class="col-sm-2 control-label">이메일</label>
					<div class="col-sm-8">
						<input type="email" class="form-control" id="email" name="email" value="${ sessionScope.loginUser.email }" readonly>
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
						<input type="text" id="fileName" class="form-control" name="fileName" style="width: 70%; display: inline;" readonly="readonly">
						<!-- <input id="fileInput" type="file" style="display: none;">
						<label for="fileInput" class="btn btn-success">
							<i class="fas fa-file-upload"></i>
						</label> -->
					</div>
				</div>
			</form>

		</div>
	</section>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />