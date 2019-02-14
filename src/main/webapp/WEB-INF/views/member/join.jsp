<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

	<style type="text/css">
	.btn-warning {
	    margin-left: 10px;
	    margin-bottom: 5px;
	}
	.join_div {
		text-align: center;
		margin-bottom: 25px;
	}
	</style>
	
	<script type="text/javascript">
		// 중복 체크
		function fn_overlayCheck(type){
			var resultValue = "";
			
			if(type === "id")		{resultValue = $("#userId").val();}
			if(type === "nickName") {resultValue = $("#nickName").val();}
			
			if(resultValue == ""){
				if(type == "id"){
					$("#userId").focus();
				}
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
			
			data = JSON.stringify(data);

			$.ajax({
		         type			:"post"
		        ,url			: url
			  	,data			: data
		        ,contentType	: "application/json; charset=UTF-8"
		        ,success		: function(resultData, status, headers, config){
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
							        }
		        ,error 			: function(request,status,error){ alert(error); }
				,complete		: function(jqXHR){  } // 요청의 실패, 성공과 상관 없이 완료 될 경우 호출
		    }); 
		}
		
		function fn_sendEmail(){
			var url = "/authEmail"
			   ,data = {
					     params : {
					    	 			email 	: $("#email").val()
									}
					};

			data = JSON.stringify(data);
			var afterFn = function(resultData, status, headers, config){
						  	alert("이메일을 확인해주세요.");
					      };
			
			fn_callAjax(url, data, afterFn);
			
		};
		var formData = JSON.stringify($("#myForm").serializeArray());
		

		$(function(){
			jQuery.fn.serializeObject = function() { var obj = null; try { if(this[0].tagName && this[0].tagName.toUpperCase() == "FORM" ) { var arr = this.serializeArray(); if(arr){ obj = {}; jQuery.each(arr, function() { obj[this.name] = this.value; }); } } }catch(e) { alert(e.message); }finally {} return obj; }
			
			$("#submitBtn").bind("click",function(){
				var data = $("#myForm").serializeObject();
				
				$.ajax({
			         type			:"post"
			        ,url			:"insertMember.me"
				  	,data			: data
			        ,contentType	: "application/json; charset=UTF-8"
			        ,success		: function(resultData, status, headers, config){  }
			        ,error 			: function(request,status,error){ alert(error); }
					,complete		: function(jqXHR){  } // 요청의 실패, 성공과 상관 없이 완료 될 경우 호출
			    }); 
				
			})
		})
		
		
	</script>
	
	<section class="login first grey">
		<div class="container">
			<div class="box-wrapper">				
				<div class="box box-border">
					<div class="box-body">
						<h3>회원가입</h3>
						<form id="myForm" action="insertMember.me" method="post" class="form-horizontal" >
							<div class="form-group">
								<label>아이디</label>
								<!-- <a href="#" class="pull-right result"><span class="msg">아이디를 확인해주세요</span></a> -->
								<button type="button" id="checkBtn1" class="btn btn-warning bt-sm" onclick="fn_overlayCheck('id');">중복체크</button>
								<input type="text" id="userId" name="userId" class="form-control">
							</div>
							
							<div class="form-group">
								<label>닉네임</label>
								<button type="button" id="checkBtn2" class="btn btn-warning bt-sm" onclick="fn_overlayCheck('nickName');">중복체크</button>
								<input type="text" id="nickName" name="nickName" class="form-control">
							</div>
							
							<div class="form-group">
								<label>이름</label>
								<input type="text" name="userName" class="form-control">
							</div>
							
							<div class="form-group">
								<label class="fw">비밀번호</label>
								<input type="password" name="userPwd" class="form-control">
							</div>
							
							<div class="form-group">
								<label class="fw">비밀번호 확인</label>
								<input type="password" name="userPwdCheck" class="form-control">
							</div>
							
							<div class="form-group">
								<label class="fw">생년월일</label>
								<input type="date" class="form-control onlyNumber" name="birth" placeholder="YYYY-MM-DD">
							</div>
							
							<div class="form-group">
								<label class="fw">성별</label>
								<div>
									<select class="form-control" name="gender">
										<option value="M">남</option>
										<option value="F">여</option>
									</select>
								</div>
							</div>
							
							<div class="form-group">
								<label>이메일</label>
								<input type="email" id="email" name="email" class="form-control">
							</div>
							
							<div class="join_div">
								<button type="button" class="btn btn-success bt-lg" onclick="fn_sendEmail();">인증</button>
							</div>
							
							<div class="form-group">
								<label>인증번호</label>
								<input type="text" name="cNum" class="form-control">
							</div>
							
							<div class="join_div">
								<button type="button" class="btn btn-secondary bt-lg">확인</button>
							</div>
							
							<div class="form-group text-right">
								<button type="button" class="btn btn-primary btn-block" id="submitBtn">회원가입</button>
							</div>
							
							<div class="form-group text-center">
								<span class="text-muted">이미 계정이 있으신가요?</span> <a href="/loginView.me">로그인</a>
							</div>
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</section>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />