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
	
	.sub-nav-top{
		position: fixed;
	    bottom: 300px;
	    right: 50px;
	    height: 40px;
	    width: 40px;
	    overflow: hidden;
	    text-align: center;
	    transition: all ease 1.2s;
	    z-index: 999;
	}
	.sub-nav-top img{
		width: 100%;
	}
</style>

<script type="text/javascript">
	$(function (){
		$(".subscribe-nav a").on("click", function() {
		  var target = $(this).attr("data-target");
		  var scrollPosition = $(target).offset().top;
		  
		  $("html,body").animate({scrollTop:scrollPosition - 200}, 500);
		});
		
		var subNavScroll = true;
		$(window).scroll(function(event){ 
		   var scrollHeight = $(document).scrollTop();
		   var stdHeight 	= $("#live").offset().top - 200;
		   if(scrollHeight < stdHeight){
			 if(subNavScroll == true){
			  	$(".sub-nav-top").css("height", "0px");
			  	subNavScroll = false;
			 }
		  }else{
			  if(subNavScroll == true){
			  	$(".sub-nav-top").css("height", "40px");
			  }else{
				  subNavScroll = true;
			  }
		  }
		}); 
		
	})
	
	
</script>

<section class="container">
	<div class="subscribe-nav">
		<a data-target="#live" 		href="javascript:void(0);">구독</a>
		<a data-target="#vod" 		href="javascript:void(0);">최근 본 방송</a>
		<a data-target="#channel" 	href="javascript:void(0);">채널</a>
		
		<div class="sub-nav-top" style="height: 0px;">
			<a data-target="body" 	href="javascript:void(0);">
				<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/160/google/55/top-with-upwards-arrow-above_1f51d.png">
			</a>
		</div>
	</div>
	
</section>

