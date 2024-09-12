<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Lato&display=swap');

.task_4 * {
	box-sizing: border-box;
}

.task_4 {
	margin-top: 100px;
	margin-bottom: 20px;
}	

.task_4 ,.task_5 {	
	display: flex;
	justify-content: center;
}

.task_5 {
	height: 500px;
	width: 500px;
	background-color: #242333;
	color: #fff;
	align-items: center;
	flex-direction: column;
	font-family: 'Lato', sans-serif;
}

.container {
	perspective: 1000px;
	margin-bottom: 30px;
}

.seat {
	background-color: #444451;
	height: 12px;
	width: 15px;
	margin: 3px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}

.seat.selected {
	background-color: #6feaf6;
}

.seat.occupied {
	background-color: #fff;
}

.seat:nth-of-type(2) {
	margin-right: 18px;
}

.seat:nth-last-of-type(2) {
	margin-left: 18px;
}

.seat:not(.occupied):hover {
	cursor: pointer;
	transform: scale(1.2);
}

.showcase .seat:not(.occupied):hover {
	cursor: default;
	transform: scale(1);
}

.showcase {
	background: rgba(0, 0, 0, 0.1);
	padding: 5px 10px;
	border-radius: 5px;
	color: #777;
	list-style-type: none;
	display: flex;
	justify-content: space-between;
}

.showcase li {
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 0 10px;
}

.showcase li small {
	margin-left: 2px;
}

.row {
	display: flex;
}

.screen {
	background-color: #fff;
	height: 70px;
	width: 100%;
	margin: 15px 0;
	transform: rotateX(-45deg);
	box-shadow: 0 3px 10px rgba(255, 255, 255, 0.7);
}

p.text {
	margin: 5px 0;
}

p.text span {
	color: #6feaf6;
}
</style>
</head>
<body>
	<div class="task_4">
		<div class="task_5">		
			<ul class="showcase">
				<li>
					<div class="seat"></div> <small>N/A</small>
				</li>
				<li>
					<div class="seat selected"></div> <small>Selected</small>
				</li>
				<li>
					<div class="seat occupied"></div> <small>Occupied</small>
				</li>	
			</ul>
		
			<div class="container">
				<div class="screen"></div>
				<form action="<c:url value="/ticketing/payment"/>" class="form-seat" method="post" enctype="multipart/form-data">
					<c:forEach var="seatList" items="${seatList_byLine}">
						<div class="row d-flex justify-content-center">
							<c:forEach var="seat" items="${seatList}">
								<div class="seat" id="${seat.se_name}"></div>
							</c:forEach>
						</div>
					</c:forEach>
		
					<p class="text d-flex justify-content-center">
						You have selected 
						<span id="count">0</span> 
	<!-- 					seats for a price of 
						$<span id="total">0</span> -->
				    </p>
	    
	    			<div class="d-flex justify-content-center">
						<button class="btn btn-dark">버튼</button>
	    			</div>
				</form>
			</div>
		</div>
    </div>
	
	<script type="text/javascript">
		const container = document.querySelector('.container');
		const seats = document.querySelectorAll('.row .seat:not(.occupied)');
		const count = document.getElementById('count');
		const total = document.getElementById('total');
	
		// Update total and count
		function updateSelectedCount() {
		  const selectedSeats = document.querySelectorAll('.row .seat.selected');
	
		  const seatsIndex = [...selectedSeats].map(seat => [...seats].indexOf(seat));
	
		  const selectedSeatsCount = selectedSeats.length;
	
		  count.innerText = selectedSeatsCount;
		}
	
		// Seat click event
		container.addEventListener('click', e => {
		  if (e.target.classList.contains('seat') 
			&& !e.target.classList.contains('occupied')) {
			  
			  if (e.target.classList.contains('selected')) {
				  //e.target.removeChild(e.target.firstElementChild);
				  e.target.replaceChildren();
				  //e.target.innerHTML = "";
				  //e.target.textContent = "";
			  }
			  else {
				  const newP = document.createElement('p');
				  const tmp = e.target.id;
				  newP.innerHTML = `
				  	<input type='hidden' name='selectedSeatList' value='\${e.target.id}'>
				  `;
				  e.target.appendChild(newP);
			  }
			  e.target.classList.toggle('selected');
			  
			  console.log(e.target.id);
			  
			  updateSelectedCount();
			  
			  // 실패작
/*  		    e.target.appendChild(`
		    		<input type='hidden' name='selectedSeat'>
		    `); */
		    
/* 		    e.target.insertAdjacentHTML('afterend', `
					    	<input type="hidden" name="selectedSeat">
				    `) */
				    
		    /* $(this).appendChild(`
					    	<input type="hidden" name="selectedSeat">
				    `); */
		  }
		});
	
		// Initial count and total set
		updateSelectedCount();
	</script>
</body>
</html>