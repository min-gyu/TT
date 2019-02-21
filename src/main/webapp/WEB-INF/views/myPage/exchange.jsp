<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
		
	<section class="post-content-area single-post-area">
		<div class="container">
			<h2>환전 관리</h2>
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post row">
						<br>
						<!-- 환전 관리 -->
						<div>
						 <a class="btn btn-primary more" href="#" margin-left="700px">
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

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />