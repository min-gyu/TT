<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
		
	<section class="post-content-area single-post-area">
		<div class="container">
			<h2>My문의</h2>
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post row">
						<br>
						<!-- My문의 내역 조회 -->
						<div>
						  <table class="ui green table">
						  <thead>
						    <th>No.</th>
						    <th>문의유형</th>
						    <th>제목</th>
						    <th>내용</th>
						    <th>문의날짜</th>
						    <tr>
						      <td>1</td>
						      <td>장애/버그</td>
						      <td>동영상끊김</td>
						      <td>동영상이끊겨서 보기가 너무 힘들어요.</td>
						      <td>2019/01/15</td>
						    </tr>
						    <tr>
						      <td>2</td>
						      <td>클로버 환전</td>
						      <td>충전개수 제한</td>
						      <td>10000개 이상은 불가능한가요?</td>
						      <td>2019/01/25</td>
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