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
						<div class="col-lg-12">
							<div class="info" style="padding-top: 20px; padding-bottom: 20px;">
								<a href="chargeClover.me" class="genric-btn info circle arrow">클로버 충전
								<a href="chargeClover2.me" class="genric-btn info circle arrow">  / 클로버 충전 내역
								<a href="presentClover.me" class="genric-btn info circle arrow">  / 클로버 선물한 내역
								<a href="presentClover2.me" class="genric-btn info circle arrow">  / 클로버 선물받은 내역
								<span class="lnr lnr-arrow-right"></span></a>
							</div>
						</div>
						
						<br><br><br>
						<!-- 클로버 선물내역 -->
						<div>
							<h4>클로버 선물한 내역 &nbsp; &nbsp; (날짜 선택 : <input type="date" id="date1"> )</h4>
						  <table class="ui green table">
						  <thead>
						    <tr><th>클로버 개수</th>
						    <th>선물한 BJ</th>
						    <th>선물일시</th>
						  </tr></thead><tbody>
						    <tr>
						      <td>50개</td>
						      <td>철구</td>
						      <td>2019/01/02</td>
						    </tr>
						    <tr>
						      <td>200개</td>
						      <td>백구</td>
						      <td>2019/01/06</td>
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