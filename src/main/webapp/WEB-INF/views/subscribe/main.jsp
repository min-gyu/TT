<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<jsp:include page="/WEB-INF/views/subscribe/layout/sub-nav.jsp" />

<style type="text/css">
	.bor {border-bottom: 1px solid #D7D7D7;}
	.tit_area {
	    height: 75px;
	    padding-top: 22px;
	    position: relative;
	}
	.tit_area h4 {
	    color: #000000;
	    font-size: 16px;
	}
	.recommend {
	    padding: 0 0 0 15px;
	    min-height: 150px;
	    position: relative;
	    width: 724px;
	    overflow: hidden;
	}
	.vod_w {
	    overflow: hidden;
	    margin-right: -15px;
	}
	.vod_w li {
	    width: 168px;
	    margin-right: 15px;
	    float: left;
	    line-height: 18px;
	    position: relative;
	    min-height: 200px;
        list-style: none;
	}
	.vod_w li img {
	    width: 168px;
	    height: 95px;
	    margin-bottom: 7px;
	}
	.vod_w li a {
	    display: block;
	}
	.vod_w li .bj {
	    zoom: 1;
	}
	.vod_w li span {
	    display: block;
	}
	.vod_w li .date {
	    color: #848484;
	    font-size: 11px;
	    font-family: tahoma;
	}
	.vod_w li span {
	    display: block;
	}
	.recommend:after {
	    clear: both;
	    content: "";
	    display: block;
	}
	
	.sub-nav-top{
		position: fixed;
	    bottom: 300px;
	    right: 50px;
	    height: 40px;
	    width: 40px;
	    text-align: center;
	}
	.sub-nav-top img{
		width: 100%;
	}
</style>

<jsp:include page="/WEB-INF/views/subscribe/live.jsp" />
<jsp:include page="/WEB-INF/views/subscribe/vod.jsp" />
<jsp:include page="/WEB-INF/views/subscribe/channel.jsp" />

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />