<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
	<form action="#" method="post">
		<!-- hidden 부분 수정 필요 -->
		<input type="hidden" name="userId" id="userId">
		<p style="color:green; margin:1px; margin-top:6px; margin-left:12px;" >쪽지보내기</p>
		<hr color="darkgreen" style="margin-bottom: 10; margin-top: 3px;">
		<div style="margin-left:10px;">
			아이디&nbsp;
			<!-- 아이디 있는지 없는지 유효성 검사 필요 -->
			<input type="text" name="id" size="48" style="font-size:16px; height:30px; width:86%;">
		</div>
		<br>
		<div>
			<textarea name="content" maxlength="5000" placeholder="최대 5,000자 까지 작성 가능합니다." style="resize: none; font-size:16px; width:96%; height:360px; margin-left:10px;"></textarea>
		</div>
		<br>
		<div align="center">
			<input type="submit" class="btn btn-success" value="보내기">&nbsp;
			<input type="button" id="aa" class="btn btn-light" value="취소"> 
		</div>
	</form> 
<script>
	$("#aa").click(
		function() {
			window.close();
		});
</script>
</body>
</html>













