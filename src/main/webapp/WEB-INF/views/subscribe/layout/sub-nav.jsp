<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<style type="text/css">
	.subscribe-nav{border-bottom: 1px solid #DDDDDD;}
	.subscribe-nav>a{
	    color: #191E21;
	    padding: 11px 17px;
	    text-decoration: none;
	    letter-spacing: .5px;
	    font-weight: 700;
	    line-height: 32px;
	    font-family: 'Raleway', sans-serif;
	    position: relative;
	    z-index: 1;
	}
</style>

<script type="text/javascript">
	$(function (){
		$(".subscribe-nav>a").on("click", function() {
		  var scrollPosition = $($(this).attr("data-target")).offset().top;
		  $("html,body").animate({scrollTop:scrollPosition - 200}, 500);
		});
	})
</script>

<section class="container">
	<div class="subscribe-nav">
		<a data-target="#live" 		href="javascript:void(0);">구독</a>
		<a data-target="#vod" 		href="javascript:void(0);">최근 본 방송</a>
		<a data-target="#channel" 	href="javascript:void(0);">채널</a>
	</div>
</section>

<div class="sub-nav-top">
	<a data-target="#live" 	href="javascript:void(0);">
		<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/160/google/55/top-with-upwards-arrow-above_1f51d.png">
	</a>
</div>
