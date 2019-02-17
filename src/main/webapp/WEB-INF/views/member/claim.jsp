<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</style>


<script type="text/javascript">
	$(document).ready(function() {
		$("input[type='file']").on('change', function() {
			var input = $(this);
			var label = input.val().replace(/\\/g, '/').replace(/.*\//, '');  
			$("#" + input.data("display-target")).val(label);
		});
	});
		
	/* function duplicationCheck(){
		var reportId = $("#reportId").val();
		console.log(reportId);
		
		$.ajax({
			url  : "duplicationCheck.me",
			type : "post",
			data : {userId : userId},
			success : function(data){
				console.log(data.userId);
			},
			error : function(status){
				console.log(status);
			}
		});
		
		return false;
	} */
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
		<form action=""></form>
			<form class="form-horizontal" name="myForm" action="/clientClaim.me" method="post" encType="multipart/form-data">
				<div class="form-group">
					<label for="inputReportReason" class="col-sm-2 control-label">신고사항</label>
					<div class="col-sm-8">
						<select class="form-control" name="cqClass">
							<option value="저작권침해">저작권 침해</option>
							<option value="청소년유해">청소년 유해</option> 
							<option value="불법문란">불법 & 문란</option> 
							<option value="명예회손">명예 회손</option> 
							<option value="기타사항">기타 사항</option>
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputTitle" class="col-sm-2 control-label">제목</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="title" name="cqTitle" placeholder="제목을 입력해주세요">
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputId" class="col-sm-2 control-label">아이디</label>
					<div class="col-sm-3">
						<input type="hidden"  name="uno" value="${ sessionScope.loginUser.uno }" >
						<input type="text" class="form-control" id="userID" name="userID" value="${ sessionScope.loginUser.userId }" readonly>
					</div>
					
					<label for="inputRId" class="col-sm-2 control-label">신고 아이디</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" id="reportId" name="targetNo">
						<button type="button" id="checkBtn1" class="btn btn-warning bt-sm" onclick="fn_overlayCheck('id');">중복체크</button>
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputContent" class="col-sm-2 control-label">내용</label>
					<div class="col-sm-8">
						<textarea class="form-control" id="content" name="cqContent" rows="3" placeholder="내용을 입력해주세요"></textarea>
					</div>
				</div>
			
				<div class="form-group">
				<label for="inputContent" class="col-sm-2 control-label">첨부파일</label>
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
			    </div>
				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-8">
						<button type="submit" class="btn btn-success" id="submitBtn">등록</button>
						<button type="button" class="btn btn-warning">취소</button>
					</div>
				</div>
			</form>

		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />