<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style type="text/css">
.listarea {
    position: relative;
    width: 100%;
}
.listarea ul {
    position: relative;
    margin-right: -16px;
}
.listarea li {
    position: relative;
    z-index: 1;
    float: left;
    padding-right: 16px;
    padding-bottom: 30px;
    list-style: none;
}
.listarea ul:after {
    display: block;
    clear: both;
    content: '';
}
.favor_all .ready_box {
    height: 175px;
    padding: 14px 0 0 0;
}
.favor_all .ready_box a {
    text-decoration: none;
    text-align: center;
}
.ready_box {
    position: relative;
    display: block;
    width: 226px;
    height: 119px;
    border: 1px solid #d8d8d8;
    border-radius: 5px;
    background: #fff;
}

.ready_box a {
    display: block;
    width: 226px;
    height: 119px;
}
.ready_box .cast_delete {
    display: none;
    position: absolute;
    top: 5px;
    right: 5px;
    width: 15px;
    height: 15px;
}
.ready_box .cast_fixing {
    display: none;
    overflow: hidden;
    position: absolute;
    top: 6px;
    left: 7px;
    background: url(/images/afmain/img_main.png) -133px -217px no-repeat;
    width: 18px;
    height: 18px;
}
.listarea li:after {
    display: block;
    clear: both;
    content: '';
}
.ready_box .thumb {
    position: absolute;
    top: 15px;
    left: 26px;
}
.ready_box span {
    line-height: 110%;
}
.favor_all .ready_box a .thumb, .favor_all .ready_box a .nick, .favor_all .ready_box a .afid {
    position: static;
}
.favor_all .ready_box .nick {
    width: auto;
    margin-top: 8px;
    font-size: 15px;
}
.ready_box .nick {
    position: absolute;
    top: 30px;
    left: 110px;
    font-size: 16px;
    color: #333;
    font-weight: bold;
    letter-spacing: -1px;
    display: block;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
    width: 110px;
}
.ready_box .afid {
    position: absolute;
    top: 53px;
    left: 110px;
    color: #555;
}
.favor_all .ready_box .date {
    position: absolute;
    top: auto;
    bottom: 8px;
    font-size: 12px;
    letter-spacing: -.5px;
}
.ready_box .date {
    display: block;
    position: absolute;
    top: 92px;
    left: 0;
    width: 100%;
    border-top: 1px solid #ebebeb;
    padding-top: 9px;
    text-align: center;
    font-size: 11px;
    color: #999;
}
</style>
<section id="channel" class="container">
	<div class="bor">
		<div class="tit_area">
			<h4>channel</h4>
		</div>
		<div class="listarea favor_all">
			<ul>
				<li>
					<div class="ready_box ">
						<a href="http://www.afreecatv.com/seokwngud" target="_blank">
							<!-- <span class="thumb">
								<img src="//stimg.afreecatv.com/LOGO/se/seokwngud/seokwngud.jpg"
									onerror="this.src='//res.afreecatv.com/images/afmain/img_thumb_profile.gif'"
									width="62" height="62" title="">
							</span> -->
							<span class="nick" user_id="seokwngud">뜨뜨뜨뜨-</span>
							<span class="afid">seokwngud</span>
							<!-- <span class="date"><span>최근방송</span> : 2019-02-03 23:00</span> -->
						</a>
						<!-- 
						<a href="javascript:;" id="favorite_delete" class="cast_delete">
							<span class="favorite">
								<em>즐겨찾기 삭제</em>
							</span>
						</a>
						<a href="javascript:;" class="cast_fixing" favorite_no="472801856">
							<span><em>목록 상단고정</em></span>
						</a>
						 -->
					</div>
				</li>
			</ul>
			<!-- <div class="more_list" style="display: none">
				<a href="javascript:;">더보기<em></em></a>
			</div> -->
		</div>
	</div>
</section>