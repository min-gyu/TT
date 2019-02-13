<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		
	<section class="post-content-area single-post-area">
		<div class="container">
			<h2>My문의</h2>
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post row">
						<br>
						<!-- My문의 내역 조회 -->
						<div>
						  <table class="ui green table" id="questionTable">
						  <thead>
						    <th>No.</th>
						    <th>문의유형</th>
						    <th>제목</th>
						    <th>내용</th>
						    <th>문의날짜</th>
						    
						  <!-- ** jstl 반복문 ** -->  
						 <c:forEach items="${ questionList }" var="ql"> 
						   <tr>
						      <td>${ql.cqNo }</td>
						      <td>${ql.cqClass }</td>
						      <td>${ql.cqTitle }</td>
						      <td>${ql.cqContent}</td>
						      <td>${ql.cqDate }</td>
						    </tr> 
						 </c:forEach>
						    
						  </tbody>
						</table>
						
						<!-- 페이징 버튼 영역 -->
						<div align="center">
							 <button class="ui green basic button">1</button>
						</div>
						</div>
						
						<!-- 게시판 클릭시 -->
						<script>
							$(function(){
								
								$("#questionTable").find("td").mouseenter(function(){
									$(this).parents("tr").css({"background":"green","color":"white","cursor":"pointer"});
								}).mouseout(function(){
									$(this).parents("tr").css({"background":"white","color":"black"});
								}).click(function(){
									var bid=$(this).parents().children("td").eq(0).text();
									/* console.log(bid2); */
									location.href="selectQuestionOne.me?bid="+bid;
								});
							});
						</script>

						
						
					</div>	
				</div>
			</div>
		</div>	
	</section>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />