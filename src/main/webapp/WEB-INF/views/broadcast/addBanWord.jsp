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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
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
						placeholder="금지할 단어를 입력하세요"> <a class="ui tag label">
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
						placeholder="대체어를 입력하세요"> <a class="ui tag label">
						Revise word</a>
				</div>
			</div>
		</div>
		<div class="ui grid">
			<div class="sixteen wide column" id="searchBanWord">
				<h3>금지단어 검색</h3>
				<div class="menu">
					<div class="item">
						<div class="ui icon input" id="searchDiv">
							<input type="text" placeholder="Search..."> <i
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
						<th>금칙어</th>
						<th>지정일</th>
					</tr>
				</thead>
				<tbody>
					<tr align="center">
						<td data-label="Name">비워두면</td>
						<td data-label="Age">이상해서</td>					
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
<script type="text/javascript">
	//로그인 안하고 접속시 창을 닫아버리게 조취하셈
	$(function(){
		if(${empty loginUser}){
			window.self.close(); //팝업 창을 닫는다
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
					console.log(data);
				},
				error : function(data) {
					console.log("실패")
				}
			});
		})

</script>
</html>