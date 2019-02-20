<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		
	<section class="post-content-area single-post-area">
		<div class="container">
			<h2>My신고</h2>
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post row">
						<br>
						<!-- My신고 내역 조회 -->
						<div>
						  <table class="ui green table" id="claimTable">
						  <thead>
						    <th>No.</th>
						    <th>신고유형</th>
						    <th>제목</th>
						    <th>내용</th>
						    <th>신고날짜</th>
						    <!-- ** jstl 반복문 ** - jstl 선언문 반드시 쓰기!! -->  
						 <c:forEach items="${ claimList }" var="cl"> 
						   <tr>
						      <td>${cl.cqNo }</td>
						      <td>${cl.cqClass }</td>
						      <td>${cl.cqTitle }</td>
						      <td>${cl.cqContent}</td>
						      <td>${cl.cqDate }</td>
						    </tr> 
						 </c:forEach>
						  </tbody>
						</table>
						
						<div align="center">
							 <button class="ui green basic button">1</button>
						</div>
						</div>
						
						
						<!-- 게시판 클릭시 -->
						<script>
							$(function(){
								$("#claimTable").find("td").mouseenter(function(){
									$(this).parents("tr").css({"background":"green","color":"white","cursor":"pointer"});
								}).mouseout(function(){
									$(this).parents("tr").css({"background":"white","color":"black"});
								}).click(function(){
									var bid=$(this).parents().children("td").eq(0).text();
									/* console.log(bid2); */
									location.href="selectClaimOne.me?bid="+bid;
								});
							});
						</script>
						
						
					</div>	
					
					<!-- 페이징 영역 -->
			<div class="center-block">
				<ul class="pagination mx-auto" style="justify-content: center;">
					<c:if test="${ pi.currentPage <= 1 }">
						<li class="page-item disabled">
		                    <a class="page-link" href="#" aria-label="Previous">
		                        <span aria-hidden="true">«</span>
		                        <span class="sr-only">Previous</span>
		                    </a>
		                </li>
					</c:if>
					
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="listBack" value="/claim.me?cqUno=${sessionScope.loginUser.uno}">
							<c:param name="currentPage" value="${ pi.currentPage - 1 }" />
						</c:url>
						<li class="page-item disabled">
		                    <a class="page-link" href="${ listBack }" aria-label="Previous">
		                        <span aria-hidden="true">«</span>
		                        <span class="sr-only">Previous</span>
		                    </a>
		                </li>
					</c:if>
					
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<li class="page-item active"><a class="page-link" href="#">${ p }</a></li>
						</c:if>
						
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="listCheck" value="/claim.me?cqUno=${sessionScope.loginUser.uno}">
								<c:param name="currentPage" value="${ p }" />
							</c:url>
							<li class="page-item"><a href="${ listCheck }">${ p }</a></li>
						</c:if>
					</c:forEach>
					
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						<li class="page-item">
		                    <a class="page-link" href="#" aria-label="Next">
		                        <span aria-hidden="true">»</span>
		                        <span class="sr-only">Next</span>
		                    </a>
		                </li>
					</c:if>
					
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="listEnd" value="/claim.me?cqUno=${sessionScope.loginUser.uno}">
							<c:param name="currentPage" value="${ pi.currentPage + 1 }" />
						</c:url>
						<li class="page-item">
		                    <a class="page-link" href="${ listEnd }" aria-label="Next">
		                        <span aria-hidden="true">»</span>
		                        <span class="sr-only">Next</span>
		                    </a>
		                </li>
					</c:if>
				</ul>
			</div>
				</div>
			</div>
		</div>	
	</section>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />