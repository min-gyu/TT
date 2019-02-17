<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/mainHeader.jsp" />

<script type="text/javascript">
	function goMain(){
		location.href="/goMain.me";
	}
</script>

<section class="home">
	<div class="container">
		<div class="row">
			<div class="center-block">
			<h3>문의/신고가 정상적으로 등록되었습니다</h3>
			<div class="line"></div>
			<p>보내주신 문의/신고를 검토하고 최대한 빠르게 답변해드리겠습니다.</p>
			<p>마이페이지에서 내가 등록한 문의와 신고를 확인할 수 있습니다.</p>
			<br><br>
			<button type="button" class="btn btn-warning" onclick="goMain();">메인으로</button>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />