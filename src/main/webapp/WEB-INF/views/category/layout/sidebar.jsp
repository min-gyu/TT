<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Menu Toggle Script -->
<script type="text/javascript">
	$(function(){
		$("#menu-toggle").on("click", function(e) {
		    e.preventDefault();
		    
		    console.log("hi")
		    $("#wrapper").toggleClass("toggled");
		});	
	})
</script>

<style type="text/css">
	#menu-toggle{
		position:relative;
		width: 15px;
		background: #f8f9fa!important;
		cursor: pointer;
	}
	#menu-toggle i{
		position:absolute;
		top:50%;
		font-size: 25px;
	}
	.list-group a{
	    border: none;
	}
	.list-group hr{
	   	width: 100%;
	}
</style>

<!-- Sidebar -->
<div class=" border-right" id="sidebar-wrapper">
  <div class="sidebar-heading">Category </div>
  <div class="list-group list-group-flush">
    <a href="#" class="list-group-item list-group-item-action ">전체</a>
    <a href="#" class="list-group-item list-group-item-action ">스포츠</a>
    <a href="#" class="list-group-item list-group-item-action ">변경</a>
    <hr>
    <a href="#" class="list-group-item list-group-item-action ">변경</a>
    <a href="#" class="list-group-item list-group-item-action ">변경</a>
  </div>
</div>

<div id="menu-toggle">
	<i class="fas fa-caret-right"></i>
</div>