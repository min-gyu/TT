<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
	$(document).ready(function(){
		mainRankList();
	});
	
	function mainRankList(){
		$.ajax({
			url		:	"/mainVodList.me",
			type	:	"post",
			data	:	{ },
			success	:	function(data) {
							console.log(data);
							
							var htmlCode = "";
							for(var i = 0; i <data.length; i++){
								var rowData = data[i];
								
								var uNo			= rowData.uNo;
								var nickName	= rowData.nickName;
								var chNo 		= rowData.chNo;
								var categ 		= rowData.ctName;
								var bNo 		= rowData.bNo;
								var title 		= rowData.bTitle;
								var content 	= rowData.bContent;
								var date		= rowData.bWriteDate;
								var count		= rowData.bCount;
								var atName		= rowData.atModifyName;
								
								htmlCode += '<article class="col-md-12 article-list">';
								htmlCode += '<div class="inner">';
								htmlCode += '<figure>';
								htmlCode += '<a href="/vod_oneList.ch?bNo='+ bNo +'&&CuNo='+ uNo +'">';
								htmlCode += '<video style="width: 100%;"src="${ contextPath }/resources/uploadFiles/' + atName + '.mp4" type="video/mp4"></video>';
								htmlCode += '</a>';
								htmlCode += '</figure>';
								htmlCode += '<div class="details">';
								htmlCode += '<div class="detail">';
								htmlCode += '<div class="category">';
								htmlCode += '<a href="#">'+ categ +'</a>';
								htmlCode += '</div>';
								htmlCode += '<div class="time">'+ date +'</div>';
								htmlCode += '</div>';
								htmlCode += '<div>';
								htmlCode += '<div class="creater"><a href="/goChannel.ch?uNo=' + chNo + '" target="_blank">'+ nickName +'</a></div>';
								htmlCode += '<h1>'+ title +'</a></h1>';
								htmlCode += '</div>';
								htmlCode += '<p>'+ content +'</p>';
								htmlCode += '<footer>';
								htmlCode += '<div class="love"><i class="fas fa-bullseye"></i><div>'+ count +'</div></div>';
								htmlCode += '<a href="/vod_oneList.ch?bNo='+ bNo +'&&CuNo='+ uNo +'">';
								htmlCode += '<button type="button" class="btn btn-primary more">More</button>';
								htmlCode += '</a>'
								htmlCode += '</footer>';
								htmlCode += '</div>';
								htmlCode += '</div>';
								htmlCode += '</article>';
							}
							$("#vod_rank").html(htmlCode);
						},
			error	:	function(){
							console.log("vod 불러오기 실패");
						}
		});
		
		$.ajax({
			url		:	"/mainLiveList.me",
			type	:	"post",
			data	:	{ },
			success	:	function(data) {
							console.log(data);
							var htmlCode = "";
							for (var i = 0; i <data.length; i++){
								var rowData = data[i];
								
								var uNo			= rowData.uNo;
								var nickName	= rowData.nickName;
								var chNo		= rowData.chNo;
								var btNo		= rowData.btNo;
								var url			= rowData.btUrl;
								var title		= rowData.btTitle;
								var startTime	= rowData.btStartTime;
								var categ		= rowData.ctName;
								
								htmlCode += '<input type="hidden" id="uNo" value="'+ ${sessionScope.loginUser.uno} +'">';
								htmlCode += '<input type="hidden" id="chNo" value="'+ chNo +'">';
								htmlCode += '<input type="hidden" id="nickName" value="'+ nickName +'">';
								htmlCode += '<div class="col-md-6 col-sm-6 col-xs-12" style="margin-left: 25%">';
								htmlCode += '<div class="row">';
								htmlCode += '<article class="article col-md-12">';
								htmlCode += '<div class="inner">';
								htmlCode += '<figure>';
								htmlCode += '<a href="/goBroadCast.bc?owner='+ nickName +'" target="_blank">';
								htmlCode += '<img src="/resources/images/ttLive.png" alt="Sample Article" style="width: 250px; margin-right: 83px; height: 250px;"></a>';
								htmlCode += '</figure>';
								htmlCode += '<div class="padding">';
								htmlCode += '<div class="detail">';
								htmlCode += '<div class="time">'+ startTime +'~</div>';
								htmlCode += '<div class="category"><a href="#">'+ categ +'</a></div>';
								htmlCode += '</div>';
								htmlCode += '<div class="creater"><a href="/goChannel.ch?uNo=' + chNo + '" target="_blank">'+ nickName +'</a></div>';
								htmlCode += '<h2><a href="/goBroadCast.bc?owner='+ nickName +'" target="_blank">'+ title +'</a></h2>';
								htmlCode += '<footer>';
								//htmlCode += '<a href="/goBroadCast.bc?owner='+ nickName +'" target="_blank">';
								htmlCode += '<button type="button" class="btn btn-primary more" onclick="goUser01();">More</button>';
								//htmlCode += '</a>';
								htmlCode += '</footer>';
								htmlCode += '</div>';
								htmlCode += '</div>';
								htmlCode += '</article>';
								htmlCode += '</div>';
								htmlCode += '</div>';
								
							}
							$("#live_rank").html(htmlCode);
						},
			error	:	function(){
							alert("생방송 조회 실패");
						}
		});
		
	};
	
	function goUser01(){
		location.href="/goBroadCast.bc?owner=user01";
	}
	
	function blackCheck(){
		var uNo = $("#uNo").val();
		var chNo = $("#chNo").val();
		var nickName = $("#nickName").val();
		
		console.log(uNo);
		console.log(chNo);
		
		
		var url  = "/blackBlock.me"
		  , data = {
				     params : {
				    	 			uNo 	:  uNo,
				    	 			chNo 	:  chNo
								}
				};
		
		var afterFn = function(resultData, status, headers, config){
				        	var ret_code 	= resultData.ret_code;
				        	var ret_message = resultData.ret_message;
				        	console.log(resultData);
				        	switch (ret_code) {
								case "E":
									alert(ret_message);
									location.href="/goBroadCast.bc?owner=" + nickName;
								break;
								
								case "S":
									alert(ret_message);
								break;
							}
				       };
       
		fn_callAjax(url, data, afterFn);
		
	}
	
	
</script>


<section class="home">
	<div class="container">
		<div class="row" >
			<div class="center-block">
			
				<!-- <div class="line">
					<div>인기 방송</div>
				</div>
				
				<div class="row" id="best_live">
					<div class="col-md-6 col-sm-6 col-xs-12" style="margin-left: 25%">
						<div class="row">
							<article class="article col-md-12">
								<div class="inner">
									<figure>
										<a href="#">
											<img src="/resources/images/mainBest.gif" alt="Sample Article" style="width: 350px; margin-right: 83px;">
										</a>
									</figure>
									<div class="padding">
										<div class="detail">
											<div class="time">February 28, 2019</div>
											<div class="category"><a href="#">스포츠</a></div>
										</div>
											<div class="creater"><a href="#">유저01</a></div>
										<h2><a href="#">[생]T.T 중간발표</a></h2>
										<footer>
											<a href="#" class="love"><i class="fas fa-bullseye"></i> <div>1263</div></a>
											<button type="button" class="btn btn-primary more" onclick="goUser01();">More</button>
										</footer>
									</div>
								</div>
							</article>
						</div>
					</div>
				</div> -->
				
				<!-- 생방송 -->
				<div class="line top">
					<div>생방송</div>
				</div>
				
				<div class="row" id="live_rank"></div>
				
				<!-- VOD -->		
				<div class="line top">
					<div>VOD</div>
				</div>
				
				<div class="row" id="vod_rank"></div>
				
			</div>
		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />