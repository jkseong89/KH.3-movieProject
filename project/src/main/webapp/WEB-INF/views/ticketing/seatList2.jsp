<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Lato&display=swap');

.top-container * {
	box-sizing: border-box;
}

.top-container {
	background-color: #242333;
	color: #fff;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	height: 500px;
	width: 500px;
	font-family: 'Lato', sans-serif;
	margin-top: 100px;
	margin-bottom: 20px;
}

.movie-container {
	margin: 20px 0;
}

.movie-container select {
	background-color: #fff;
	border: 0;
	border-radius: 5px;
	font-size: 14px;
	margin-left: 10px;
	padding: 5px 15px 5px 15px;
	-moz-appearance: none;
	-webkit-appearance: none;
	appearance: none;
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
	<div class="top-container d-flex justify-content-center">
<!-- 		<div class="movie-container">
			<label>Pick a movie:</label> <select id="movie">
				<option value="10">Avengers: Endgame ($10)</option>
				<option value="12">Joker ($12)</option>
				<option value="8">Toy Story 4 ($8)</option>
				<option value="9">The Lion King ($9)</option>
			</select>
		</div> -->
	
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
	
	<script type="text/javascript">
		const container = document.querySelector('.container');
		const seats = document.querySelectorAll('.row .seat:not(.occupied)');
		const count = document.getElementById('count');
		const total = document.getElementById('total');
		const movieSelect = document.getElementById('movie');
	
		populateUI();
	
		let ticketPrice = +movieSelect.value;
	
		// Save selected movie index and price
		function setMovieData(movieIndex, moviePrice) {
		  localStorage.setItem('selectedMovieIndex', movieIndex);
		  localStorage.setItem('selectedMoviePrice', moviePrice);
		}
	
		// Update total and count
		function updateSelectedCount() {
		  const selectedSeats = document.querySelectorAll('.row .seat.selected');
	
		  const seatsIndex = [...selectedSeats].map(seat => [...seats].indexOf(seat));
	
		  localStorage.setItem('selectedSeats', JSON.stringify(seatsIndex));
	
		  const selectedSeatsCount = selectedSeats.length;
	
		  count.innerText = selectedSeatsCount;
		  total.innerText = selectedSeatsCount * ticketPrice;
		  
		  setMovieData(movieSelect.selectedIndex, movieSelect.value);
		}
	
		// Get data from localstorage and populate UI
		function populateUI() {
		  const selectedSeats = JSON.parse(localStorage.getItem('selectedSeats'));
	
		  if (selectedSeats !== null && selectedSeats.length > 0) {
		    seats.forEach((seat, index) => {
		      if (selectedSeats.indexOf(index) > -1) {
		        seat.classList.add('selected');
		      }
		    });
		  }
	
		  const selectedMovieIndex = localStorage.getItem('selectedMovieIndex');
	
		  if (selectedMovieIndex !== null) {
		    movieSelect.selectedIndex = selectedMovieIndex;
		  }
		}
	
		// Movie select event
		movieSelect.addEventListener('change', e => {
		  ticketPrice =+ e.target.value;
		  setMovieData(e.target.selectedIndex, e.target.value);
		  updateSelectedCount();
		});
	
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