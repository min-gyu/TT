<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/admin/ad_header.jsp" />
<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="home">
	<div class="container">
		<div class="row" >
			<div class="col-lg-8 posts-list" >
			<div class="single-post row" >
			<div class="ui tabular menu">
			  <a href="chargeClover.ad" class="active item" >충전 내역</a>
			  <a href="exchangeClover.ad" class="item" >환전 내역</a>
			</div>
			<br>
			
			<div class="form-inline">
				<h3><image src="/resources/images/clover/clover.jpg" width="50px" height="50px">
				충전 내역</h3>
				<!-- <input class="form-control mr-sm-2" type="search" placeholder="아이디/닉네임을 입력하세요" aria-label="Search" id="searchName"> 
				<button class="btn btn-success" id="searchBtn">Search</button> -->
			</div>
			<div class="line"></div>
			
			<div class="center-block">
				<table class="table" id= "listArea">
					<tr id="listHeader">
						<th>No.</th>
						<th>회원번호</th>
						<th>충전클로버(개)</th>
						<th>결제금액</th>
						<th>결제번호</th>
						<th>결제날짜</th>
					</tr>
				  <!-- ** jstl 반복문 ** -->  
					 <c:forEach items="${ chargeList }" var="chargeList"> 
					   <tr>
					   	  <td>${chargeList.rnum }</td>
					      <td>${chargeList.pUno }</td>
					      <td>${chargeList.cloverCnt } 개</td>
					      <td>${chargeList.cloverMoney } 원</td>
					      <td>${chargeList.pNo }</td>
					      <td>${chargeList.pDate }</td>
					    </tr> 
					 </c:forEach>
				</table>
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
						<c:url var="listBack" value="/chargeClover.ad">
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
							<c:url var="listCheck" value="/chargeClover.ad">
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
						<c:url var="listEnd" value="/chargeClover.ad">
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
	
	</div>
</section>
		
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
