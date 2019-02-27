<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		
	<section class="post-content-area single-post-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post row">
						<!-- 소 nav -->
						<div class="ui tabular menu">
						  <a href="chargeClover.me" class="item" >클로버 충전</a>
						  <a href="chargeClover2.me?ptUno=${sessionScope.loginUser.uno}" class="active item" >클로버 충전 내역</a>
						  <a href="presentClover.me?ptUno=${sessionScope.loginUser.uno}" class="item">클로버 선물한 내역</a>
						  <a href="presentClover2.me?ptUno=${sessionScope.loginUser.uno}" class="item">클로버 선물받은 내역</a>
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
						    <tr>
						    <!-- <th>번호</th> -->
						    <th>No.</th>
						    <th>구매일</th>
						    <th>충전 개수</th>
						    <th>결제 금액</th>
						    <th>결제승인번호</th>
						  </tr></thead><tbody>
						    <!-- ** jstl 반복문 ** -->  
						 <c:forEach items="${ chargeList }" var="chargeList"> 
						   <tr>
						   	  <td>${chargeList.rnum }</td>
						      <td>${chargeList.pDate }</td>
						      <td>${chargeList.cloverCnt } 개</td>
						      <td>${chargeList.cloverMoney } 원</td>
						      <td>${chargeList.pNo }</td>
						    </tr> 
						 </c:forEach>
						  </tbody>
						</table>
						</div>
						
						<script>
							function searchDate(){
								alert($("#date1").val());
								
								var date = $("#date1");
								
							}
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
						<c:url var="listBack" value="/chargeClover2.me?ptUno=${sessionScope.loginUser.uno}">
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
							<c:url var="listCheck" value="/chargeClover2.me?ptUno=${sessionScope.loginUser.uno}">
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
						<c:url var="listEnd" value="/chargeClover2.me?ptUno=${sessionScope.loginUser.uno}">
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