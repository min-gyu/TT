<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div id="content">
		<div class="wrap">
			<video autoplay poster="/resources/images/logo.png"></video>
			<button>getUserMedia()</button>
		</div>
	</div>

</body>
<script>
	$(function() {
		navigator.getUserMedia = navigator.getUserMedia
				|| navigator.webkitGetUserMedia || navigator.mozGetUserMedia;

		/**
		 * getUserMedia 성공
		 * @param stream
		 */
		function success(stream) {
			console.log('success', arguments);

			// 비디오 테그에 stream 바인딩
			$('video')[0].srcObject = stream;

			// do something...
		}

		/**
		 * getUserMedia 실패
		 * @param error
		 */
		function error(error) {
			console.log('error', arguments);

			alert('카메라와 마이크를 허용해주세요');
		}

		/**
		 * 이벤트 바인딩
		 */
		$('button').click(function() {
			navigator.getUserMedia({
				audio : true,
				video : true
			}, success, error);
		});
	});
</script>
</html>