<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
	$(function(){
		//환전하기 클릭시
		//모달로 팝업창 띄우기
		//보유클로버보다 적은양의 클로버만 환전가능
		$("#exchange").click(function(){
			console.log("함수작동");
			/* location.href="exchangeClover.me?mUno=${mUno}"; */
			
			$("#myModal").modal().show();
			outReason();
		});
		
		//모달띄우고 환전신청금액 받기
		function outReason() {
			
			var mUno = ${mUno};
			console.log("outReason에서 mUno : "+mUno);
			
			//환전신청할 클로버 수 선택 
			$("#btn").click(function(){
				var cnt = $("input[name='reason']:checked").val();
				
				//이제 회원번호랑 이유 넘기기
				location.href="exchangeClover2.me?mUno="+mUno+"&cnt="+cnt;
			
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

		
	<section class="post-content-area single-post-area">
		<div class="container">
			<h2>환전 관리</h2>
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post row">
						<br>
						<!-- 환전 관리 -->
						<div>
						 <a class="btn btn-primary more" id="exchange" margin-left="700px">
							<div>환전 신청하기(click)</div>
							<div>
								<i class="ion-ios-arrow-thin-right"></i>
							</div>
						 </a>
						  <table class="ui green table">
						  <thead>
						    <tr>
						    <th>No.</th>
						    <th>클로버수</th>
						    <th>실수령액</th>
						    <th>은행명</th>
						    <th>계좌번호</th>
						    <th>일시</th>
						    <th>상태</th>
						  </tr></thead><tbody>
						    <tr>
						      <td>1</td>
						      <td>100</td>
						      <td>9000</td>
						      <td>신한은행</td>
						      <td>111-1111-1111</td>
						      <td>2019/01/02</td>
						      <td>환전신청</td>
						    </tr>
						    <tr>
						      <td>2</td>
						      <td>500</td>
						      <td>45000</td>
						      <td>하나은행</td>
						      <td>333-1111-1111</td>
						      <td>2019/01/12</td>
						      <td>환전완료</td>
						    </tr>
						  </tbody>
						</table>
						
						<div align="center">
							 <button class="ui green basic button">1</button>
						</div>
						</div>
						
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
			   		<input type="radio" name="reason" value="500">500개(실수령액 : 45000원)<br>
			   		<input type="radio" name="reason" value="1000">1000개(실수령액 : 90000원)<br>
			   		<input type="radio" name="reason" value="1500">1500개(실수령액 : 135000원)<br>
			   		<input type="radio" name="reason" value="2000">2000개(실수령액 : 180000원)<br>
			    </div>
				      
			    <div class="modal-footer">
			    	<a type="button" class="btn btn-success" data-dismiss="modal" id="btn">확인</a>
			    </div>
		   	</div>
	    
  		</div>
	</div>
</section>


<jsp:include page="/WEB-INF/views/layout/footer.jsp" />