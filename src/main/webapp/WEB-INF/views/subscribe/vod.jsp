<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<script type="text/javascript">
	var uno = ${sessionScope.loginUser.uno};
	
	$(document).ready(function(){
		subVodList(uno);
	});
	
	function subVodList(uno){
		$.ajax({
			url		:	"/subVod.sub",
			type	:	"post",
			data	:	{
							uno	: uno
						},
			success	:	function(data) {
						console.log(data);
						
						var htmlCode = "";
						for(var i = 0; i <data.length; i++){
							var rowData = data[i];
							
							var chNo 		= rowData.chNo;
							var atName 		= rowData.atModifyName;
							var nickName	= rowData.nickName;
							var title		= rowData.bTitle;
							var date		= rowData.bWriteDate;
							
							htmlCode += '<li>';
							htmlCode += "<a href='goChannel.ch?uNo=" + chNo + "'>";
							htmlCode += '<video style="height: 200px; width: 220px;"src="${ contextPath }/resources/uploadFiles/' + atName + '.mp4" type="video/mp4"';
							htmlCode += '<span class="tit" title="' + title + '">';
							htmlCode += title + '</span>';
							htmlCode += "</a>";
							htmlCode += '<span class="bj">';
							htmlCode += "<a href='goChannel.ch?uNo=" + chNo + "' target='_blank'>" + nickName + "</a>";
							htmlCode += '</span>';
							htmlCode += '<span class="date">' + date + "</span>";
							htmlCode += '</li>';
						}
						$("#recomm_broading").html(htmlCode);
			},
			error	:	function(){
				alert("vod 조회 실패")
			}
				
		});
	}
</script>

<section id="vod" class="container">
	<div class="bor">
		<div class="tit_area">
			<h4>
				vod
			</h4>
		</div>
		
		<div class="recommend">
			<ul id="recomm_broading" class="vod_w">
			</ul>
		</div>
	</div>
</section>