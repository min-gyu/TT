<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String tabon = "1";
%>
<jsp:include page="/WEB-INF/views/layout/admin/treeheader.jsp" />

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



<section class="home">
	<div class="container">
		<div class="row">
			<div class="form-inline">
				<h3>통계</h3>
			</div>
			<div class="line"></div>
			<div align="right"></div>

			<div class="center-block">
				<div id="Wrap">
					<!-- Wrap S -->


					<div id="container">
						<!-- container S -->


						<div class="contBox mt30">
							<!-- contBox S -->

							<jsp:include page="/WEB-INF/views/admin/statistics/tab_statistics.jsp" />

						</div>
						<!--// contBox E-->
						<div style="text-align: left;">
							&nbsp&nbsp&nbsp<span style="font-weight: bold">오늘방문수 : </span>&nbsp;&nbsp;&nbsp;&nbsp;
							<span style="font-weight: bold">어제방문수 : </span>&nbsp&nbsp&nbsp&nbsp
							<span style="font-weight: bold">누적방문수 : </span>
						</div>
						<div class="numb pb10" align="left">
							&nbsp&nbsp&nbsp<span><a class="num1"><</a></span>
							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span
								style="font-weight: bold; font-size: 23px;"></span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
							<span><a class="num2" href="#" disable>></a></span>&nbsp&nbsp&nbsp
							
						</div>
					</div>
					<!--// container E-->
				</div>
			</div>
		</div>
	</div>
</section>
<br>
<br>
<br>
<br>
<jsp:include page="/WEB-INF/views/layout/admin/treefooter.jsp" />