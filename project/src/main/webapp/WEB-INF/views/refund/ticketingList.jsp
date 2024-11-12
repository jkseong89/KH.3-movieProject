<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.task_1 {
	margin-top: 100px;
	margin-bottom: 20px;
	display: flex;
	justify-content: center;
}

.task_2 {
	width: 70%;
	height: 70%;
}

.task_3 {
	display: flex;
	justify-content: center;
}


.list-group-item {
	display: flex;
    justify-content: space-between;
}
</style>
</head>
<body>
	<div class="task_1">
		<div class="task_2">
			<ul class="list-group ul-tag">
				<c:forEach var="data" items="${ticketingData}">
					<li class="list-group-item">
						${data.ti_num} : ${data.mo_title} / ${data.sc_name} - ${data.se_name}
						${data.date } - ${data.time}
						<form action="<c:url value="/refund/ticketingList"/>" method="post">
							<input type="hidden" id="postValue" name="tl_num" value="${data.tl_num}">
							<button type="submit" class="btn btn-warning btn-custom">환불</button>
						</form>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="task_3">
		<a href="<c:url value="/"/>" class="btn btn-dark">뒤로가기</a>
	</div>
	<script type="text/javascript">	
		<script>
			 $(document).ready(function() { 
			    $('ul.ul-tag li').click(function(e) {
			    	$(this).find('.form-seat').submit();
			    });
			 });
	</script>
</body>
</html>