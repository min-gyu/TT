<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/admin/ad_header.jsp" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<style>
	{
		font-color:white;
	}
</style>

<section class="home">
	<div class="container">
		<div class="row" >
			<div class="col-lg-8 posts-list">
			<div class="single-post row">
			<div class="ui tabular menu">
			  <a href="chargeClover.ad" class=" item" >충전 내역</a>
			  <a href="exchangeClover.ad" class="active item" >환전 내역</a>
			</div>
			<br>
			
			<div class="form-inline">
				<h3><image src="/resources/images/clover/clover.jpg" width="50px" height="50px">
				환전 관리</h3>
				<!-- <input class="form-control mr-sm-2" type="search" placeholder="아이디/닉네임을 입력하세요" aria-label="Search" id="searchName"> 
				<button class="btn btn-success" id="searchBtn">Search</button> -->
			</div>
			<div class="ui tabular menu">
					  <a href="exchangeClover.ad" class="item" >환전신청 내역</a>
					  <a href="exchangeClover2.ad" class="active item" >환전 완료내역</a>
			</div>
			
			<!-- 테이블 -->
			<div class="center-block">
				<table class="table" id= "listArea">
					<tr id="listHeader">
						<th>No.</th>
						<th>아이디</th>
						<th>이름</th>
						<th>신청클로버</th>
						<th>실수령액</th>
						<th>은행명</th>
						<th>계좌번호</th>
						<th>일시</th>
						<th>상태</th>
					</tr>
					<!-- ** jstl 반복문 ** -->  
					<c:forEach items="${ exchange2List }" var="exchange2List"> 
					   <tr>
					   	  <td>${exchange2List.rnum }</td>
					   	  <td>${exchange2List.mId }</td>
					   	  <td>${exchange2List.mName }</td>
					      <td>${exchange2List.exCloverCnt }</td>
					      <td>${exchange2List.exCloverCnt *90} 원</td>
					      <td>${exchange2List.mBank }</td>
					      <td>${exchange2List.mBankNo }</td>
					      <td>${exchange2List.elDate }</td>
					      <td>${exchange2List.elStatus }</td>
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
						<c:url var="listBack" value="/exchangeClover2.ad">
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
							<c:url var="listCheck" value="/exchangeClover2.ad">
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
						<c:url var="listEnd" value="/exchangeClover2.ad">
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
