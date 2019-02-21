<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

 <!-- 계좌 인증 -->
	
	<script>
		$(function(){
			
			//계좌인증 클릭시 작동
			$("#checkBank").click(function(){
				var result = confirm("정말로 탈퇴하시겠습니까?");
				
				console.log(result);
			});
			
		});
	
	</script>
	



	<!-- 계좌인증 페이지 -->
	<section class="login first grey">
		<div class="container">
			<div class="box-wrapper">
				<!-- 카테고리 -->	
				<div class="ui top attached tabular menu">
				   <a href="bankChk2.me?mUno=${sessionScope.loginUser.uno}" class="item">계좌 조회</a>
				   <a href="bankChk.me?mUno=${sessionScope.loginUser.uno}" class="active item">계좌 인증</a>
				 </div>			
				<div class="box box-border">
					<div class="box-body">
						<!-- 계좌인증 입력폼 -->
						<form>
							<div class="form-group">
								<label>이름</label>
								<input type="text" id="username" class="form-control">
							</div>
							<div class="form-group">
								<label class="fw">은행선택</label>
								<input type="text" id="userbank" class="form-control">
							</div>
							<div class="form-group">
								<label class="fw">계좌번호</label>
								<input type="text" id="banknumber" class="form-control">
							</div>
							<div class="form-group">
								<label class="fw">생년월일</label>
								<input type="date" id="birthday" class="form-control">
							</div>
							<div class="form-group text-right">
								<a class="btn btn-primary btn-block" id="checkBank">확인</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<script>
		function checkBank(){
			alert("함수작동!");
		}
		
		
	</script>
	
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />