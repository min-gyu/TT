<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp"  />

<!-- 자바스크립트 선언 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 결제 API -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>



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
					  <a href="presentClover.me?ptUno=${sessionScope.loginUser.uno}" class="item">클로버 선물한 내역</a>
					  <a href="presentClover2.me?ptUno=${sessionScope.loginUser.uno}" class="item">클로버 선물받은 내역</a>
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
											
											<h2>클로버 ${ list.get(0).getCloverCnt() } 개	</h2>
											<h1>${ list.get(0).getCloverMoney() } 원</h1>
										
											<%--a태그 속성 삭제 href = "chargeEx.me?cno=${ list.get(0).getCloverNo()}" --%>
											<a class="btn btn-primary more" 
											onclick="pay(${ list.get(0).getCloverMoney() },${ list.get(0).getCloverCnt() },${ list.get(0).getCloverNo() } );">
												<div >충전하기</div>
												<div>
													<i class="ion-ios-arrow-thin-right"></i>
												</div>
											  </a>
										    </div>
										</div>
									</article>
								 </div>
							 </div>
						
						
						
		<script>
		/* 결제 API */
		function pay(payment, cnt, cno){
			
			/* console.log("결제금액 : "+payment);
			console.log("클로버 개수 : "+cnt);
			console.log("클로버 번호 : "+cno);
			console.log(${ sessionScope.loginUser.uno}); */
			var pUno = ${ sessionScope.loginUser.uno}; //접속중인 유저 회원번호
			
			
			var IMP = window.IMP; // 생략가능
			IMP.init('imp14691996'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			
			IMP.request_pay({
			    pg : 'inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '클로버 '+cnt+'개 결제',
			    amount : 10, //금액 payment
			    buyer_email : '425wlstlf@naver.com',
			    buyer_name : pUno/* ,
			    m_redirect_url : 'https://www.yourdomain.com/payments/complete' */
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			        
			        //결제번호 담기
			        var pay = rsp.apply_num;
			        
			        
			        //결제번호, 클로버번호, 회원번호 
			        /* 회원번호도 넘기기 */
			        location.href="payment.me?pno="+pay+"&pCloverCnt="+cno+"&pUno="+pUno;
			        
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
				    alert(msg);
			    }
			});
		}
	</script>

							
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
											
											<h2>클로버 ${ list.get(1).getCloverCnt() } 개	</h2>
											<h1>${ list.get(1).getCloverMoney() } 원</h1>
											<a class="btn btn-primary more" 
											onclick="pay(${ list.get(1).getCloverMoney() },${ list.get(1).getCloverCnt() },${ list.get(1).getCloverNo() } );">
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
											
											<h2>클로버 ${ list.get(2).getCloverCnt() } 개	</h2>
											<h1>${ list.get(2).getCloverMoney() } 원</h1>
											<a class="btn btn-primary more" 
											onclick="pay(${ list.get(2).getCloverMoney() },${ list.get(2).getCloverCnt()},${ list.get(2).getCloverNo() }  );">
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
											
											<h2>클로버 ${ list.get(3).getCloverCnt() } 개	</h2>
											<h1>${ list.get(3).getCloverMoney() } 원</h1>
											<a class="btn btn-primary more" 
											onclick="pay(${ list.get(3).getCloverMoney() },${ list.get(3).getCloverCnt() },${ list.get(3).getCloverNo() } );">
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
											
											<h2>클로버 ${ list.get(4).getCloverCnt() } 개	</h2>
											<h1>${ list.get(4).getCloverMoney() } 원</h1>
											<a class="btn btn-primary more"
											 onclick="pay(${ list.get(4).getCloverMoney() },${ list.get(4).getCloverCnt() },${ list.get(4).getCloverNo() } );">
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
											
											<h2>클로버 ${ list.get(5).getCloverCnt() } 개	</h2>
											<h1>${ list.get(5).getCloverMoney() } 원</h1>
											<a class="btn btn-primary more"
											 onclick="pay(${ list.get(5).getCloverMoney() },${ list.get(5).getCloverCnt() },${ list.get(5).getCloverNo() } );">
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