<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
		
	<section class="post-content-area single-post-area">
		<div class="container">
			<h2>쪽지함</h2>
			<div class="row" style="margin-left:200px;">
				<div class="col-lg-8 posts-list">
					<div class="single-post row">
						<br>
						<div>
						 	<button>삭제</button><button>신고</button>
						  <table class="ui green table">
						  <thead>
						    <tr><th>&nbsp;</th>
						    <th>No.</th>
						    <th>보낸 사람</th>
						    <th>쪽지 내용</th>
						    <th>보낸 시각</th>
						    <th>읽은 시각</th>
						   
						  </tr></thead><tbody>
						    <tr>
						      <td><input type="checkbox"></td>
						      <td>1</td>
						      <td>한민규</td>
						      <td>ㅎㅇ</td>
						      <td>2019-02-06 09:11:12</td>
						      <td>2019-02-06 15:10:00</td>
						    </tr>
						    <tr>
						      <td><input type="checkbox"></td>
						      <td>2</td>
						      <td>한민규</td>
						      <td>ㅎㅇㅎㅇ</td>
						      <td>2019-01-05 05:05:05</td>
						      <td>2019-01-16 09:10:23</td>
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