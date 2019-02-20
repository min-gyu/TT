<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>채팅금지 추가</title>

<!-- alert CDN -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- Semantic UI CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- J-query CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style type="text/css">
#header {
	margin-top: 30px;
}

#addManager {
	margin-top: 70px;
}

#searchManager {
	margin-top: 70px;
}

#searchDiv {
	float: right;
}

#tableDiv {
	margin-top: 10px;
}

#inputManagerDiv {
	width: 100%;
}
#searchListNum, #deleteBanWordDiv{
	display: inline-block;
	padding: 10.5px;
}
</style>
<!-- jQuery CDN -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- axios -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<!-- sweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<div class="ui attached stackable menu">
			<div class="ui container">
			<a class="item" href="/userList.bc?owner=${param.owner}"> <i class="user icon"></i>시청자 목록</a>
			<c:if test="${ (!empty loginUser) and (loginUser.userId eq param.owner) }">
			<a class="item" href="/addManager.bc?owner=${param.owner}"><i class="user outline icon"></i>매니저 추가</a>
			</c:if> 
			<a class="item" href="/addChatBanUser.bc?owner=${param.owner}"><i class="ban icon"></i>채팅 금지 설정</a>
			<a class="item" href="/addBanWord.bc?owner=${param.owner}"><i class="edit icon"></i>금지어 추가</a> 
			<c:if test="${ (!empty loginUser) and (loginUser.userId eq param.owner) }">
			<a class="item" href="/broadCastSetting.bc?owner=${param.owner}"><i class="settings icon"></i>방송 설정</a>
			</c:if>
			<div class="right item"><h5>${ loginUser.userId }</h5>님 환영합니다.</div>
		</div>
	</div>
	</div>
	<div class="ui container">
		<div class="ui large header" id="header">
			<h1>채팅금지</h1>
		</div>
		<div class="ui grid">
			<div class="sixteen wide column" id="addManager">
				<h3>채팅금지 유저 추가</h3>
				<div class="ui grid">
					<div class="six wide column">
						<div class="ui input" id="inputManagerDiv">
							<input type="text" placeholder="아이디를 입력하세요" id="addChatBanUser">
						</div>
					</div>
					<div class="two wide column">
						<button class="ui secondary button" id="addChatBanUserBtn">추가</button>
					</div>
				</div>
			</div>
		</div>

		<div class="ui grid">
			<div class="sixteen wide column" id="searchManager">
				<h3>채팅금지 유저  검색</h3>
				<div id="deleteBanWordDiv">
				<span>채팅금지 해제 &nbsp;</span>
				</div>
				<button class="ui secondary button small" id="deleteBtn">해제</button>
				<div class="menu">
					<div class="item">
					<div id="searchListNum"><span>검색 버튼을 눌러주세요</span></div>
						<div class="ui icon input" id="searchDiv">
							<input type="text" placeholder="Search..." disabled="disabled"> <i
								class="inverted circular search link icon" id="searchI"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="sixteen wide column" id="tableDiv">
			<table class="ui celled table">
				<thead>
					<tr align="center">
						<th>번호</th>
						<th>아이디</th>
						<th>닉네임</th>
						<th>지정일</th>
					</tr>
				</thead>
				<tbody id="resultBody">
					<tr align="center">
						<td colspan="4">검색 버튼을 눌러주세요</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		//로그인 안했을시 창 종료 추가할 것.
		if(${empty loginUser}){
			swal({
				  title: "경고",
				  text: "로그인이 필요한 서비스 입니다.",
				  icon: "warning",
				}).then(()=>{
					location.href="/goMain.bc";
					window.self.close(); //팝업 창을 닫는다
				});			
		}else{
			if(${loginUser.userId == param.owner}){
				console.log("방송채널 주인인 유저!");
			}else{
				console.log("방송채널 주인이 아닌 유저!");
				$.ajax({
					url : "/selectBSManager.bc",
					type : "get",
					data: {
				   		owner:"${ param.owner }",
				   		uno:"${loginUser.uno}"
				  	},
					success : function(data) {
						switch(data){
						case "매니저" : {console.log("매니저"); break;}
						case "비매니저" : {
							swal({
								  title: "경고",
								  text: "크리에이터 또는 매니저만 이용가능한 서비스 입니다.",
								  icon: "warning",
								}).then(()=>{
									location.href="/goMain.bc";
									window.self.close(); //팝업 창을 닫는다
								});					
							break;}
						}
						
					},
					error : function(data) {
						console.log("실패")
					}	
				});
			}
			
		}
	})
	//채팅금지 유저 추가 버튼을 했을 경우 실행되는 메서드, 공백상태와 등록하려는 유저가 본인인지를 확인하고 나머지는 controller단에서 처리한다(실존여부, 이미 등록했는지 여부)
	$("#addChatBanUserBtn").click(function(){	
	if($("#addChatBanUser").val()==""){
		swal({
		  	title: "경고",
		  	text: "아이디를 입력해주세요",
		  	icon: "warning",
			})
	}else if("${loginUser.userId}"==$("#addChatBanUser").val()){
		swal({
		  	title: "경고",
		  	text: "자기 자신은 채팅금지 유저로 등록할 수 없습니다.",
		  	icon: "warning",
			})
	}else if($("#addChatBanUser").val()=="${ param.owner }"){
		swal({
		  	title: "경고",
		  	text: "해당 채널의 크리에이터는 채팅금지 시킬 수 없습니다.",
		  	icon: "warning",
			})
	}else{
	
		$.ajax({
			url : "/insertChatBanUser.bc",
			type : "post",
			data: {
		   		owner:"${ param.owner }",
		   		addChatBanUser:$("#addChatBanUser").val()
		  	},
			success : function(data) {
				console.log(data);
				switch(data){
				case "존재하지 않는 유저 입니다" : 
					swal({
				  	title: "경고",
				  	text: data,
				  	icon: "warning",
					})
					break;
				case "이미 채팅금지된 회원입니다.":
					swal({
					  	title: "경고",
					  	text: data,
					  	icon: "warning",
						})
						break;
				case "채팅금지 등록 성공!" :
					swal({
			  			title: "성공!",
			 		 	text: data,
			 		 	icon: "success",
			 		 	button: "OK",
						})
					break;
				default : 
					swal({
					  	title: "경고",
					  	text: data,
					  	icon: "warning",
						})
					break;
				}
				$("#searchI").click();
			},
		error : function(data) {
			console.log("실패")
		}
	});
	}
	});
	//검색버튼을 눌렀을때 검색결과를 읽어와서 출력하는 메서드
	$("#searchI").click(function(){
		$.ajax({
			url : "/selectChatBanUser.bc",
			type : "get",
			data: {
		   		owner:"${ param.owner }",
		  	},
			success : function(data) {
				console.log(typeof(data));
				if(jQuery.isEmptyObject( data )){
					$("#searchListNum").empty();
					var $span=$("<span>").text("검색결과 : 0 건");
					$("#searchListNum").append($span);
					$("#resultBody").empty();
					var $tdEmpty = $("<td colspan='4'>").text("검색결과가 없습니다.");
					var $trEmpty = $("<tr align='center'>");
					$trEmpty.append($tdEmpty);
					$("#resultBody").append($trEmpty);				
				}else{
				$("#searchListNum").empty();
				var $span=$("<span>").text("검색결과 : "+data.memberList.length+" 건");
				$("#searchListNum").append($span);
				$("#resultBody").empty();
				for(var i=0; i<data.memberList.length; i++){
					for(var j=0; j<data.relationList.length; j++){
						if(data.memberList[i].uno==data.relationList[j].rTargetUno){
							var $tdDate=$("<td>").text(new Date(data.relationList[j].rDate).format('yyyy-MM-dd'));
							var $tdRNo =$("<td>").text(data.relationList[j].rNo);
						}
					}
					var $tdId = $("<td>").text(data.memberList[i].userId);
					var $tdNickName = $("<td>").text(data.memberList[i].nickName);
					var $tr = $("<tr align='center'>").click(function(){
						if($(this).hasClass("active")){
							$(this).removeClass("active");
						}else{
							$(this).addClass("active");
						};
					});
					$tr.append($tdRNo);
					$tr.append($tdId);
					$tr.append($tdNickName);
					$tr.append($tdDate);
					$("#resultBody").append($tr);
				}
				}
				
			},
		error : function(data) {
			console.log("실패")
		}
	});
	})
	//삭제 버튼을 눌렀을때 채팅금지 유저를 해제하는 메서드
	$("#deleteBtn").click(function(){
		var $selectRNo = $("#resultBody").children().filter(".active");
		var rNoArr = new Array();
		if($selectRNo.length>0){
		$selectRNo.each(function(index, item){
			rNoArr[index] = $(this).children().eq(0).text();
		})
		jQuery.ajaxSettings.traditional = true;
		 $.ajax({
			url : "/deleteChatBanUser.bc",
			type : "post",
			data: {
		   		rNoArr:rNoArr
		  	},
			success : function(data) {
				if(rNoArr.length == data){
					swal({
				  		title: "성공!",
				 		 text: "채팅금지를 해제했습니다.!",
				 		 icon: "success",
				 		 button: "OK",
						}).then(()=>{
							$("#searchI").click();
						});	
				}
				$("#searchI").click();
			},
			error : function(data) {
				console.log("실패")
			}
		}); 
		}else{
			swal({
				  title: "경고",
				  text: "회수할 매니저를 선택해주세요",
				  icon: "warning",
				})
		}
	})
	
	//Date 포멧 변경하는 함수
		Date.prototype.format = function (f) {
			 if (!this.valueOf()) return " ";
				var weekKorName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    			var weekKorShortName = ["일", "월", "화", "수", "목", "금", "토"];
			    var weekEngName = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
			    var weekEngShortName = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
			    var d = this;
		    	return f.replace(/(yyyy|yy|MM|dd|KS|KL|ES|EL|HH|hh|mm|ss|a\/p)/gi, function ($1) {
      	  			switch ($1) {
            		case "yyyy": return d.getFullYear(); // 년 (4자리)
            		case "yy": return (d.getFullYear() % 1000).zf(2); // 년 (2자리)
            		case "MM": return (d.getMonth() + 1).zf(2); // 월 (2자리)
            		case "dd": return d.getDate().zf(2); // 일 (2자리)
            		case "KS": return weekKorShortName[d.getDay()]; // 요일 (짧은 한글)
           			case "KL": return weekKorName[d.getDay()]; // 요일 (긴 한글)
            		case "ES": return weekEngShortName[d.getDay()]; // 요일 (짧은 영어)
            		case "EL": return weekEngName[d.getDay()]; // 요일 (긴 영어)
            		case "HH": return d.getHours().zf(2); // 시간 (24시간 기준, 2자리)
            		case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2); // 시간 (12시간 기준, 2자리)
            		case "mm": return d.getMinutes().zf(2); // 분 (2자리)
            		case "ss": return d.getSeconds().zf(2); // 초 (2자리)
            		case "a/p": return d.getHours() < 12 ? "오전" : "오후"; // 오전/오후 구분
            		default: return $1;
        			}
    			});
		};
		String.prototype.string = function (len) { var s = '', i = 0; while (i++ < len) { s += this; } return s; };
		String.prototype.zf = function (len) { return "0".string(len - this.length) + this; };
		Number.prototype.zf = function (len) { return this.toString().zf(len); };
	
</script>
</html>