<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
	.btn-custom {
		height: 250px;
		width: 250px;
		font-size: 300%;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.btn-1 {
		position: relative;
		left: -50px;
		top: 50px;
	}
	.btn-2 {
		position: relative;
		left: 250px;
		top: -200px;
	}
	</style>
</head>
<body>
	<a href="<c:url value="/ticketing/movie"/>" class="btn-custom btn-1 btn btn-success">예매</a>

	<a href="<c:url value="/refund/ticketingList"/>" class="btn-custom btn-2 btn btn-warning">환불</a>
</body>
</html>
