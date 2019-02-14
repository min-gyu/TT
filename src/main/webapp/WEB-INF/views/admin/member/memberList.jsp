<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/layout/admin/treeheader.jsp" />

<section class="home">
	<div class="container">
		<div class="row" >
			<div class="form-inline">
				<h3>회원 정보</h3>
				<input class="form-control mr-sm-2" type="search" placeholder="아이디/닉네임을 입력하세요" aria-label="Search" id="searchName"> 
				<button class="btn btn-success" id="searchBtn">Search</button>
			</div>
			<div class="line"></div>
			
			<div class="center-block">
				<table class="table" id= "listArea">
					<tr id="listHeader">
						<th>No.</th>
						<th>이름</th>
						<th>아이디</th>
						<th>닉네임</th>
						<th>성별</th>
						<th>계좌인증여부</th>
						<th>경고횟수</th>
						<th>정지여부</th>
						<th>탈퇴여부</th>
					</tr>
					
					<c:forEach var="m" items="${mList}">
					<tr>
						<td>${m.uno}</td>
						<td>${m.userName}</td>
						<td>${m.userId}</td>
						<td>${m.nickName}</td>
						<td>${m.gender}</td>
						<td>${m.bank}</td>
						<td>${m.warningNo}</td>
						<td>${m.banStatus}</td>
						<td>${m.status}</td>
					</tr>
					</c:forEach>
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
		
<jsp:include page="/WEB-INF/views/layout/admin/treefooter.jsp" />