<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

 <!-- 계좌 인증 -->
	
<script>


$(function(){
	//계좌 인증
	$("#checkBank").click(function(){
         $("#bank_code_std").val($("#bankcode").val());
         $("#account_num").val($("#accnum").val());
         $("#tran_dtime").val($("#today").val());
         
         var client_id = "l7xx9b5156c8c8084e1cb23e627addca4554";
         var client_secret = "7b18a5b8434b496baadc35397d8caf56";
         var grant_type = "client_credentials";
         var scope = "oob";
         $.ajax({
            //url: "/tpt/test/getOauthToken",
            url : "https://testapi.open-platform.or.kr/oauth/2.0/token",
            type : "POST",
            contenttype:"application/x-www-form-urlencoded; charset=UTF-8",
            //cache: false,
            contenType : "application/json",
            data : {
               "client_id" : client_id,
               "client_secret" : client_secret,
               "grant_type" : grant_type,
               "scope" : scope
            },
            dataType : "json",
            success : function(data, data2, data3) {
               var list = JSON.parse(data3.responseText);
               $("#access_token").val(list.access_token);
               //$("#user_seq_no").val(list.user_seq_no);
               fnSearchRealName();
            },
            error : function(data, data2, data3) {
               alert('error!!!');
            }
         });
	});
      /* 계좌실명조회API */
      function fnSearchRealName() {
         var depositor = $("#SName").val(); //이름
         var bank_code_std = $("#bank_code_std").val(); //은행코드
         var account_num = $("#account_num").val(); //계좌번호
         var account_holder_info = $("#birth").val(); //생년월일
         var tran_dtime = $("#tran_dtime").val(); //인증일
         
         var access_token = "Bearer " + $("#access_token").val();
         
         console.log("depositor : " + depositor);
         console.log("bank_code_std : " + bank_code_std);
         console.log("account_num : " + account_num);
         console.log("account_holder_info : " + account_holder_info);
         console.log("tran_dtime : " + tran_dtime);
         console.log("access_token" + access_token);
         
         
         var resData = {
            "bank_code_std" : bank_code_std,
            "account_num" : account_num,
            "account_holder_info" : account_holder_info,
            "tran_dtime" : tran_dtime
         };
         //입력받은 이름, 은행명, 계좌번호, 요청일시를 사이트전송해서 확인하기 
         $.ajax({
                  url : "https://testapi.open-platform.or.kr/v1.0/inquiry/real_name",
                  beforeSend : function(request) {
                     request.setRequestHeader("Authorization",
                           access_token);
                  },
                  type : "POST",
                  data : JSON.stringify(resData),
                  dataType : "json",
                  success : function(data) {
                     /* console.log(data); */
                     if (data.account_holder_name == depositor &&
                    		 data.account_holder_info == account_holder_info &&
                     data.account_num == account_num && data.bank_code_std == bank_code_std) {
                    	 alert("계좌 인증 성공");
                    	 console.log(data);
                    	 
                    	 window.location.reload();
                     } else {
                        alert("계좌 인증 실패");
                     }
                  }
            
               });
      }
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
								<input id="SName" name="userName" type="text"> 
							</div>
							<div class="form-group">
								<label class="fw">은행선택</label>
								<select name="bankcode" id="bankcode">
			                     <option value="004">국민은행</option>
			                     <option value="003">기업은행</option>
			                     <option value="088">신한은행</option>
			                     <option value="011">농협</option>
			                     <option value="020">우리은행</option>
			                  </select>
							</div>
							<div class="form-group">
								<label class="fw">계좌번호</label>
								<input type="text" size="25" placeholder="'-'를 제외하고 입력" name="accnum" id="accnum"><br>
							</div>
							<div class="form-group">
								<label class="fw">생년월일</label>
								 <input type="text" size="25" placeholder="'-'를 제외하고 6자리" name="birth" id="birth">&nbsp;
							</div>
							<div class="form-group text-right">
								<a class="btn btn-primary btn-block" id="checkBank">확인</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		
	<!-- 연습 -->
	<div>
      <table>
         <colgroup>
            <col style="width: 180px" />
            <col style="width: *" />
         </colgroup>
         <tbody>
           <tr>내가 넣음 tr
               <form name="authCodeFrm" id="authCodeFrm" method="GET" action="https://testapi.open-platform.or.kr/oauth/2.0/authorize">
                  <input type="hidden" id="response_type" name="response_type" value="code" /> 
                  <input type="hidden" id="scope" name="scope" value="inquiry" /> 
                  <input type="hidden" id="redirect_uri" name="redirect_uri" value="http://localhost:8002/html/callback.html" />
               
            </tr>
            <tr>
               <th>
                  <%
                     Calendar cal = Calendar.getInstance();
                     java.util.Date date = cal.getTime();
                     String today = (new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(date));
                  %>
                  <input id="today" type="hidden" value="<%= today %>" ><br>
               </th>
               <td><span><input type="hidden" id="access_token" name="access_token"></span> 
            </tr>
            <tr>
               <th>
                  <!-- <span>은행코드</span> -->
               </th>
               <td><span><input type="hidden" class="txt" id="bank_code_std" name="bank_code_std"></span></td>
            </tr>
            <tr>
               <th>
                  <!-- <span>계좌번호</span> -->
               </th>
               <td><span><input type="hidden" class="txt" id="account_num" name="account_num"></span></td>
            </tr>
            <tr>
               <th>
                  <!-- <span>예금주 생년월일</span> -->
               </th>
               <td><span> <input type="hidden" class="txt" id="account_holder_info" name="account_holder_info" /></span>
            
            </tr>
            <tr>
               <th>
                  <!-- <span>요청일시</span> -->
               </th>
               <td><span style="width: 200px"><input type="hidden" class="txt" id="tran_dtime" title="요청일시 입력" name="tran_dtime" /></span>
                  <!-- <button type="button" onclick="fnSearchRealName()">계좌실명조회</button> --></td>
            </tr>
            <!-- <tr>       
               <th><span>계좌실명조회결과</span></th>
               <td>             
                  <textarea style="height:220px;width:250px" id="real_name" name="real_name"></textarea>
               </td>
            </tr> -->
            </form>
         </tbody>
         
      </table>

   </div> 
</section>
	
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />