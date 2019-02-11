<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
 body {
 	font-family: Arial, sans-sefif;
 	background-image: url('../images/background-2424150_1920.jpg');
	text-align: center;
	font-size: 16px;
}
.navbar{
	background-color: #889999;
	width: 640px;
	margin: 0 auto;
	height: 35px;
	line-height: 35px;
}

h1 {
	font-size: 23px;
	color: #fff;
	text-align: center;
}
/*캔버스를 감춤 */
#canvas {
	display: none;
}
label {
	margin-right: 5px;
}
label:hover{
	cursor: pointer;
}
form{
	width: 640px;
	margin-bottom: 20px;
}
.top-container{
	width: 640px;
	margin: 0 auto;
	text-align: center;
	padding: 0;
	background-color: #fff;
	border-radius: 6px;
}
.bottom-container{
	margin-top: 20px;
	width: 640px;
	margin: 0 auto;
	text-align: center;
	padding: 0;
}
#photos{
	width: 640px;
	marign: 0 auto;
}
.btn{
	width: 150px;
	height: 40px;
	border-radius: 8px;
	border: 1px solid #778899;
	background-color: #337799;
	color:white;
	margin-bottom: 20px;
}
.btn:hover{
	background-color: #990000;
}
fieldset{
	border: 1px solid #999999;
	border-radius: 7px;
	background-color: #fff;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<!-- 제목 -->
	<div class="navbar">
		<h1 class="title">WebRTC Color Filters Demo</h1>
	</div>
	<dir class="top-container">
		<video id="video">Stream not available...</video>
		<!-- select filter / CSS filters-->	
		<form>
	        <!-- <fieldset id="photo-filter">
	            <legend>Color filter</legend>
	            
	            <input type="radio" name="filter" id="normal" value="none" checked="checked">
	            <label for="normal">Normal</label>
	           	<input type="radio" name="filter" id="grayscale" value="grayscale(100%)">
	           	<label for="grayscale">Grayscale</label>
	            <input type="radio" name="filter" id="sepia" value="sepia(100%)">
	            <label for="sepia">Sepia</label>
	            <input type="radio" name="filter" id="invert" value="invert(100%)">
	            <label for="invert">Invert</label>
	            <input type="radio" name="filter" id="hue" value="hue-rotate(90deg)">
	            <label for="hue">Hue</lable>
	            <input type="radio" name="filter" id="blur" value="blur(10px)">
	            <label for="blur">blur</label>
	            <input type="radio" name="filter" id="contrast" value="contrast(200%)">
	            <label for="contrast">Contrast</lable>

	        </fieldset> -->
	    </form>
	    <button id="photo-button" class="btn btn-dark">
			Take photo
		</button>
		<button id="clear-button" class="btn btn-dark">
			Clear
		</button>
		<canvas id="canvas"></canvas>
	</dir>

	<!-- 캡처한 사진들을 출력  -->
	<div class="bottom-container">
		<div id="photos"></div>
	</div>
	
	<!--  -->
	<body>
	<div id="content">
		<div class="wrap">
			<video autoplay poster="/resources/images/logo.png"></video>
			<button>getUserMedia()</button>
		</div>
	</div>

</body>
</body>
<script type="text/javascript">
		let width= 640,
			height= 0,
			filter= "none",
			streaming = false;
		
		// DOM Elements
		const video = document.querySelector("#video");
		const canvas = document.querySelector("#canvas");
		const photos = document.querySelector("#photos");
		const photoButton = document.querySelector("#photo-button");
		const clearButton = document.querySelector("#clear-button");
		const photoFilter = document.querySelector("#photo-filter");
		console.log(photoFilter);

		//Get media stream
		navigator.mediaDevices.getUserMedia({video: true, audio: false})
			.then(function(stream){
				//Link to the video source
				video.srcObject = stream;
				//Play video
				video.onloadedmetadata = function(e) {
				    video.play();
				};
			})
			.catch(function(err){
				console.log('Error: ' + err.name + "/" + err.message);
			});

		 //Play when ready
		video.addEventListener('canplay', function(e){
			if(!streaming){
				//Set video/canvas height
				height = video.videoHeight /(video.videoWidth / width);
				video.setAttribute('width', width);
				video.setAttribute('height', height);
				canvas.setAttribute('width', width);
				canvas.setAttribute('height', height);

				streaming = true;
			}
		}, false); 

		//Photo filter change event
		/* photoFilter.addEventListener('change', function(e){
			//어떤 필터가 선택 되었는지 그 값을 가져온다. 더 간단한 방법은 없나?
			var obj = document.getElementsByName("filter");
			var checked_index = -1;
			for(i = 0; i < obj.length; i++){
				if(obj[i].checked){
					checked_index = i;
					filter = obj[i].value;
				}
			}
			//이렇게 나온 필터의 값을 비디오 스타일에 적용 
			video.style.filter = filter;
			//console.log(filter);
			e.preventDefault();
		}); */

		/* //Clear button evnet
		clearButton.addEventListener('click', function(e){
			photos.innerHTML = "";
			filter = 'none';
			video.style.filter = filter;
			document.querySelector("#normal").checked = true;
		}); */

		//Capture button click
		photoButton.addEventListener('click', function(e){
			takePicture();

			e.preventDefault();
		}, false);

		function takePicture(){
			const context = canvas.getContext('2d');
			if(width && height){
				canvas.width = width;
				canvas.height = height;
				//캔버스에 그리기
				context.drawImage(video, 0, 0, width, height); 
				//캔버스로붙 실제 이미지를 가져오기 
				const imgUrl = canvas.toDataURL('image/png');
				//엘리먼트를 만들고 가져온 이미지를 출력하기 
				const img = document.createElement('img');
				img.setAttribute('src', imgUrl);
				img.style.filter = filter;
				//photos Div 안에 추가하기 
				photos.appendChild(img);
			}
		}

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