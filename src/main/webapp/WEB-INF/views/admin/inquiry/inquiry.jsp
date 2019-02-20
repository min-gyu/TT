<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/layout/admin/ad_header.jsp" />

<section class="home">
	<div class="container">
		<div class="row" >
			<div class="form-inline">
				<h3>문의 관리</h3>
			</div>
			<div class="line"></div>
			<div align="right">
				<button style="margin-bottom: 5px;">삭제</button>
			</div>
			
			<div class="center-block">
				<table class="table" id= "listArea"  >
					<tr id="listHeader">
						<th style="text-align: center;">No.</th>
						<th style="text-align: center;">아이디</th>
						<th style="text-align: center;">제목</th>
						<th style="text-align: center;">날짜</th>
						<th style="text-align: center;">답변여부</th>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>mingyu</td>
						<td>문의제목자리</td>
						<td>2019-02-10</td>
						<td>답변대기</td>
					<tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>sil</td>
						<td>문의제목자리2</td>
						<td>2019-02-07</td>
						<td>답변완료</td>
					<tr>
				</table>
			</div>
			
			<div class="center-block">
	            <ul class="pagination mx-auto" style="justify-content: center;">
	                <li class="page-item disabled">
	                    <a class="page-link" href="#" aria-label="Previous">
	                        <span aria-hidden="true">«</span>
	                        <span class="sr-only">Previous</span>
	                    </a>
	                </li>
	                <li class="page-item active">
	                    <a class="page-link" href="#">1</a>
	                </li>
	                <li class="page-item"><a class="page-link" href="#">2</a></li>
	                <li class="page-item"><a class="page-link" href="#">3</a></li>
	                <li class="page-item"><a class="page-link" href="#">4</a></li>
	                <li class="page-item"><a class="page-link" href="#">5</a></li>
	                <li class="page-item">
	                    <a class="page-link" href="#" aria-label="Next">
	                        <span aria-hidden="true">»</span>
	                        <span class="sr-only">Next</span>
	                    </a>
	                </li>
	            </ul>
        	</div>
			
		</div>
	</div>
</section>
		
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />