<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/layout/admin/ad_header.jsp" />

<style type="text/css">
	#listArea th {
		text-align: center;
	}
</style>

<section class="home">
	<div class="container">
		<div class="row" >
			<h2 align="center" style="color:green;">카테고리 관리</h2>
			<div class="line"></div>
			
			<div class="center-block">
				<table class="table" id= "listArea">
					<tr id="listHeader">
						<th>대분류</th>
						<th>중분류</th>
						<th>소분류</th>
					</tr>
				</table>
			</div>
			
			
		</div>
	</div>
</section>
		
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />