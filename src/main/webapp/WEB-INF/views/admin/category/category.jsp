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
			
			$("#myModal").modal().click(function(e){
			detailCategory(num);
			});
		});
	});
	
	 
	function detailCategory(num) {
		var header = "";
			header += "<tr>";
			header += "<th>번호</th> ";
			header += "<th>분류</th>  ";
			header += "</tr>";
			
		 $.ajax({
				url :  "/detailCateg.ad",	
				type : "post",	
				data : {
							num : num 
						},
						
				success : function(data){	// 성공시 
					/* 
					var htmlCode = "";
					for(var i = 0; i < data.length; i++){
						var rowData = data[i];
						
						var id 		 = rowData["empid"];
						var name 	 = rowData.empName;
						var position = rowData.positionName;
						
						htmlCode += "<tr >                              ";
						htmlCode += "	<td>" + id + "</td>          	";
						htmlCode += "	<td>" + name + "    </td>	   	";
						htmlCode += "	<td>" + position + "  </td>	 	";
						htmlCode += "</tr>                              ";
					}
					$("#detailCateg").html(header + htmlCode);
					  */
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
				
				<div class="">
					<button type="button" class="btn btn-success bt-lg">확인</button>
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
						<tr id="listHeader">
							<th>번호</th>
							<th>세부분류</th>
						</tr>
						
						<c:forEach var="dc" items="${dcList}">
						<tr>
							<%-- <td>${ dc.ctNo }</td> --%>
							<td>??</td>
							<td>${ dc.ctName }</td>
						</tr>
						</c:forEach>
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