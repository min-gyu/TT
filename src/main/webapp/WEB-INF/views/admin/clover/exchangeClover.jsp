<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/admin/ad_header.jsp" />
<style>
	{
		font-color:white;
	}
</style>

<section class="home">
	<div class="container">
		<div class="row" >
			<div class="form-inline">
				<h3><image src="/resources/images/clover/clover.jpg" width="50px" height="50px">
				환전 관리</h3>
				<!-- <input class="form-control mr-sm-2" type="search" placeholder="아이디/닉네임을 입력하세요" aria-label="Search" id="searchName"> 
				<button class="btn btn-success" id="searchBtn">Search</button> -->
			</div>
			<div class="line"></div>
			
			<div class="center-block">
				<table class="table" id= "listArea">
					<tr id="listHeader">
						<th>No.</th>
						<th>아이디</th>
						<th>이름</th>
						<th>신청클로버</th>
						<th>실수령액</th>
						<th>은행명</th>
						<th>일시</th>
						<th>상태</th>
					</tr>
					<tr>
						<td>1</td>
						<td>user01</td>
						<td>홍길동</td>
						<td>500</td>
						<td>45,000</td>
						<td>신한은행</td>
						<td>2019/02/06</td>
						<td><input type="button" value="환전수락"></td>
					</tr>
					<tr>
						<td>2</td>
						<td>user02</td>
						<td>고길동</td>
						<td>100</td>
						<td>9,000</td>
						<td>우리은행</td>
						<td>2019/01/17</td>
						<td><input type="button" value="환전완료" style="background-color:red; color:white"></td>
					</tr>
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
