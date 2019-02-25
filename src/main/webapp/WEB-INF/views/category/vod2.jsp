<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<link rel="stylesheet" href="/resources/css/sidebar/simple-sidebar.css">
<link href="/resources/css/sidebar/bootstrap.css" rel="stylesheet">

<link rel="stylesheet" href="/resources/css/recommend.css">

<style type="text/css">
	#menu-toggle{
		position:relative;
		width: 15px;
		background: #f8f9fa!important;
		cursor: pointer;
	}
	#menu-toggle i{
		position:absolute;
		top:50%;
		font-size: 25px;
	}
	.list-group a{
	    border: none;
	}
	.list-group hr{
	   	width: 100%;
	}
</style>

<!-- Menu Toggle Script -->
<script type="text/javascript">
	$(function(){
		$("#menu-toggle").on("click", function(e) {
		    e.preventDefault();
		    
		    console.log("hi")
		    $("#wrapper").toggleClass("toggled");
		});	
	})
</script>

<script type="text/javascript">
	var cNo = 5;
	
	$(document).ready(function(){
		fn_categVodList('count');
	});
	
	function fn_categVodList(type){
		
		url = "";
		
		if(type === "count") 	{url = "/category/" + type + "Vod.ca"}
		if(type === "latest") 	{url = "/category/" + type + "Vod.ca"}
		
		console.log(cNo);
		
		$.ajax({
			url		:	url,
			type	:	"post",
			data	:	{
							cNo	: cNo
						},
			success	:	function(data) {
				
						console.log(data);
						
						var htmlCode = "";
						for(var i = 0; i <data.length; i++){
							var rowData = data[i];
							
							var uNo			= rowData.uNo;
							var nickName	= rowData.nickName;
							var chNo 		= rowData.chNo;
							var bNo			= rowData.bNo;
							var atName 		= rowData.atModifyName;
							var title		= rowData.bTitle;
							var date		= rowData.bWriteDate;
							
							htmlCode += '<li>';
							htmlCode += '<a href="/vod_oneList.ch?bNo='+ bNo +'&&CuNo='+ uNo +'">';
							htmlCode += '<video style="height: 150px; width: 150px;"src="${ contextPath }/resources/uploadFiles/' + atName + '.mp4" type="video/mp4"></video>';
							htmlCode += '<span class="tit">'+ title +'</span>';
							htmlCode += "</a>";
							htmlCode += '<span class="bj">';
							htmlCode += "<a href='/goChannel.ch?uNo=" + chNo + "' target='_blank'>" + nickName + "</a>";
							htmlCode += '</span>';
							htmlCode += '<span class="date">' + date + "</span>";
							htmlCode += '</li>';
						}
						$("#recomm_broading").html(htmlCode);
			},
			error	:	function(){
				alert("실패");
			}
		});
	};
	
</script>

<section>
	<div class="d-flex" id="wrapper">
		<%-- <jsp:include page="/WEB-INF/views/category/layout/sidebar.jsp" /> --%>
		
		<!-- Sidebar -->
		<div class=" border-right" id="sidebar-wrapper">
			<div class="sidebar-heading">VOD</div>
			<div class="list-group list-group-flush">
				<a href="#" class="list-group-item list-group-item-action ">스포츠</a>
				<a href="#" class="list-group-item list-group-item-action ">먹방</a>
				<a href="#" class="list-group-item list-group-item-action ">뷰티</a>
				<a href="#" class="list-group-item list-group-item-action ">VLOG</a>
				<hr>
				<a href="#" class="list-group-item list-group-item-action ">기타</a>
			</div>
		</div>
		
		<div id="menu-toggle">
			<i class="fas fa-caret-right"></i>
		</div>
		
	    <div id="page-content-wrapper">
			<div class="container-fluid">
			
				<div class="toggle-btn">
					<button type="button" class="btn btn-outline-warning" onclick="fn_categVodList('count');">조회순</button>
					<button type="button" class="btn btn-outline-info" onclick="fn_categVodList('latest');">최신순</button>
				</div>
				
				<!-- vod 리스트 -->
				<div class="recommend">
					<ul id="recomm_broading" class="vod_w">
					</ul>
				</div>
				
			</div>
	    </div>
	</div>
</section>

<script src="/resources/js/sidebar/bootstrap.bundle.min.js"></script>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />