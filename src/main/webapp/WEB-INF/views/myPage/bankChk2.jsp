<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	
	<section class="login first grey">
		<div class="container">
			<div class="box-wrapper">				
				<div class="box box-border">
					<div class="box-body">
						<div>
						<a href="bankChk2.me"><h4>계좌 조회 / 
						<a href="bankChk.me">계좌 인증</h4>
						</div> </a>
						
						<!-- 계좌인증 입력폼 -->
						<form>
							<div class="form-group">
								<label>이름</label>
								<input type="text" name="username" class="form-control" readonly>
							</div>
							<div class="form-group">
								<label class="fw">은행선택</label>
								<input type="text" name="userbank" class="form-control" readonly>
							</div>
							<div class="form-group">
								<label class="fw">계좌번호</label>
								<input type="text" name="banknumber" class="form-control" readonly>
							</div>
							<div class="form-group">
								<label class="fw">생년월일</label>
								<input type="date" name="birthday" class="form-control" readonly>
							</div>
							<div class="form-group text-right">
								<button class="btn btn-primary btn-block" onclick="deleteBank();">삭제</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<script>
		function deleteBank(){
			alert("함수작동!");
		}
	</script>
	
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />