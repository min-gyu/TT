<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style>
	p { margin:20px 0px; }
</style> 
</head>

<body>
	<div class="container" align="center">
		<div class="row">
			<div class="col">
				<p><strong id="p1">정지일수</strong></p>
				<div class="custom-control custom-radio">
					<input type="radio" name="radio" id="jb-radio-1" class="custom-control-input" value="3">
					<label id="1" class="custom-control-label" for="jb-radio-1">&nbsp;&nbsp;3일</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" name="radio" id="jb-radio-2" class="custom-control-input" value="7">
					<label id="2" class="custom-control-label" for="jb-radio-2">&nbsp;&nbsp;7일</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" name="radio" id="jb-radio-3" class="custom-control-input" value="15">
					<label id="3" class="custom-control-label" for="jb-radio-3">15일</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" name="radio" id="jb-radio-4" class="custom-control-input" value="30">
					<label id="4" class="custom-control-label" for="jb-radio-4">30일</label>
				</div>
				<br>
				<button type="submit" class="btn btn-outline-primary" onclick="submit();">정지</button>
				<button type="reset" class="btn btn-outline-danger" onclick="cl();">취소</button>
			</div>
		</div>
	</div>
<script>
	$(function(){
		console.log("${userId}");
	});
	
	function submit(){
	    var select = $('input[name="radio"]:checked').val();
	    opener.window.location = "/banMember.ad?select="+select+"&userId="+"${userId}";
	    close();
		<%-- if(<%=money%> >= select){
			 var theURL = "<%=request.getContextPath()%>/ExchangeInsertServlet?uno=<%=num%>&radio="+select; // 전송 URL
			 opener.window.location = theURL;
			 close();
		} --%>
	} 
	
	function cl(){
		 window.close();
	}
	
	
	
</script>
		
</body>
</html>


