<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>금지단어 추가</title>

<!-- alert CDN -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- Semantic UI CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- J-query CDN -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- axios -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
#header {
	margin-top: 30px;
}

#addBanWord {
	margin-top: 70px;
}

#addBanWordInputDiv {
	width: 100%;
}

#searchBanWord {
	margin-top: 70px;
}
#searchDiv{
	float: right;
}
#tableDiv{
	margin-top: 10px;
}
#searchListNum, #deleteBanWordDiv{
	display: inline-block;
	padding: 10.5px;
}
#footer{
	height:200px;
}
</style>

</head>
<body>
	<div class="ui attached stackable menu">
		<div class="ui container">
			<a class="item" href="userList.bc"> <i class="grid layout icon"></i>
				시청자 목록
			</a> <a class="item" href="/addManager.bc"> <i class="home icon"></i>
				매니저 추가
			</a> <a class="item" href="/addBanWord.bc"> <i class="mail icon"></i>
				금지어 추가
			</a> <a class="item" href="broadCastSetting.bc"><i
				class="settings icon"></i>방송 설정</a>
				<div class="right item"><h5>${ loginUser.userId }</h5>님 환영합니다.</div>
		</div>
	</div>
	<div class="ui container">
		<div class="ui large header" id="header">
			<h1>금지단어 추가</h1>
		</div>
		<div class="ui grid">
			<div class="eight wide column" id="addBanWord">
				<h3>금지단어 추가</h3>
				<div class="ui right labeled left icon input"
					id="addBanWordInputDiv">
					<i class="tags icon"></i> <input type="text"
						placeholder="금지할 단어를 입력하세요" id="inputBanWord"> <a class="ui tag label">
						Add Word </a>
				</div>
			</div>
		</div>
		
		<div class="ui grid">
			<div class="eight wide column" id="addBanWord">
				<h3>대체어 설정</h3>
				<div class="ui right labeled left icon input"
					id="addBanWordInputDiv">
					<i class="tags icon"></i> <input type="text"
						placeholder="대체어를 입력하세요" id="replaceWord"> <a class="ui tag label">
						Replace word</a>
				</div>
			</div>
		</div>
		<div class="ui grid">
			<div class="sixteen wide column" id="searchBanWord">
				<div class="two wide column" align="center">
					<button class="ui secondary button" id="saveBtn">저장</button>
				</div>
			</div>
		</div>
		<div class="ui grid">
			<div class="sixteen wide column" id="searchBanWord">
				<h3>금지단어 검색</h3>
				<div id="deleteBanWordDiv">
				<span>선택한 금지어 삭제하기 &nbsp;</span>
				</div>
				<button class="ui secondary button small" id="deleteBtn">삭제</button>
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
						<th>필터번호</th>
						<th>금칙어</th>
						<th>대체어</th>
						<th>지정일</th>
					</tr>
				</thead>
				<tbody id="resultBody">
					<tr align="center">
						<td	colspan="4">검색 버튼을 눌러주세요</td>	
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div id="footer">
	
	</div>
</body>
<script type="text/javascript">
	//로그인 안하고 접속시 창을 닫아버리게 조취하셈
	$(function(){
		if(${empty loginUser}){
			swal({
				  title: "경고",
				  text: "로그인이 필요한 서비스 입니다.",
				  icon: "warning",
				}).then(()=>{
					window.self.close(); //팝업 창을 닫는다
				});			
		}
	})
	//검색 버튼을 누르면 금지단어를 oracle에서 조회해서 출력하는 제이쿼리 ajax
	$("#searchI").click(function(){
			$.ajax({
				url : "/searchBanWord.bc",
				type : "get",
				data: {
				   	owner:"${loginUser.userId}"
				  },
				success : function(data) {
					//조회 결과가 없을때
					$("#searchListNum").empty();
					var $span = $("<span>").text("검색결과 :"+data.length)+" 건";
					$("#searchListNum").append($span);
					if(data.length == 0){
						$("#resultBody").empty();
						var $tr = $("<tr align='center'>");
						var $td = $("<td colspan='3'>").text("설정된 금지어가 없습니다.");
						$tr.append($td);
						$("#resultBody").append($tr);
					//조회결과가 있을때
					}else{
						$("#searchListNum").empty();
						var $span = $("<span>").text("검색결과 : "+data.length+" 건");
						$("#searchListNum").append($span);
						$("#resultBody").empty();
						for(var i = 0; i < data.length; i++){
							var $tr = $("<tr align='center'>").click(function(){
										if($(this).hasClass("active")){
											$(this).removeClass("active");
										}else{
											$(this).addClass("active");
										};
									});
							var $tdFNo = $("<td>").text(data[i].fNo);
							var $tdWord = $("<td>").text(data[i].fBan);
							var $tdRevise = $("<td>").text(data[i].fReplace);
							var $tdDate = $("<td>").text(new Date(data[i].fDate).format('yyyy-MM-dd'));
							$tr.append($tdFNo);
							$tr.append($tdWord);
							$tr.append($tdRevise);
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
		
		//금지어 저장하기
		$("#saveBtn").click(function(){
			//금지어가 비어있을 경우 경고창  출력
			if($("#inputBanWord").val()==""){
				swal({
					  title: "경고",
					  text: "금지어를 입력해주세요.",
					  icon: "warning",
					})
			}else{
				if($("#replaceWord").val()==""){
					swal({
						  title: "경고",
						  text: "대체어를 입력해주세요.",
						  icon: "warning",
						})
				}else{
					$.ajax({
						url : "/inputBanWord.bc",
						type : "post",
						data: {
				   			owner:"${loginUser.userId}",
				   			banWord:$("#inputBanWord").val(),
				   			replaceWord:$("#replaceWord").val()
				  		},	
						success : function(data) {
							if(data==1){
								swal({
							  		title: "성공!",
							 		 text: "금지어를 추가했습니다!",
							 		 icon: "success",
							 		 button: "OK",
									});
							}
						},
						error : function(data) {
							console.log("실패")
						}
					}); 
				}
			}
		});
		$("#deleteBtn").click(function(){
			var fNoArr = new Array();
			var $selectActive = $("#resultBody").children().filter(".active");
			$selectActive.each(function(index, item){
				fNoArr[index] = $(this).children().eq(0).text();
			});
			console.log(fNoArr);
			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				url : "/deleteBanWord.bc",
				type : "post",
				data: {
					fNoArr:fNoArr
		  		},	
				success : function(data) {
					console.log(data);
				},
				error : function(data) {
					console.log("실패")
				}
			}); 
			
		});


</script>
</html>