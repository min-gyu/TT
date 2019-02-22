<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/layout/admin/ad_header.jsp" />

<style type="text/css">
	#listArea th {
		text-align: center;
	}
	#listArea {
		width: 30%
	}
</style>

<script type="text/javascript">
	$(function(){
		$("#listArea td").mouseenter(function() {
			$(this).parent().css({"background" : "#F2F2F2", "cursor" : "pointer"});
		}).mouseout(function() {
			$(this).parent().css({"background" : "white"})
		}).click(function(e) { 
			var num = $(this).parent().children().eq(0).text();
			//var name = $(this).parent().children().eq(1).text();
			
			detailCategory(num);
			$("#myModal").modal();
			//$("categNo").val(num);
			//$("categName").val(name); 
		});
	});
	
	 
	function detailCategory(num) {
		console.log("hi")
		var header = "";
			header += "<tr>";
			header += "<th>번호</th> ";
			header += "<th>세부 분류</th>  ";
			header += "</tr>";
			
		 $.ajax({
				url :  "/detailCateg.ad",	
				type : "post",	
				data : {
							num : num 
						},
						
				success : function(data){	// 성공시 
					console.log(data);
					
					var htmlCode="";
					for(var i = 0; i < data.length; i++) {
						var rowData = data[i];
						
						var no 		= rowData.ctNo;
						var name 	= rowData.ctName;
						
						htmlCode += "<tr>                              ";
						htmlCode += "	<td>" + no + "</td>          	";
						htmlCode += "	<td>" + name + "    </td>	   	";
						htmlCode += "</tr>                              ";
					}
					$("#detailCateg").html(header + htmlCode);
				
					 console.log("성공!");
				},
				error : function(){
					console.log("실패!");
				}
			});
	}
</script>


<section class="home">
	<div class="container">
		<div class="row" >
			<h2 align="center" style="color:green;">카테고리 관리</h2>
			<div class="line"></div>
			
			<div class="center-block">
				<table class="table" id= "listArea" align="center">
					<tr id="listHeader">
						<th>번호</th>
						<th>분류</th>
						<!-- <th></th> -->
					</tr>
					
					<c:forEach var="c" items="${cList}">
					<tr>
						<td>${ c.ctNo }</td>
						<td>${ c.ctName }</td>
					</tr>
					</c:forEach>
				</table>
				
				<div class="line"></div>
				
					
				
				<div class="box-wrapper">				
					<div class="box box-border">
						<div class="box-body">
						
							<form id="myForm" method="post" class="form-horizontal">
								<div class="form-group">
									<label>카테고리 번호</label>
									<input type="text" id="categNo" name="" class="form-control">
								</div>
								
								<div class="form-group">
									<label>카테고리 명</label>
									<input type="text" id="categName" name="" class="form-control">
								</div>
								
								<div class="form-group">
									<label class="fw">활성화 여부</label>
									<div>
										<select class="form-control" name="gender">
											<option value="">활성화</option>
											<option value="">비활성화</option>
										</select>
									</div>
								</div>
								
								<button type="submit" class="btn btn-success btn-block" id="submitBtn">설정</button>
								
							</form>
							
						</div>
					</div>
				</div>
			
			
		</div>
	</div>
</section>

<section>
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog" style="margin-top: 200px;">
		<div class="modal-dialog">
	  
			<!-- Modal content-->
			<div class="modal-content">
			    
			    <div class="modal-header">
				    <button type="button" class="close" data-dismiss="modal">&times;</button>
				    <h4 class="modal-title">세부 카테고리</h4>
			    </div>
				      
			    <div class="modal-body">
			   		<table class="table" id="detailCateg">
						<!-- <tr id="listHeader">
							<th>번호</th>
							<th>세부분류</th>
						</tr> -->
			   		</table>
			    </div>
				      
			    <div class="modal-footer">
			    	<button type="button" class="btn btn-success" data-dismiss="modal">닫기</button>
			    </div>
		   	</div>
	    
  		</div>
	</div>
</section>
		
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />