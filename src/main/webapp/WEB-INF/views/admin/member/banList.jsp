<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/layout/admin/ad_header.jsp" />

<style type="text/css">
	#listArea th {
		text-align: center;
	}
</style>

<script type="text/javascript">
	function searchBoard(){
		var searchValue = $("#search").val();
		
		console.log(searchValue);
		
		location.href = "searchBan.ad?searchValue=" + searchValue;
	}
</script>

<section class="home">
	<div class="container">
		<div class="row" >
		
			<div class="ui tabular menu">
				<a href="/memberList.ad" class="item" >전체 회원 조회</a>
			  	<a href="/banList.ad" class="active item" >정지 회원</a>
			  	<a href="/leaveList.ad" class="item" >탈퇴 회원</a>
			</div>
			
			<br><br>
			
			<div class="form-inline">
				<input class="form-control mr-sm-3" type="search" id="search" placeholder="아이디를 입력하세요"> 
				<button class="btn btn-success" id="searchBtn" onclick="searchBoard();">Search</button>
			</div>
			
			<div class="line"></div>
			
			<div class="center-block">
				<table class="table" id= "listArea">
					<tr id="listHeader">
						<th>No.</th>
						<th>아이디</th>
						<th>닉네임</th>
						<th>경고횟수</th>
						<th>정지사유</th>
						<th>시작일</th>
						<th>종료일</th>
					</tr>
					
					<c:forEach var="b" items="${bList}">
					<tr>
						<td>${b.rownum}</td>
						<td>${b.userId}</td>
						<td>${b.nickName}</td>
						<td>${b.warningNo}회</td>
						<td>${b.banReason}</td>
						<td>${b.startDate}</td>
						<td>${b.endDate}</td>
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
						<c:url var="listBack" value="/banList.ad">
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
							<c:url var="listCheck" value="/banList.ad">
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
						<c:url var="listEnd" value="/banList.ad">
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