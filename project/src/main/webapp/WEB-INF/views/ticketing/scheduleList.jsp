<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.task_2 * {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
	font-family: sans-serif;
}

.task_2 {
	margin-top: 100px;
	margin-bottom: 20px;
}

.box {
	width: 300px;
	border-bottom: 20px solid #03a9f4;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
}

.box h2 {
	color: #fff;
	background: #03a9f4;
	padding: 10px 20px;
	font-size: 20px;
	font-weight: 700;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}

.box ul {
	position: relative;
	background: #fff;
}

.box ul:hover li {
	opacity: 0.2;
}

.box ul li {
	list-style: none;
	padding: 10px;
	width: 100%;
	background: #fff;
	box-shadow: 0 5px 25px rgba(0, 0, 0, 0.1);
	transition: transform 0.5s;
}

.box ul li:hover {
	transform: scale(1.1);
	z-index: 5;
	background: #25bcff;
	box-shadow: 0 5px 25px rgba(0, 0, 0, 0.2);
	color: #fff;
	opacity: 1;
}

.box ul li span {
	width: 20px;
	height: 20px;
	text-align: center;
	line-height: 20px;
	background: #25bcff;
	color: #fff;
	display: inline-block;
	border-radius: 50%;
	margin-right: 10px;
	font-size: 12px;
	font-weight: 600;
	transform: translateY(-2px);
}

.box ul li:hover span {
	background: #fff;
	color: #25bcff;
}
</style>
</head>
<body>
	<div class="task_2 d-flex justify-content-center">
		<div class="box">
			<h2>상영관 선택(호버 시 마우스 바꾸고 싶음)</h2>
			<ul class="ul-tag">
				<c:forEach var="item" items="${scheduleList}">
					<li class="li-tag" >
						<form action="<c:url value="/ticketing/seat"/>" class="form-seat" method="post">
							<input type="hidden" name="sd_num" value="${item.sd_num}">
						</form>
						<span>${item.sd_num}</span>${item.sd_time}
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>

	<script>
		 $(document).ready(function() { 
		    $('ul.ul-tag li').click(function(e) {
		    	$(this).find('.form-seat').submit();
		    });
		 });
	</script>
</body>
</html>