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
	
	$(document).ready(function(){
		qReplyList(qno);
	});
	
	function goList(){
		location.href="/questionList.ad";
	}
	
	function fn_writeReply(){
		var qno = $("#qno").val();
		var content = $("#ReplyContent").val();
		
		 $.ajax({
			url		:	"/questionReply.ad",
		 	type	:	"get",
		 	data	:	{
		 					qno : qno,
		 					content : content
		 				},
		 	success :	function(data){
		 					alert("댓글이 등록되었습니다.");
		 					window.location.reload();
		 				}
		 });
		 
	};
	
	function qReplyList(qno){
		var qno = $("#qno").val();
		
		$.ajax({
			url			:	"/qReplyList.ad",
			type		:	"get",
			data		:	{ qno : qno },
			success		:	function(data) {
							console.log(data);
						
							var htmlCode = "";
							for(var i = 0; i <data.length; i++){
								var rowData = data[i];
								
								var cqNo		= rowData.cqNo;
								var writer		= rowData.uno;
								var content 	= rowData.cqContent;
								var date		= rowData.cqDate;
								
								htmlCode += '<div class="form-group col-md-12">';
								htmlCode += '<div class="detail">';
								htmlCode += '<div class="time">'+ date +'</div>';
								htmlCode += '</div>';
								htmlCode += '<textarea class="form-control" id="ReplyContent" placeholder="댓글 입력란" readonly style="height:100px;">'+ content +'</textarea>';
								htmlCode += '</div>';
								
							}
							$("#reply_area").html(htmlCode);
			},
			error	:	function(){
							console.log("댓글 불러오기 실패");
						}
		})
	};
			

</script>

<section class="home">
	<div class="container">
		<div class="row">
			<div class="center-block">
				<h2>문의 내역</h2>
				<br><br>
			</div>
		</div>

		<div class="formtag">
			<form action="#">
				<!-- 신고 글 번호 / 글 작성자 번호 -->
				<input type="hidden" id="qno" name="qno" value="${ca.getCqNo()}" readonly>
				<input type="hidden" id="uno" name="uno" value="${ca.getUno()}" readonly>
				
				<label for="inputReportReason">신고사항</label>
				<input type="text" id="cqClass" name="cqClass" value="${ca.getCqClass()}" readonly>
				
				<label for="inputWriter">작성자</label>
				<input type="text" id="userId" name="userId" value="${ca.getUserId()}" readonly>
				
				<label for="inputTitle">제목</label>
				<input type="text" id="title" name="title" value="${ca.getCqTitle()}" readonly>
				
				<label for="inputContent">내용</label>
				<input type="text" id="content" name="content" value="${ca.getCqContent()}" readonly style="height:150px;">
				
				<label>첨부파일</label>
				<div class="center-block">
					<img src="${ contextPath }/resources/uploadFiles/${ca.getModifyName()}.jpg"
						style="height: 200px; width: 300px;"></img>
				</div>
				
				<br><br>
				
				<div class="center-block">
					<!-- <button type="button" class="btn btn-success" onclick="validClaim();">유효한 신고</button> -->
					<button type="button" class="btn btn-light" onclick="goList();">목록으로</button>
				</div>
			</form>
		</div>
		
		<div class="line thin"></div>
		
		<div class="comments">

			<div class="row">
				<div class="col-md-12">
					<h2 class="title">
						문의 댓글 작성<a href="#" class="love active"><i class="ion-android-favorite"></i></a>
					</h2>
				</div>
				
				<div class="form-group col-md-12">
					<label for="message">댓글 <span class="required"></span></label>
					<textarea class="form-control" id="ReplyContent" placeholder="댓글 입력란"></textarea>
				</div>
				
				<div class="form-group col-md-12">
					<button class="btn btn-primary" id="ReplyBtn" style="float:right;" onclick="fn_writeReply();">댓글 작성</button>
				</div>
			</div>
			
			<!-- 그리기 -->
			<div class="line thin"></div>
			<div id="reply_area">
				<div class="form-group col-md-12">
					<div class="detail">
						<div class="time">2019-03-05</div>
					</div>
					<textarea class="form-control" id="ReplyContent" placeholder="댓글 입력란" readonly style="height:100px;"></textarea>
				</div>
			</div>
				
		</div>
		
	</div>
</section>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />