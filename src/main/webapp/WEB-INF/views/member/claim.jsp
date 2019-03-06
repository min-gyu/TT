<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/mainHeader.jsp" />

<style type="text/css">
.btn-file {
    position: relative;
    overflow: hidden;
}
.btn-file input[type=file] {
    position: absolute;
    top: 0;
    right: 0;
    min-width: 100%;
    min-height: 100%;
    font-size: 100px;
    text-align: right;
    filter: alpha(opacity=0);
    opacity: 0;
    outline: none;
    background: white;
    cursor: inherit;
    display: block;
}
input[type=text], select {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}
input[type=submit] {
	width: 100%;
	background-color: orange;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}
input[type=submit]:hover {
	background-color: green;
}

input[type=text]:focus {
	background-color: #FFF;
	border: 3px solid #555;
}
div.formtag {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 40px;
}
</style>


<script type="text/javascript">
	$(document).ready(function() {
		$("input[type='file']").on('change', function() {
			var input = $(this);
			var label = input.val().replace(/\\/g, '/').replace(/.*\//, '');  
			$("#" + input.data("display-target")).val(label);
		});
	});
		
	function fn_targetIdCheck(){
		var resultValue = $("#reportId").val();
		
		var url  = "/targetIdCheck.me"
		  , data = {
				     params : {
				    	 			resultValue 	: resultValue
								}
				};
		var afterFn = function(resultData, status, headers, config){
				        	var ret_code 	= resultData.ret_code;
				        	var ret_message = resultData.ret_message;
				        	
				        	switch (ret_code) {
								case "E":
									alert("에러가 발생했습니다. : \n" + ret_message);
								break;
								
								case "S":
									alert(ret_message);
								break;
							}
				       };
       
		fn_callAjax(url, data, afterFn);
		
	}
</script>

<section class="home">
	<div class="container">
		<div class="row">
			<div class="center-block">
				<h2>신고하기</h2><br><br>
			</div>

			<h3>01 고객 동의</h3>
			<div class="line"></div>
			<p>* 보내주신 신고를 확인 후 최대한 빠르게 답변해 드리겠습니다.</p>
			<p>* 신고 [제목]과 [내용]란에는 절대 개인정보를 입력하지 마세요.</p>
			<p>* 신고 [제목]과 [내용]란에 개인정보가 포함되어 있거나, 중복 신고인 경우에는 삭제될 수 있습니다.</p>
			<p style="font-weight: bold">* 신고에 욕설, 인격침해, 성희롱 등 수치심을 유발하는 표현이 있다면 답변이 거부될 수 있습니다.</p>
			<br><br>

			<h3>02 신고 입력</h3>
			<div class="line"></div>
		</div>
		
		<div class="center-block">
		
			<div class="formtag">
				<form class="form-horizontal" name="myForm" action="/clientClaim.me" method="post" encType="multipart/form-data">
					<label for="inputReportReason">신고사항</label> 
					<select id="cqClass" name="cqClass">
						<option value="저작권침해">저작권 침해</option>
						<option value="청소년유해">청소년 유해</option> 
						<option value="불법문란">불법 & 문란</option> 
						<option value="명예훼손">명예 훼손</option> 
						<option value="기타사항">기타 사항</option>
					</select> 
					
					<label for="inputTitle">제목</label>
					<input type="text" id="title" name="cqTitle" placeholder="제목을 입력해주세요">
					
					<label for="inputId">아이디</label> 
					<input type="hidden"  name="uno" value="${ sessionScope.loginUser.uno }" >
					<input type="text" id="userID" name="userID" value="${ sessionScope.loginUser.userId }" readonly>
					
					<label for="inputRId">신고 아이디</label> 
					<button type="button" id="checkBtn1" class="btn btn-warning bt-sm" onclick="fn_targetIdCheck();">중복체크</button>
					<input type="text" id="reportId" name="targetId" style="">
					
					<label for="inputContent">내용</label> 
					<input type="text" id="content" name="cqContent" placeholder="내용을 입력해주세요">
					
					<h5 style="color: green;">* 사진을 첨부해주세요</h5>
					<div class="col-sm-8">
						<div class="input-group">
					    	<label class="input-group-btn">
							    <span class="btn btn-success btn-file">Browse 
							    	<input type="file" name="photo" data-display-target="attachFile">
							    </span>
					    	</label>
					    	<input type="text" class="form-control" readonly id="attachFile" >
  						</div>
			    	</div>
					
					<button type="submit" class="btn btn-success" id="submitBtn">등록</button>
					<button type="button" class="btn btn-warning">취소</button>
				</form>
			</div>
			
		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />