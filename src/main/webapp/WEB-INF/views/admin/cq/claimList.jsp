<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/layout/admin/ad_header.jsp" />

<style type="text/css">
	#listArea th {
		text-align: center;
	}
</style>

<script type="text/javascript">
$(function(){
	$("#listArea td").mouseenter(function(){
		$(this).parent().css({"background" : "#EFFBF5", "cursor" : "pointer"});
	}).mouseout(function(){
		$(this).parent().css({"background" : "white"})
	}).click(function(){
		var no = $(this).parent().children().eq(1).text();
		
		console.log(no);
		
		location.href="/claimOne.ad?no=" + no;
	});
});
</script>

<section class="home">
	<div class="container">
		<div class="row" >
		
			<div class="ui tabular menu">
				<a href="/claimList.ad" class="active item" >신고 관리</a>
			  	<a href="/questionList.ad" class="item" >문의 관리</a>
			</div>
		
			<div class="line"></div>
			
			<div class="center-block">
				<table class="table" id="listArea">
					<tr id="listHeader">
						<th>No.</th>
						<th>신고 번호</th>
						<th>작성자</th>
						<th>신고 유형</th>
						<th>제목</th>
						<th>작성일</th>
					</tr>
					
					<c:forEach var="c" items="${cList}">
					<tr>
						<td>${c.rownum}</td>
						<td>${c.cqNo}</td>
						<td>${c.userId}</td>
						<td>${c.cqClass}</td>
						<td>${c.cqTitle}</td>
						<td>${c.cqDate}</td>
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
						<c:url var="listBack" value="/claimList.ad">
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
							<c:url var="listCheck" value="/claimList.ad">
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
						<c:url var="listEnd" value="/claimList.ad">
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
</section>
		
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />