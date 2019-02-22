<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		
<script type="text/javascript">

	//날짜 선택 후 검색시
	function searchPresent1(){
		
		var ptUno = ${sessionScope.loginUser.uno};
		var date1 = $("#date1").val();
		
		if(date1 == null){
			alert("날짜를 선택해 주세요!");
		}else{
			location.href = "searchGiveClover.me?date1="+date1+"&ptUno="+ptUno;
		}
		
	}
</script>

		
	<section class="post-content-area single-post-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post row">
						<!-- 소 nav -->
						<div class="ui tabular menu">
						  <a href="chargeClover.me" class="item" >클로버 충전</a>
						  <a href="chargeClover2.me?ptUno=${sessionScope.loginUser.uno}" class=" item" >클로버 충전 내역</a>
						  <a href="presentClover.me?ptUno=${sessionScope.loginUser.uno}" class="active item">클로버 선물한 내역</a>
						  <a href="presentClover2.me?ptUno=${sessionScope.loginUser.uno}" class="item">클로버 선물받은 내역</a>
						</div>
						
						<!-- 클로버 선물내역 -->
						<div>
							<h4>클로버 선물한 내역 &nbsp; &nbsp; (날짜 선택 : <input type="date" id="date1"> )
								<button onclick="searchPresent1();" class="ui inverted green button">검색</button></h4>
						  <table class="ui green table">
						  <thead>
						    <tr>
						    <th>번호</th>
						    <th>클로버 개수</th>
						    <th>선물한 BJ</th>
						    <th>선물일시</th>
						  </tr></thead>
						  <!-- ** jstl 반복문 ** -->  
						 <c:forEach items="${ givePresentList }" var="giveList"> 
						   <tr>
						   	  <td>${giveList.rnum }</td>
						      <td>${giveList.pcCnt }</td>
						      <td>${giveList.mNickName }</td>
						      <td>${giveList.pcDate }</td>
						    </tr> 
						 </c:forEach>
						  </tbody>
						</table>
						</div>
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
						<c:url var="listBack" value="/presentClover.me?ptUno=${sessionScope.loginUser.uno}">
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
							<c:url var="listCheck" value="/presentClover.me?ptUno=${sessionScope.loginUser.uno}">
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
						<c:url var="listEnd" value="/presentClover.me?ptUno=${sessionScope.loginUser.uno}">
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