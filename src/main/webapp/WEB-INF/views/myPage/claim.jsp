<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
		
	<section class="post-content-area single-post-area">
		<div class="container">
			<h2>My신고</h2>
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post row">
						<br>
						<!-- My신고 내역 조회 -->
						<div>
						  <table class="ui green table">
						  <thead>
						    <tr><th>&nbsp;</th>
						    <th>No.</th>
						    <th>신고유형</th>
						    <th>제목</th>
						    <th>내용</th>
						    <tr>
						      <td><input type="checkbox"></td>
						      <td>1</td>
						      <td>저작권 침해</td>
						      <td>저작권</td>
						      <td>제가 올린 VOD를 일부분만 수정하여 게시하였습니다.</td>
						    </tr>
						    <tr>
						      <td><input type="checkbox"></td>
						      <td>2</td>
						      <td>청소년 유해</td>
						      <td>음란</td>
						      <td>미성년자가 시청하기에 매우 음란합니다.</td>
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