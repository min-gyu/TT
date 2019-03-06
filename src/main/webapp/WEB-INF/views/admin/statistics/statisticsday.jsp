<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String tabon = "1";
%>
<jsp:include page="/WEB-INF/views/layout/admin/ad_header.jsp" />

<style>
.numb {
	clear: both;
	height: 30px;
}

.numb span {
	display: inline-block;
}

.numb a {
	display: block;
	width: 30px;
	height: 30px;
	line-height: 30px;
}

.num1, .num2 {
	border: 1px solid #dfdfdf;
	text-align: center;
}

.numb .on, .num1:hover, .num2:hover {
	border: 0;
	background: #444;
	border: 1px solid #444;
	color: #fff;
	cursor: pointer;
}
</style>

<head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
     <script type="text/javascript">   
      $(function(){
    	  $.ajax({
				url : "/totalBroadCast.bc",
				type : "get",
				success : function(data) {	
						console.log(data);
				      function drawChart() {
				        var data = google.visualization.arrayToDataTable([
				          ['Year', '누적방송시간', '최고시청자수', '누적시청자수'],
				          ['2017' , data[2017].btTime, data[2017].btCount, data[2017].totalCount],
				          ['2018', 1170, 460, 250],
				          ['2019', 660, 1120, 300],
				        ]);

				        var options = {
				          chart: {
				            title: '방송 통계',
				            subtitle: '평균방송시간, 최고시청자수, 평균 시청자수',
				          }
				        };

				        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

				        chart.draw(data, google.charts.Bar.convertOptions(options));
				      }
				      
				      google.charts.load('current', {'packages':['bar']});
				      google.charts.setOnLoadCallback(drawChart);
				},
				error : function(data) {
					console.log("실패")
				}	
			});
      });
    </script>
  </head>
 <body>
<section class="home">

	<div class="container">
		<div class="row">
			<div class="form-inline">
				<h3>통계</h3>
			</div>
			<div class="line"></div>
			<div align="right"></div>

			<div class="center-block" style="padding-left: 15%">
				<div id="Wrap">
					<!-- Wrap S -->


					<div id="container">
					  <div id="columnchart_material" style="width: 800px; height: 500px;"></div>
					</div>
					
					
					<!--// container E-->
				</div>
			</div>
		</div>
	</div>
</section>
</body>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />