<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/layout/admin/ad_header.jsp" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style type="text/css">
	#listArea th {
		text-align: center;
	}
</style>

<script type="text/javascript">
	function searchBoard(){
		var searchValue = $("#search").val();
		
		console.log(searchValue);
		
		location.href = "searchAll.ad?searchValue=" + searchValue;
		
	}
</script>

<section class="home">
	<div class="container">
		<div class="row" >
		
			<div class="ui tabular menu">
				<a href="/memberList.ad" class="active item" >전체 회원 조회</a>
			  	<a href="/banList.ad" class="item" >정지 회원</a>
			  	<a href="/leaveList.ad" class="item" >탈퇴 회원</a>
			</div>
			
			<br><br>
			
			<div class="form-inline">
				<input class="form-control mr-sm-3" type="search" id="search" placeholder="아이디를 입력하세요"> 
				<button class="btn btn-success" id="searchBtn" onclick="searchBoard();">Search</button>
			</div>
			
			<div class="line"></div>
			<div align="right">
			<button onclick="ban();">정지</button>
			<button id="leave">탈퇴</button>
			</div>
			<h5 style="color: orangered;">* 신규 등록 순</h5>
			<div class="center-block">
				<table class="table" id= "listArea">
					<tr id="listHeader">
						<th> </th>
						<th>No.</th>
						<th>이름</th>
						<th>아이디</th>
						<th>닉네임</th>
						<th>성별</th>
						<th>사용은행</th>
						<th>경고횟수</th>
						<th>정지여부</th>
						<th>탈퇴여부</th>
						<th>로그인구분</th>
					</tr>
					
					<c:forEach var="m" items="${mList}">
					<tr>
						<td><input id = "check" type="checkbox" value=${m.userId}></td>
						<td>${m.rownum}</td>
						<td>${m.userName}</td>
						<td>${m.userId}</td>
						<td>${m.nickName}</td>
						<td>${m.gender}</td>
						<td>${m.bank}</td>
						<td>${m.warningNo}회</td>
						<td>${m.banStatus}</td>
						<td>${m.status}</td>
						<td>${m.loginType}</td>
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
						<c:url var="listBack" value="/memberList.ad">
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
							<c:url var="listCheck" value="/memberList.ad">
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
						<c:url var="listEnd" value="/memberList.ad">
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
<script>
	function ban(){
		var exchangeList = new Array;
		//체크박스중 선택된값 있으면 배열에 담기
		$("#check:checked").each(function(){
			exchangeList.push($(this).val());	
		});
		
		var arr1=new Array;
		arr1 = exchangeList;
		console.log(arr1);
		
	 	window.open("/banPopOpen.ad?userId="+arr1, "방송 설정",
		"top=50,left=500,width=300,height=250"); 
	
	}
</script>
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />