<%@ page language="j/77777777uy6-*-ava" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">​
<title>TT</title>
</head>
<body>
	<h1>today's tv</h1>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
	<jsp:forward page="WEB-INF/views/main/main.jsp" />
</body>
</html>