<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
		
	<section class="post-content-area single-post-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post row">
						<!-- 소 nav -->
						<div class="ui tabular menu">
						  <a href="chargeClover.me" class="item" >클로버 충전</a>
						  <a href="chargeClover2.me" class="active item" >클로버 충전 내역</a>
						  <a href="presentClover.me?ptUno=${sessionScope.loginUser.uno}" class="item">클로버 선물한 내역</a>
						  <a href="presentClover2.me" class="item">클로버 선물받은 내역</a>
						</div>
						<!-- 보유클로버 현황 -->
						<div class="ui segment">
							<div class="ui segment">${ sessionScope.loginUser.userName}님이 보유중인 클로버는 ${ sessionScope.loginUser.totalClover} 개 입니다.
	  						<div class="ui fitted divider"></div>
	  						<br>▶ 이미 선물한 클로버 : 12개<br></div>
						</div><br>
						
						<!-- 클로버 충전내역 -->
						<div>
							<h4>클로버 충전내역 &nbsp; &nbsp; (날짜 선택 : <input type="date" id="date1"> )
							<button class="ui inverted green button" onclick="searchDate();">검색</button></h4>
						  <table class="ui green table">
						  <thead>
						    <tr><th>구매일</th>
						    <th>충전 개수</th>
						    <th>결제 금액</th>
						    <th>결제승인번호</th>
						  </tr></thead><tbody>
						    <tr>
						      <td>2019/01/02</td>
						      <td>50개</td>
						      <td>5,500</td>
						      <td>111-222-2222</td>
						    </tr>
						    <tr>
						      <td>2019/01/06</td>
						      <td>100개</td>
						      <td>11,000</td>
						      <td>111-222-2222</td>
						    </tr>
						  </tbody>
						</table>
						
						
					
						
						<div align="center">
							 <button class="ui green basic button">1</button>
						</div>
						</div>
						
						<script>
							function searchDate(){
								alert($("#date1").val());
								
								var date = $("#date1");
								
							}
						</script>
						
					</div>	
				</div>
			</div>
		</div>	
	</section>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />