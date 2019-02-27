<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
	$(document).ready(function(){
		mainVodList();
	});
	
	function mainVodList(){
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
		})
	};
	
	function goUser01(){
		location.href="/goBroadCast.bc?owner=user01";
	}
</script>


<section class="home">
	<div class="container">
		<div class="row" >
			<div class="center-block">
			
				<div class="line">
					<div>인기 방송</div>
				</div>
				
				<div class="row" style="text-align: center">
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
				</div>
				
				<!-- LIVE 2, 3 -->
				<div class="line top">
					<div>생방송</div>
				</div>
				
				<div class="row">
					<!-- <article class="col-md-12 article-list">
						<div class="inner">
							<figure>
								<a href="#">
									<img src="/resources/images/news/img11.jpg" alt="Sample Article">
								</a>
							</figure>
							<div class="details">
								<div class="detail">
									<div class="category">
										<a href="#">게임</a>
									</div>
									<div class="time">December 19, 2016</div>
								</div>
								<div>
								<div class="creater"><a href="#">닉네임</div>
									<h1>타이틀</a></h1>
								</div>
								<p>내용</p>
								<footer>
									<a href="#" class="love"><i class="ion-android-favorite-outline"></i> <div>273</div></a>
									<a class="btn btn-primary more" href="#">
										<div>More</div>
										<div><i class="ion-ios-arrow-thin-right"></i></div>
									</a>
								</footer>
							</div>
						</div>
					</article> -->
				</div>

				<!-- VOD -->		
				<div class="line top">
					<div>VOD</div>
				</div>
				
				<div class="row" id="vod_rank">
				</div>
				
			</div>
		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />