<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
	var uno = ${sessionScope.loginUser.uno};
	
	$(document).ready(function(){
		subLiveList(uno);
	});
	
	function subLiveList(uno){
		$.ajax({
			url		:	"/subLive.sub",
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
							var nickName	= rowData.nickName;
							var title		= rowData.btTitle;
							var startTime	= rowData.btStartTime;
							
							htmlCode += '<li>';
							htmlCode += '<span class="tit" title="' + title +'"></span>';
							htmlCode += '<span class="bj">';
							htmlCode += "<a href='goChannel.ch?uNo=" + chNo + "' target='_blank'>" + nickName + "</a>";
							htmlCode += '</span>';
							htmlCode += '<span class="date">' + startTime + "</span>";
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

<section id="live" class="container">
	<div class="bor">
		<div class="tit_area">
			<h4>
				Live <img src="http://www.afreecatv.com/images/aftv_search/ico_live.gif" alt="live">
			</h4>
		</div>

		<div class="recommend">
			<ul id="recomm_broading" class="vod_w">
				<!-- <li>
					<a href="javascript:playBroad('lshooooo', 'flash');">
						<img src="//liveimg.afreecatv.com/211151092.jpg"
							onerror="this.src='http://www.afreecatv.com/images/aftv_search/non.jpg'"
							title="[생]이상호 트위치대전 아프리카팀 ..">
						<span class="tit" title="[생]이상호 트위치대전 아프리카팀 ..">[생]이상호 트위치대전 아프리카팀 ..</span>
					</a> 
					<span class="bj">
						<a href="http://afreecatv.com/lshooooo" target="_blank">BJ이상호</a>
					</span>
					<span class="date">2019-02-05 17:03</span>
				</li> -->
			</ul>
		</div>
	</div>
</section>