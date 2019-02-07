<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<style type="text/css">
.sv_area {
    position: relative;
    width: 100%;
    overflow: hidden;
    margin: 0 0 20px;
    height: 27px;
}
.sv_area .tab_list {
    list-style: none;
    float: left;
    overflow: hidden;
    border: 1px solid #b3b6be;
    border-radius: 2px;
    padding: 0;
}

.sv_area .tab_list li {
    float: left;
    width: 93px;
    height: 25px;
    margin-right: -1px;
    border-right: 1px solid #b3b6be;
    font-size: 13px;
}

.sv_area .tab_list li a {
    display: block;
    line-height: 25px;
    text-align: center;
    color: #595959;
    text-decoration: none;
    font-weight: bold;
    letter-spacing: -1px;
}

.sv_area .tab_list li.on a {
    color: #fff;
    background: #686e7e;
}
</style>

<link rel="stylesheet" href="/resources/css/recommend.css">

<div class="container-fluid">
  
  	<div id="broad_sv_area" class="sv_area" style="">
		<ul class="tab_list">
			<li class="on" role="view_cnt"><a href="javascript:;"><span>시청인원순</span></a></li>
			<li role="broad_start"><a href="javascript:;"><span>최신방송순</span></a></li>
		</ul>
	</div>
	

	<div class="recommend">
		<ul id="recomm_broading" class="vod_w">
			<li>
				<a href="javascript:playBroad('lshooooo', 'flash');">
					<img src="//liveimg.afreecatv.com/211151092.jpg"
						onerror="this.src='http://www.afreecatv.com/images/aftv_search/non.jpg'"
						title="[생]이상호 트위치대전 아프리카팀 ..">
					<span class="tit" title="[생]이상호 트위치대전 아프리카팀 ..">[생]이상호 트위치대전 아프리카팀 ..</span>
				</a> 
				<span class="bj">
					<a href="http://afreecatv.com/lshooooo" target="_blank">BJ이상호</a>
				</span>
				<span class="date">2019-02-05 17:03</span>
			</li>

			<li>
				<a href="javascript:playBroad('dlghfjs', 'flash');">
					<img src="//liveimg.afreecatv.com/211148332.jpg"
						onerror="this.src='http://www.afreecatv.com/images/aftv_search/non.jpg'"
						title="[생]깨박이X싸패VS종욱X사장 80킬내..">
					<span class="tit" title="[생]깨박이X싸패VS종욱X사장 80킬내..">[생]깨박이X싸패VS종욱X사장 80킬내..</span>
				</a>
				<span class="bj">
					<a href="http://afreecatv.com/dlghfjs" target="_blank">깨박이깨박이</a>
				</span> 
				<span class="date">2019-02-05 14:44</span>
			</li>
			
			<li>
				<a href="javascript:playBroad('devil0108', 'flash');">
					<img src="//liveimg.afreecatv.com/211153178.jpg"
						onerror="this.src='http://www.afreecatv.com/images/aftv_search/non.jpg'"
						title="[생]감스트 레이드돌고 본캐14강도..">
					<span class="tit" title="[생]감스트 레이드돌고 본캐14강도..">[생]감스트 레이드돌고 본캐14강도..</span>
				</a> 
				<span class="bj"> 
					<a href="http://afreecatv.com/devil0108" target="_blank">감스트</a>
				</span> 
				<span class="date">2019-02-05 18:42</span>
			</li>
		</ul>
	</div>
	
<!-- 	
	<div class="more_list" style="display: block;">
		<a href="javascript:;">
			<span>더보기
			<i class="fas fa-angle-down"></i>
			</span>
		</a>
	</div>
	 -->
	 
	<div class="line">
		<div>더보기<i class="fas fa-angle-down"></i></div>
	</div>
	
</div>