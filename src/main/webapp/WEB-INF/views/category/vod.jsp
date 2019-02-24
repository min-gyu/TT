<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<link rel="stylesheet" href="/resources/css/sidebar/simple-sidebar.css">
<link href="/resources/css/sidebar/bootstrap.css" rel="stylesheet">

<script type="text/javascript">
	var cNo = 5;
	
	$(document).ready(function(){
		categVod(cNo);
	});
	
	function categVod(cNo){
		
		console.log(cNo);
		
		$.ajax({
			url		:	"/category/vodList.ca",
			type	:	"post",
			data	:	{
							cNo	: cNo
						},
			success	:	function(data) {
						console.log(data);
						
						/* 
						var htmlCode = "";
						for(var i = 0; i <data.length; i++){
							var rowData = data[i];
							
							var chNo 		= rowData.chNo;
							var atName 		= rowData.atModifyName;
							var nickName	= rowData.nickName;
							var title		= rowData.bTitle;
							var date		= rowData.bWriteDate;
							
							htmlCode += '<li style="width: 30%;">';
							htmlCode += "<a href='goChannel.ch?uNo=" + chNo + "'>";
							htmlCode += '<video style="height: 200px; width: 200px;"src="${ contextPath }/resources/uploadFiles/' + atName + '.mp4" type="video/mp4"></video>';
							htmlCode += '<span class="tit">'+ title +'</span>';
							htmlCode += "</a>";
							htmlCode += '<span class="bj">';
							htmlCode += "<a href='goChannel.ch?uNo=" + chNo + "' target='_blank'>" + nickName + "</a>";
							htmlCode += '</span>';
							htmlCode += '<span class="date">' + date + "</span>";
							htmlCode += '</li>';
						}
						$("#vod_area").html(htmlCode);
						*/
			},
			error	:	function(){
				alert("카테고리 vod 조회 실패");
			}
				
		});
	};
</script>

<section>
	<div class="d-flex" id="wrapper">
		<jsp:include page="/WEB-INF/views/category/layout/sidebar.jsp" />
		
	    <div id="page-content-wrapper">
			<div class="container-fluid">
			
				<div class="btn-group btn-group-toggle" data-toggle="buttons">
					<label class="btn btn-outline-warning active">
						<input type="radio" name="options" id="option1" autocomplete="off" checked> 조회순
					</label>
					<label class="btn btn-outline-warning">
						<input type="radio" name="options" id="option2" autocomplete="off"> 최신순
					</label>
				</div>
				
				<div class="recommend">
					<ul id="vod_area" class="vod_w">
					</ul>
				</div>
				
			</div>
	    </div>
	</div>
</section>

<script src="/resources/js/sidebar/bootstrap.bundle.min.js"></script>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />