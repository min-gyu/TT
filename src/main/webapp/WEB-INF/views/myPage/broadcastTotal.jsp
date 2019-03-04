<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<!-- 차트api 때문에 선언 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


		
	<section class="post-content-area single-post-area">
		<div class="container">
			<h2>My방송 통계</h2>
			
			<div>
		       <div id="chart_div"></div>
		    <br/>
		   <!--  <div id="btn-group">
		      <button class="button button-blue" id="none">No Format</button>
		      <button class="button button-blue" id="scientific">Scientific Notation</button>
		      <button class="button button-blue" id="decimal">Decimal</button>
		      <button class="button button-blue" id="short">Short</button>
		    </div> -->
		    <script>
		      google.charts.load('current', {'packages':['bar']});
		      google.charts.setOnLoadCallback(drawChart);
		     

		      function drawChart() {
		        var data = google.visualization.arrayToDataTable([
		          ['', '평균방송시간', '최고시청자수', '평균 시청자수'],
		          ['Today', 1200 , 400, 200],
		          ['Total', 1000, 400, 200]
		        ]);

		        var options = {
		          chart: {
		            title: '방송통계',
		            subtitle: '평균방송시간, 최고시청자수, 평균 시청자수',
		          },
		          bars: 'vertical',
		          vAxis: {format: 'decimal'},
		          width : 800,
		          height: 400,
		          colors: ['#1b9e77', '#d95f02', '#7570b3']
		        };

		        var chart = new google.charts.Bar(document.getElementById('chart_div'));

		        chart.draw(data, google.charts.Bar.convertOptions(options));

		        /* var btns = document.getElementById('btn-group');

		        btns.onclick = function (e) {

		          if (e.target.tagName === 'BUTTON') {
		            options.vAxis.format = e.target.id === 'none' ? '' : e.target.id;
		            chart.draw(data, google.charts.Bar.convertOptions(options));
		          }
		        } */
		      }
		    </script>
   
			
			</div>
			
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post row">
						<br>
						<!-- 방송내역 조회 -->
						<h4>- 방송 활동 내역</h4>
						<div>
						  <table class="ui green table">
						  <thead>
						    <tr>
						    <th>No.</th>
						    <th>시작시간</th>
						    <th>종료시간</th>
						    <th>누적시청자 수</th>
						    </tr></thead><tbody>
						    <!-- ** jstl 반복문 ** -->  
							 <c:forEach items="${ bcTotalList }" var="bcTotalList"> 
							   <tr>
							   	  <td>${bcTotalList.rnum }</td>
							      <td>${bcTotalList.btStartDate }</td>
							      <td>${bcTotalList.btEndDate } </td>
							      <td>${bcTotalList.btTotalCount } </td>
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
						<c:url var="listBack" value="/broadcastTotal.me?cqUno=${sessionScope.loginUser.uno}">
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
							<c:url var="listCheck" value="/broadcastTotal.me?cqUno=${sessionScope.loginUser.uno}">
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
						<c:url var="listEnd" value="/broadcastTotal.me?cqUno=${sessionScope.loginUser.uno}">
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