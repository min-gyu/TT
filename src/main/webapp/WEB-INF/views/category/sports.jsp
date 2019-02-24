<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<link rel="stylesheet" href="/resources/css/sidebar/simple-sidebar.css">
<link href="/resources/css/sidebar/bootstrap.css" rel="stylesheet">

<section>
	<div class="d-flex" id="wrapper">
		<!-- Sidebar -->
		<jsp:include page="/WEB-INF/views/category/layout/sidebar.jsp" />
		<!-- /#sidebar-wrapper -->
		
	    <!-- Page Content -->
	    <div id="page-content-wrapper">
		  <jsp:include page="/WEB-INF/views/category/layout/sub-nav.jsp" />
		  
		  <jsp:include page="/WEB-INF/views/category/layout/content.jsp" />
	    </div>
	    <!-- /#page-content-wrapper -->
	</div>
</section>
<!-- Bootstrap core JavaScript -->
<script src="/resources/js/sidebar/bootstrap.bundle.min.js"></script>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />