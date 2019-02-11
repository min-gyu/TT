<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<br><br>

<style>
	.clover{
		width:30px;
		height:300px;
	}
</style>		
	<section class="post-content-area single-post-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post row">
					<div class="ui tabular menu">
					  <a href="chargeClover.me" class="active item" >클로버 충전</a>
					  <a href="chargeClover2.me" class="item" >클로버 충전 내역</a>
					  <a href="presentClover.me" class="item">클로버 선물한 내역</a>
					  <a href="presentClover2.me" class="item">클로버 선물받은 내역</a>
					</div>
						
						<h4><img src="/resources/images/clover/clover.jpg" width="30px" height="30px">선물 가능한 클로버 : 1개</h4><br>
						

						<!-- 클로버 10개 -->
						<div class="col-lg-9 col-md-9">
							<div class="row">
								<article class="col-md-12 article-list">
									<div class="inner">
										<figure>
											<img src="/resources/images/clover/10.JPG" width="100px" height="200px">
										</figure>
										<div class="details" id = "clovar01"
											style="width: 410px; border-bottom: 1px solid #eee;">
											
											<h2>클로버 ${ listName.cloverCnt }개	</h2>
											<h1>${ listName.cloverMoney }원</h1>
										
											
											<a class="btn btn-primary more" id="clover10" href = "chargeEx.me?cno=1">
											<!-- <input type = "hidden" id = "cno" value = "1"> -->
												<div >충전하기</div>
												<div>
													<i class="ion-ios-arrow-thin-right"></i>
												</div>
											</a>
										</div>
									</div>
									<script>
										$("#clover10").click(function(){
											var cno = $(this).find("input").val(); //id 가 cnt인 input의 value값을 받는다.
											console.log(cno);
											location.href="chargeEx.me?cno="+cno; // 회원번호 추가하기
										});
									</script>
								</article>
								</div>
							</div>
							
							
						<!-- 클로버 30개 -->
						<div class="col-lg-9 col-md-9">
							<div class="row">
								<article class="col-md-12 article-list">
									<div class="inner">
										<figure>
											<img src="/resources/images/clover/30.JPG" width="100px" height="200px">
										</figure>
										<div class="details" id = "clovar02"
											style="width: 410px; border-bottom: 1px solid #eee;">
											
											<h2>클로버 30개	</h2>
											<h1>3,300원</h1>
											<a class="btn btn-primary more" href="#">
												<div>충전하기</div>
												<div>
													<i class="ion-ios-arrow-thin-right"></i>
												</div>
											</a>
										</div>
									</div>
								</article>
								</div>
							</div>
						
						<!-- 클로버 50개 -->
						<div class="col-lg-9 col-md-9">
							<div class="row">
								<article class="col-md-12 article-list">
									<div class="inner">
										<figure>
											<img src="/resources/images/clover/50.JPG" width="100px" height="200px">
										</figure>
										<div class="details"
											style="width: 410px; border-bottom: 1px solid #eee;">
											
											<h2>클로버 50개	</h2>
											<h1>5,500원</h1>
											<a class="btn btn-primary more" href="#">
												<div>충전하기</div>
												<div>
													<i class="ion-ios-arrow-thin-right"></i>
												</div>
											</a>
										</div>
									</div>
								</article>
								</div>
							</div>
							
							<!-- 클로버 100개 -->
						<div class="col-lg-9 col-md-9">
							<div class="row">
								<article class="col-md-12 article-list">
									<div class="inner">
										<figure>
											<img src="/resources/images/clover/100.JPG" width="100px" height="200px">
										</figure>
										<div class="details"
											style="width: 410px; border-bottom: 1px solid #eee;">
											
											<h2>클로버 100개	</h2>
											<h1>11,000원</h1>
											<a class="btn btn-primary more" href="#">
												<div>충전하기</div>
												<div>
													<i class="ion-ios-arrow-thin-right"></i>
												</div>
											</a>
										</div>
									</div>
								</article>
								</div>
							</div>
							
							<!-- 클로버 300개 -->
						<div class="col-lg-9 col-md-9">
							<div class="row">
								<article class="col-md-12 article-list">
									<div class="inner">
										<figure>
											<img src="/resources/images/clover/300.JPG" width="100px" height="200px">
										</figure>
										<div class="details"
											style="width: 410px; border-bottom: 1px solid #eee;">
											
											<h2>클로버 300개	</h2>
											<h1>33,000원</h1>
											<a class="btn btn-primary more" href="#">
												<div>충전하기</div>
												<div>
													<i class="ion-ios-arrow-thin-right"></i>
												</div>
											</a>
										</div>
									</div>
								</article>
								</div>
							</div>
							
							
							<!-- 클로버 500개 -->
						<div class="col-lg-9 col-md-9">
							<div class="row">
								<article class="col-md-12 article-list">
									<div class="inner">
										<figure>
											<img src="/resources/images/clover/500.JPG" width="100px" height="200px">
										</figure>
										<div class="details"
											style="width: 410px; border-bottom: 1px solid #eee;">
											
											<h2>클로버 500개	</h2>
											<h1>55,000원</h1>
											<a class="btn btn-primary more" href="#">
												<div>충전하기</div>
												<div>
													<i class="ion-ios-arrow-thin-right"></i>
												</div>
											</a>
										</div>
									</div>
								</article>
								</div>
							</div>
							
					</div>
				</div>
			</div>
		</div>	
	</section>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />