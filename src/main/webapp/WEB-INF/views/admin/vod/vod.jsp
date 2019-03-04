<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/layout/admin/ad_header.jsp" />

<script type="text/javascript">


			function moreVod(buNo,bNo) {
				var buNo=buNo;
				var bNo=bNo;
				var url="/vod_oneList.ch?bNo="+bNo+"&CuNo="+buNo;
				window.open(url, "상세보기",
						"width=1000, height=1000, left=1000, top=1000");
			};
			
			$(function(){
				var arr=new Array;
				
				$("#deletebtn").click(function(){
					
					var list=new Array;
					$("#check:checked").each(function(){
						list.push($(this).val());
					});
					
					var arr1=new Array;
					arr1=list;
					
					$.ajax({
						url:"deleteAvod.ad",
						type:"GET",
						data:{arr1:arr1},
						success:function(data){
							alert("삭제 완료");
							window.location.reload();
						},
						error:function(data){
							alert("삭제 실패");
							window.location.reload();
						}
						
					});
				});
				
				
			});
			
</script>
<section class="home">
	<div class="container">
		<div class="row" >
			<div class="form-inline">
				<h3>VOD 관리</h3>
			</div>
			<div class="line"></div>
			<div align="right">
				<button style="margin-bottom: 5px;" id="deletebtn">삭제</button>
			</div>
			
			<div class="center-block">
				<table class="table" id= "listArea"  >
					<tr id="listHeader">
						<th style="text-align: center;">No</th>
						<th style="text-align: center;">작성자 아이디</th>
						<th style="text-align: center;">제목</th>
						<th style="text-align: center;">VOD등록 날짜</th>
						<th style="text-align: center;">상세보기</th>
					</tr>
					<c:forEach var="list" items="${list}">
					<tr>
						<td><input type="checkbox" id="check"  value="${list.bNo }"></td>
						<td>${list.userId}</td>
						<td>${list.bTitle}</td>
						<td>${list.bwDate }</td>
						<td><button id="morebtn" onclick="moreVod(${list.buNo},${list.bNo });" >더보기</button></td>
					<tr>
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
						<c:url var="listBack" value="/adminVod.ad">
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
							<c:url var="listCheck" value="/adminVod.ad">
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
						<c:url var="listEnd" value="/adminVod.ad">
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
	            </ul>
        	</div>
			
		</div>
	</div>
</section>

		
				
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />

