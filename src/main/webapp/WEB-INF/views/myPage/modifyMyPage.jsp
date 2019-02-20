<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

	<script type="text/javascript">
		// 중복 체크
		function fn_overlayCheck(type){
			var resultValue = "";
			
			if(type === "nickName") {resultValue = $("#nickName").val();}
			
			if(resultValue == ""){
				if(type == "nickName"){
					$("#nickName").focus();
				}
				return alert("입력 값이 없습니다.");
			}
			
			var url = "/overlayCheck/" + type + ".me"
			   ,data = {
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
		
		
		//개인정보수정 (닉네임 변경값, 현재비밀번호 확인, 새비밀번호, 새비밀번호 확인)
		function modify(){
			
		}
	</script>

	<section class="login first grey">
		<div class="container">
			<div class="box-wrapper">				
				<div class="box box-border">
					<div class="box-body">
						<h3>개인정보 수정</h3>
						<form class="form-horizontal">
							<div class="form-group">
								<label>아이디</label>
								<input type="text" name="userId" class="form-control" readonly>
							</div>
							
							<div class="form-group">
								<label>이름</label>
								<input type="text" name="userName" class="form-control" readonly>
							</div>
							
							<div class="form-group">
								<label>닉네임</label>
								<button type="button" id="checkBtn2" class="btn btn-warning bt-sm" onclick="fn_overlayCheck('nickName');">중복체크</button>
								<input type="text" id="nickName" name="nickName" class="form-control">
							</div>
							
							<div class="form-group">
								<label class="fw">기존 비밀번호</label>
								<input type="password" name="userPwd" class="form-control">
							</div>
							
							<div class="form-group">
								<label class="fw">새 비밀번호</label>
								<input type="password" name="userNewPwd" class="form-control">
							</div>
							<div class="form-group">
								<label class="fw">비밀번호 확인</label>
								<input type="password" name="userNewPwdCheck" class="form-control">
							</div>
							
							<div class="form-group">
								<label class="fw">생년월일</label>
								<input type="date" class="form-control onlyNumber" name="birth" placeholder="YYYY-MM-DD" readonly>
							</div>
							
							<div class="form-group">
								<label class="fw">성별</label>
								<div>
									<select class="form-control" name="gender" readonly>
										<option value="M">남</option>
										<option value="F">여</option>
									</select>
								</div>
							</div>
							
							<div class="form-group">
								<label>이메일</label>
								<!-- <a href="#" class="pull-right">이메일 중복 체크</a> -->
								<input type="email" name="email" class="form-control" readonly>
							</div>
							
							<div class="join_div" style="text-align: center; margin-bottom: 25px;">
								<!-- <button type="button" class="btn btn-success">인증</button> -->
								<button type="button" class="btn btn-secondary">확인</button>
							</div>
							
							<div class="form-group text-right">
								<button class="btn btn-primary btn-block" onclick="modify();">개인정보 수정</button>
							</div>
							
						</form>
						
						<!-- 회원탈퇴 -->
						<div class="ui horizontal divider">Or</div>
					  <div class="form-group text-right">
						<button class="btn btn-primary btn-block">회원 탈퇴하기</button>
					</div>
					  <!--  -->
  
					</div>
				</div>
			</div>
		</div>
	</section>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />