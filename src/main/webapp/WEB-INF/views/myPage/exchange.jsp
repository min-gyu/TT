<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script>
	
	$(function(){
		//환전하기 클릭시
		//모달로 팝업창 띄우기
		//보유클로버보다 적은양의 클로버만 환전가능
		$("#exchange").click(function(){
			
			var bank = "${m.getBankNo()}";
			console.log("넘겨받은값 : "+ bank);
			
			if(bank==""){
				alert("계좌를 먼저 등록해주세요!");
			}else{
				$("#myModal").modal().show();
				outReason();
			}
		});
		
		//모달띄우고 환전신청금액 받기
		function outReason() {
			
			var mUno = ${mUno};
			var totalClover = ${m.getTotalClover()};
			console.log(totalClover);
			
			/* var radio1 = $("input[name='reason']").get(0);
			console.log(radio1); */
			
			if(totalClover < 500){
				$("input[name='reason']").get(0).disabled = true;
				$("input[name='reason']").get(1).disabled = true;
				$("input[name='reason']").get(2).disabled = true;
				$("input[name='reason']").get(3).disabled = true;
			}else if(totalClover < 1000){
				$("input[name='reason']").get(0).disabled = false;
				$("input[name='reason']").get(1).disabled = true;
				$("input[name='reason']").get(2).disabled = true;
				$("input[name='reason']").get(3).disabled = true;
			}else if(totalClover < 1500){
				$("input[name='reason']").get(0).disabled = false;
				$("input[name='reason']").get(1).disabled = false;
				$("input[name='reason']").get(2).disabled = true;
				$("input[name='reason']").get(3).disabled = true;
			}else if(totalClover < 2000){
				$("input[name='reason']").get(0).disabled = false;
				$("input[name='reason']").get(1).disabled = false;
				$("input[name='reason']").get(2).disabled = false;
				$("input[name='reason']").get(3).disabled = true;
			}else{
				$("input[name='reason']").get(0).disabled = false;
				$("input[name='reason']").get(1).disabled = false;
				$("input[name='reason']").get(2).disabled = false;
				$("input[name='reason']").get(3).disabled = false;
			}
			
			


			
			
			//환전신청할 클로버 수 선택 
			$("#btn").click(function(){
				var cnt = $("input[name='reason']:checked").val();
				
				//이제 회원번호랑 이유 넘기기
				location.href="exchangeClover2.me?mUno="+mUno+"&cnt="+cnt;
			
			});
				
			/*  $.ajax({
					url :  "/out.me",	
					type : "post",	
					data : {
								mUno : ${member2.getUno()}; 
							},
							
					success : function(data){	// 성공시 
						 console.log("성공!");
					},
					error : function(){
						console.log("실패!");
					}
				}); */
		}
	});

</script>

		
	<section class="post-content-area single-post-area">
		<div class="container">
			<h2>환전 관리</h2>
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post row">
						<br>
						<!-- 환전 관리 -->
						<div>
						 <a class="btn btn-primary more" id="exchange" margin-left="700px">
							<div>환전 신청하기(click)</div>
							<div>
								<i class="ion-ios-arrow-thin-right"></i>
							</div>
						 </a>
						  <table class="ui green table">
						  <thead>
						    <tr>
						    <th>No.</th>
						    <th>클로버수</th>
						    <th>실수령액</th>
						    <th>은행명</th>
						    <th>계좌번호</th>
						    <th>일시</th>
						    <th>상태</th>
						  </tr></thead><tbody>
						 <!-- ** jstl 반복문 ** -->  
						 <c:forEach items="${ ExchangeList }" var="ExchangeList"> 
						   <tr>
						   	  <td>${ExchangeList.rnum }</td>
						      <td>${ExchangeList.exCloverCnt }</td>
						      <td>${ExchangeList.exCloverCnt *90} 원</td>
						      <td>${ExchangeList.mBank }</td>
						      <td>${ExchangeList.mBankNo }</td>
						      <td>${ExchangeList.elDate }</td>
						      <td>${ExchangeList.elStatus }</td>
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
						<c:url var="listBack" value="/exchangeClover.me?mUno=${sessionScope.loginUser.uno}">
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
							<c:url var="listCheck" value="/exchangeClover.me?mUno=${sessionScope.loginUser.uno}">
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
						<c:url var="listEnd" value="/exchangeClover.me?mUno=${sessionScope.loginUser.uno}">
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
	
	<section>
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog" style="margin-top: 200px;">
		<div class="modal-dialog">
	  
			<!-- Modal content-->
			<div class="modal-content">
			    
			    <div class="modal-header">
			     	<button type="button" class="close" data-dismiss="modal">&times;</button>
				    <h4 class="modal-title">탈퇴 사유</h4>
			    </div>
				      
			    <div class="modal-body">
			    <%-- <c:if test=""> --%>
			   		<input type="radio" name="reason" value="500">500개(실수령액 : 45000원)<br>
			   		<input type="radio" name="reason" value="1000">1000개(실수령액 : 90000원)<br>
			   		<input type="radio" name="reason" value="1500">1500개(실수령액 : 135000원)<br>
			   		<input type="radio" name="reason" value="2000">2000개(실수령액 : 180000원)<br>
			    </div>
				<%-- </c:if>	 --%>      
			    <div class="modal-footer">
			    	<a type="button" class="btn btn-success" data-dismiss="modal" id="btn">확인</a>
			    </div>
		   	</div>
	    
  		</div>
	</div>
</section>


<jsp:include page="/WEB-INF/views/layout/footer.jsp" />