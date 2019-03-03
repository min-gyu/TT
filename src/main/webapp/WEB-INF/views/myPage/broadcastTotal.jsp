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
			<h2>My신고</h2>
			
			<div>
			<h4>방송통계</h4>
				
		       <div id="chart_div"></div>
		    <br/>
		    <div id="btn-group">
		      <button class="button button-blue" id="none">No Format</button>
		      <button class="button button-blue" id="scientific">Scientific Notation</button>
		      <button class="button button-blue" id="decimal">Decimal</button>
		      <button class="button button-blue" id="short">Short</button>
		    </div>
		    <script>
		      google.charts.load('current', {'packages':['bar']});
		      google.charts.setOnLoadCallback(drawChart);

		      function drawChart() {
		        var data = google.visualization.arrayToDataTable([
		          ['Year', 'Sales', 'Expenses', 'Profit'],
		          ['2014', 1000, 400, 200],
		          ['2015', 1170, 460, 250],
		          ['2016', 660, 1120, 300],
		          ['2017', 1030, 540, 350]
		        ]);

		        var options = {
		          chart: {
		            title: 'Company Performance',
		            subtitle: 'Sales, Expenses, and Profit: 2014-2017',
		          },
		          bars: 'vertical',
		          vAxis: {format: 'decimal'},
		          height: 400,
		          colors: ['#1b9e77', '#d95f02', '#7570b3']
		        };

		        var chart = new google.charts.Bar(document.getElementById('chart_div'));

		        chart.draw(data, google.charts.Bar.convertOptions(options));

		        var btns = document.getElementById('btn-group');

		        btns.onclick = function (e) {

		          if (e.target.tagName === 'BUTTON') {
		            options.vAxis.format = e.target.id === 'none' ? '' : e.target.id;
		            chart.draw(data, google.charts.Bar.convertOptions(options));
		          }
		        }
		      }
		    </script>
   
			
			</div>
			
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post row">
						<br>
						<!-- 방송내역 조회 -->
						<div>
						  <table class="ui green table">
						  <thead>
						    <tr>
						    <th>No.</th>
						    <th>시작시간</th>
						    <th>종료시간</th>
						    <th>시청자 수</th>
						    <tr>
						    
						      <td>1</td>
						      <td>2019/01/08 12:02</td>
						      <td>2019/01/08 13:02</td>
						      <td>133</td>
						    </tr>
						    
						  </tbody>
						</table>
						
						<div align="center">
							 <button class="ui green basic button">1</button>
						</div>
						</div>
						
						
						
					</div>	
				</div>
			</div>
		</div>	
	</section>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />