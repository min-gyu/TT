<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/mainHeader.jsp" />

<script type="text/javascript">
	
	$(function(){
		$("#fileName").on("click", function(){
			$("#fileInput").trigger("click");
		});
	});

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
		
			<form class="form-horizontal" role="form">
				<div class="form-group">
					<label for="inputReportReason" class="col-sm-2 control-label">신고사항</label>
					<div class="col-sm-8">
						<select class="form-control" name="reason">
							<option>저작권 침해</option>
							<option>청소년 유해</option> 
							<option>불법 & 문란</option> 
							<option>명예 회손</option> 
							<option>기타 사항</option>
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputTitle" class="col-sm-2 control-label">제목</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요">
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputId" class="col-sm-2 control-label">아이디</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" id="userID" name="userId">
					</div>
					
					<label for="inputRId" class="col-sm-2 control-label">신고 아이디</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" id="reportId" name="reportId">
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputEmail" class="col-sm-2 control-label">이메일</label>
					<div class="col-sm-8">
						<input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력해주세요">
					</div>
				</div>

				<div class="form-group">
					<label for="inputContent" class="col-sm-2 control-label">내용</label>
					<div class="col-sm-8">
						<textarea class="form-control" id="content" name="content" rows="3" placeholder="내용을 입력해주세요"></textarea>
					</div>
				</div>
			
				<div class="form-group">
					<label class="col-sm-2 control-label">파일첨부</label>
					<div class="col-sm-8" style="text-align: left;">
						<input type="text" id="fileName" class="form-control" name="fileName" style="width: 70%; display: inline;" readonly="readonly">
						<input id="fileInput" type="file" style="display: none;">
						<label for="fileInput" class="btn btn-success">
							<i class="fas fa-file-upload"></i>
						</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-8">
						<button type="submit" class="btn btn-success">등록</button>
						<button type="button" class="btn btn-warning">취소</button>
					</div>
				</div>
			</form>

		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />