<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style type="text/css">
.listarea {
    position: relative;
    width: 100%;
}
.listarea ul {
    position: relative;
    margin-right: -16px;
}
.listarea li {
    position: relative;
    z-index: 1;
    float: left;
    padding-right: 16px;
    padding-bottom: 30px;
    list-style: none;
}
.listarea ul:after {
    display: block;
    clear: both;
    content: '';
}
.favor_all .ready_box {
    height: 140px;
    padding: 14px 0 0 0;
}
.favor_all .ready_box a {
    text-decoration: none;
    text-align: center;
}
.ready_box {
    position: relative;
    display: block;
    width: 226px;
    height: 119px;
    border: 1px solid #d8d8d8;
    border-radius: 5px;
    background: #fff;
}

.ready_box a {
    display: block;
    width: 226px;
    height: 119px;
}
.ready_box .cast_delete {
    display: none;
    position: absolute;
    top: 5px;
    right: 5px;
    width: 15px;
    height: 15px;
}
.ready_box .cast_fixing {
    display: none;
    overflow: hidden;
    position: absolute;
    top: 6px;
    left: 7px;
    background: url(/images/afmain/img_main.png) -133px -217px no-repeat;
    width: 18px;
    height: 18px;
}
.listarea li:after {
    display: block;
    clear: both;
    content: '';
}
.ready_box .thumb {
    position: absolute;
    top: 15px;
    left: 26px;
}
.ready_box span {
    line-height: 110%;
}
.favor_all .ready_box a .thumb, .favor_all .ready_box a .nick, .favor_all .ready_box a .afid {
    position: static;
}
.favor_all .ready_box .nick {
    width: auto;
    margin-top: 8px;
    font-size: 15px;
}
.ready_box .nick {
    position: absolute;
    top: 30px;
    left: 110px;
    font-size: 16px;
    color: #333;
    font-weight: bold;
    letter-spacing: -1px;
    display: block;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
    width: 110px;
}
.ready_box .afid {
    position: absolute;
    top: 53px;
    left: 110px;
    color: #555;
}
</style>

<script type="text/javascript">
	var uno = ${sessionScope.loginUser.uno};
	
	$(document).ready(function(){
		subChannelList(uno);
	});
	
	function subChannelList(uno){
		// url		:	"${pageContext.request.contextPath}/subChannel.sub"
		
		$.ajax({
			url		:	"/subChannel.sub",
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
					var id 			= rowData.mId;
					var nickName	= rowData.nickName;
					var atName 		= rowData.atModifyName;
					
					htmlCode += '<li>';
					htmlCode += '<div class="ready_box">';
					htmlCode += "<a href='goChannel.ch?uNo=" + chNo + "'>";
					htmlCode += '<span class="thumb">';
					htmlCode += '<img src="${ contextPath }/resources/uploadFiles/profile/' + atName + '.jpg" width="65" height="65" title="">';
					htmlCode += '</span>';
					htmlCode += '<span class="nick">' + nickName + '</span>';
					htmlCode += '<span class="afid">' + id + '</span>';
					htmlCode += '</a>';
					htmlCode += '</div>';
					htmlCode += '</li>';
				}
				$("#channel_area").html(htmlCode);
			},
			error	:	function(){
				alert("channel 조회 실패")
			}
				
		});
	}
</script>

<section id="channel" class="container">
	<div class="bor">
		<div class="tit_area">
			<h4>channel</h4>
		</div>
		<div class="listarea favor_all">
			<ul id="channel_area">
				<!-- 
				<li>
					<div class="ready_box">
						<a href="http://www.afreecatv.com/seokwngud" target="_blank">
							<span class="nick" user_id="seokwngud">뜨뜨뜨뜨-</span>
							<span class="afid">seokwngud</span>
						</a>
					</div>
				</li>
				 -->
			</ul>
		</div>
	</div>
</section>