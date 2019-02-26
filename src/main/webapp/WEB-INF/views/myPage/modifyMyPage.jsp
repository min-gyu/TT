<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

	<script>
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
		
		
		
		$(function(){
			
			//개인정보수정 (닉네임 변경값, 새비밀번호, 새비밀번호 확인)
			$("#modify").click(function(){
				
				var nickName = $("#nickName").val();
				var userNewPwd = $("#userNewPwd").val();
				var userNewPwdCheck = $("#userNewPwdCheck").val();
				
				var mUno = ${member2.getUno()};
				console.log("mUno > "+mUno);
				
				if(userNewPwd!=userNewPwdCheck){
					alert("비밀번호가 일치하지 않습니다.");
					
					location.href="modifyMyPage2.me?mUno=${member2.getUno()}";
					
				}else{
					console.log("비번일치");
					location.href="modifyMyPage3.me?nickName="+nickName+"&userPwd="+userNewPwd+"&mUno="+${member2.getUno()};
				}
			});
			
			
			//회원탈퇴하기
			$("#out").click(function(){
				//ajax실행할 메서드호출
				outReason();
			});
			
			//모달띄우고 탈퇴사유 받기
			function outReason() {
				
				$("#myModal").modal().show();
				var mUno = ${member2.getUno()};
				
				//탈퇴사유 선택 후 확인클릭시
				$("#btn").click(function(){
					var reason = $("input[name='reason']:checked").val();
					console.log(reason);
					
					//이제 회원번호랑 이유 넘기기
					location.href="out.me?mUno="+mUno+"&reason="+reason;
				
				});
					
				/*  $.ajax({
						url :  "/out.me",	
						type : "post",	
						data : {
									mUno : ${member2.getUno()}; 
								},
								
						success : function(data){	// 성공시 
							 console.log("성공!");
						},
						error : function(){
							console.log("실패!");
						}
					}); */
			}
			
		});
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
								<input type="text" value="${member2.getUserId()}" class="form-control" readonly>
							</div>
							
							<div class="form-group">
								<label>이름</label>
								<input type="text" value="${member2.getUserName()}" class="form-control" readonly>
							</div>
							
							<div class="form-group">
								<label>닉네임</label>
								<button type="button" id="checkBtn2" class="btn btn-warning bt-sm" onclick="fn_overlayCheck('nickName');">중복체크</button>
								<input type="text" id="nickName" name="nickName" class="form-control">
							</div>
						<!-- 	
							<div class="form-group">
								<label class="fw">기존 비밀번호</label>
								<input type="password" name="userPwd" class="form-control">
							</div> -->
							
							<div class="form-group">
								<label class="fw">새 비밀번호</label>
								<input type="password" id="userNewPwd" class="form-control">
							</div>
							<div class="form-group">
								<label class="fw">비밀번호 확인</label>
								<input type="password" id="userNewPwdCheck" class="form-control">
							</div>
							
							<%-- <div class="form-group">
								<label class="fw">생년월일</label>
								<input type="date" class="form-control onlyNumber" value="${member2.getBirth()}" readonly>
							</div> --%>
							
							<div class="form-group">
								<label class="fw">성별</label>
								<input type="text" id="nickName" value="${member2.getGender()}" class="form-control" readonly>
							</div>
							
							<div class="form-group">
								<label>이메일</label>
								<!-- <a href="#" class="pull-right">이메일 중복 체크</a> -->
								<input type="email" value="${member2.getEmail()}" class="form-control" readonly>
							</div>
							<br>
							<div class="form-group text-right">
								<a class="btn btn-primary btn-block" id="modify">개인정보 수정</a>
							</div>
							
						</form>
						
						<!-- 회원탈퇴 -->
						<div class="ui horizontal divider">Or</div>
					  <div class="form-group text-right">
						<a class="btn btn-primary btn-block" id="out">회원 탈퇴하기</a>
					</div>
					  <!--  -->
  
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<section>
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog" style="margin-top: 200px;">
		<div class="modal-dialog">
	  
			<!-- Modal content-->
			<div class="modal-content">
			    
			    <div class="modal-header">
				     <button type="button" class="close" data-dismiss="modal">&times;</button>
				    <h4 class="modal-title">탈퇴 사유</h4>
			    </div>
				      
			    <div class="modal-body">
			   		<input type="radio" name="reason" value="홈페이지 사용시스템 불편">홈페이지 사용시스템 불편<br>
			   		<input type="radio" name="reason" value="유해 컨텐츠 과다">유해 컨텐츠 과다<br>
			   		<input type="radio" name="reason" value="다른 유용한 사이트 이용을 위해">다른 유용한 사이트 이용을 위해<br>
			   		<input type="radio" name="reason" value="기타">기타<br>
			    </div>
				      
			    <div class="modal-footer">
			    	<a type="button" class="btn btn-success" data-dismiss="modal" id="btn">확인</a>
			    </div>
		   	</div>
	    
  		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />