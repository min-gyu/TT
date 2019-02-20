<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
	function goMain(){
		location.href="/goMain.me";
	}
</script>

<section class="home">
	<div class="container">
		<div class="row">
			<div class="center-block">
			<br><br>
			<h2>축하합니다!</h2>
			<h3>T.T 회원가입이 완료되었습니다.</h3>
			<div class="line"></div>
			<p>보내주신 문의/신고를 검토하고 최대한 빠르게 답변해드리겠습니다.</p>
			<p>지금부터 회원님은 
			Today's TV에서 제공하는 서비스를 이용하실 수 있습니다.</p>
			<br><br>
			<button type="button" class="btn btn-warning" onclick="goMain();">메인으로</button>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />