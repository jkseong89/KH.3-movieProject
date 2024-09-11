<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.cardWrap {
	width: 30em;
	margin: 3em auto;
	color: #fff;
	font-family: sans-serif;
}

.card {
	background: linear-gradient(to bottom, #e84c3d 0%, #e84c3d 26%, #ecedef 26%, #ecedef 100%);
	height: 11em;
	float: left;
	position: relative;
	padding-left: 16px;
	padding-top: 10px;
	margin-top: 20px;
}

.cardLeft {
	width: 300px;
}

.cardRight {
	width: 150px;
	border-left: .18em dashed #fff;
	border-top-right-radius: 8px;
	border-bottom-right-radius: 8px;
}

.cardRight:before, .cardRight:after {
	content: "";
	position: absolute;
	display: block;
	width: .9em;
	height: .9em;
	background: #fff;
	border-radius: 50%;
	left: -.5em;
}

.cardRight:before {
	top: -.4em;
}

.cardRight:after {
	bottom: -.4em;
}

h1 {
	font-size: 1.1em;
	margin-top: 0;
}

h1 span {
	font-weight: normal;
}

.title, .name, .seat, .time {
	text-transform: uppercase;
	font-weight: normal;
}

.title h2, .name h2, .seat h2, .time h2 {
	font-size: .9em;
	color: #525252;
	margin: 0;
}

.title span, .name span, .seat span, .time span {
	font-size: .7em;
	color: #a2aeae;
}

.title {
	margin: 16px 0 0 0;
}

.name, .seat {
	margin: 0 0 0 0;
}

.time {
	margin: 0 0 0 64px;
}

.seat, .time {
	float: left;
}

.eye {
	position: relative;
	width: 2em;
	height: 1.5em;
	background: #fff;
	margin: 0 128px 0 44px;
	border-radius: 1em/0.6em;
	z-index: 1;
}

.eye:before, .eye:after {
	content: "";
	display: block;
	position: absolute;
	border-radius: 50%;
}

.eye:before {
	width: 1em;
	height: 1em;
	background: #e84c3d;
	z-index: 2;
	left: 8px;
	top: 4px
}

.eye:after {
	width: .5em;
	height: .5em;
	background: #fff;
	z-index: 3;
	left: 12px;
	top: 8px
}

.number {
	text-align: center;
	text-transform: uppercase;
}

.number h3 {
	color: #e84c3d;
	margin: 16px 16px 0 0;
	font-size: 2.5em;
}

.number span {
	display: block;
	color: #a2aeae;
	margin: 0 16px 0 0;
}

.barcode {
	height: 2em;
	width: 0;
	margin: 10px 0 5px 16px;
	box-shadow: 1px 0 0 1px #343434, 5px 0 0 1px #343434, 10px 0 0 1px #343434, 11px 0 0 1px #343434, 15px 0 0 1px #343434,
		18px 0 0 1px #343434, 22px 0 0 1px #343434, 23px 0 0 1px #343434, 26px 0 0 1px #343434, 30px 0 0 1px #343434, 35px 0 0
		1px #343434, 37px 0 0 1px #343434, 41px 0 0 1px #343434, 44px 0 0 1px #343434, 47px 0 0 1px #343434, 51px 0 0 1px
		#343434, 56px 0 0 1px #343434, 59px 0 0 1px #343434, 64px 0 0 1px #343434, 68px 0 0 1px #343434, 72px 0 0 1px #343434,
		74px 0 0 1px #343434, 77px 0 0 1px #343434, 81px 0 0 1px #343434
}
</style>
</head>
<body>
	<div class="task_3 clearfix">
		<c:forEach var="selectSeat" items="${selectedSeatList}">
			<div class="cardWrap">
				<div class="card cardLeft">
					<h1 class="font-weight-bold">
						Startup <span>Cinema</span>
					</h1>
					<div class="title">
						<h2 class="font-weight-bold">How I met your Mother</h2>
						<span>movie</span>
					</div>
					<div class="name">
						<h2 class="font-weight-bold">Vladimir Kudinov</h2>
						<span>name</span>
					</div>
					<div class="clearfix">
						<div class="seat">
							<h2 class="font-weight-bold">156</h2>
							<span>seat</span>
						</div>
						<div class="time">
							<h2 class="font-weight-bold">12:00</h2>
							<span>time</span>
						</div>
					</div>

				</div>
				<div class="card cardRight">
					<div class="eye"></div>
					<div class="number">
						<h3 class="font-weight-bold">156</h3>
						<span>seat</span>
					</div>
					<div class="barcode"></div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="d-flex justify-content-center">
		<div class="btn btn-dark">
			<a href="<c:url value="/ticketing/complete"/>" class="btn btn-dark">여기가 마지막</a>
		</div>
	</div>
</body>
</html>