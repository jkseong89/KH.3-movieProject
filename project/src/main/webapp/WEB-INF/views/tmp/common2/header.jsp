<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark" style="justify-content: space-between;">
	<ul class="navbar-nav">
		<li class="nav-item">
			<a class="navbar-brand" href="<c:url value="/"/>">Home</a>
		</li>
	</ul>
	<ul class="navbar-nav">
		<c:if test="${user == null}">
		    <li class="nav-item">
				<a class="navbar-brand" href="<c:url value="/guest/signup"/>">회원가입</a>
		    </li>
		    <li class="nav-item">
				<a class="navbar-brand" href="<c:url value="/guest/login"/>">로그인</a>
		    </li>
		</c:if>
	    <c:if test="${user != null }">
	    	<li class="nav-item">
				<a class="navbar-brand" href="<c:url value="/member/logout"/>">로그아웃</a>
		    </li>
	    </c:if>
	</ul>
</nav>
</body>
</html>