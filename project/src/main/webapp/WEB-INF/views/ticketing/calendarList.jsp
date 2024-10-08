<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:wght@100;200;300;400;500;600;700&display=swap');

:root {
    --calendar-bg-color: #262829;
    --calendar-font-color: #FFF;
    --weekdays-border-bottom-color: #404040;
    --calendar-date-hover-color: #505050;
    --calendar-current-date-color: #1b1f21;
    --calendar-today-color: linear-gradient(to bottom, #03a9f4, #2196f3);
    --calendar-today-innerborder-color: transparent;
    --calendar-nextprev-bg-color: transparent;
    --next-prev-arrow-color : #FFF;
    --calendar-border-radius: 16px;
    --calendar-prevnext-date-color: #484848
}

.task_1 * {
    padding: 0;
    margin: 0;
}

.task_1 {
	margin-top: 100px;
	margin-bottom: 20px;
}

.calendar {
    font-family: 'IBM Plex Sans', sans-serif;
    position: relative;
    max-width: 400px; /*change as per your design need */
    min-width: 320px;
    background: var(--calendar-bg-color);
    color: var(--calendar-font-color);
    margin: 20px auto;
    box-sizing: border-box;
    overflow: hidden;
    font-weight: normal;
    border-radius: var(--calendar-border-radius);
}

.calendar-inner {
    padding: 10px 10px;
}

.calendar .calendar-inner .calendar-body {
    display: grid;
    grid-template-columns: repeat(7, 1fr);
    text-align: center;
}

.calendar .calendar-inner .calendar-body div {
    padding: 4px;
    min-height: 30px;
    line-height: 30px;
    border: 1px solid transparent;
    margin: 10px 2px 0px;
}

.calendar .calendar-inner .calendar-body div:nth-child(-n+7) {
    border: 1px solid transparent;
    border-bottom: 1px solid var(--weekdays-border-bottom-color);
}

.calendar .calendar-inner .calendar-body div:nth-child(-n+7):hover {
    border: 1px solid transparent;
    border-bottom: 1px solid var(--weekdays-border-bottom-color);
}

.calendar .calendar-inner .calendar-body div>a {
    color: var(--calendar-font-color);
    text-decoration: none;
    display: flex;
    justify-content: center;
}

.calendar .calendar-inner .calendar-body div:hover {
    border: 1px solid var(--calendar-date-hover-color);
    border-radius: 4px;
}

.calendar .calendar-inner .calendar-body div.empty-dates:hover {
    border: 1px solid transparent;
}

.calendar .calendar-inner .calendar-controls {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
}

.calendar .calendar-inner .calendar-today-date {
    display: grid;
    text-align: center;
    cursor: pointer;
    margin: 3px 0px;
    background: var(--calendar-current-date-color);
    padding: 8px 0px;
    border-radius: 10px;
    width: 80%;
    margin: auto;
}

.calendar .calendar-inner .calendar-controls .calendar-year-month {
    display: flex;
    min-width: 100px;
    justify-content: space-evenly;
    align-items: center;
}

.calendar .calendar-inner .calendar-controls .calendar-next {
    text-align: right;
}

.calendar .calendar-inner .calendar-controls .calendar-year-month .calendar-year-label,
.calendar .calendar-inner .calendar-controls .calendar-year-month .calendar-month-label {
    font-weight: 500;
    font-size: 20px;
}

.calendar .calendar-inner .calendar-body .calendar-today {
    background: var(--calendar-today-color);
    border-radius: 4px;
}

.calendar .calendar-inner .calendar-body .calendar-today:hover {
    border: 1px solid transparent;
}

.calendar .calendar-inner .calendar-body .calendar-today a {
    outline: 2px solid var(--calendar-today-innerborder-color);
}

.calendar .calendar-inner .calendar-controls .calendar-next a,
.calendar .calendar-inner .calendar-controls .calendar-prev a {
    color: var(--calendar-font-color);
    font-family: arial, consolas, sans-serif;
    font-size: 26px;
    text-decoration: none;
    padding: 4px 12px;
    display: inline-block;
    background: var(--calendar-nextprev-bg-color);
    margin: 10px 0 10px 0;
}

.calendar .calendar-inner .calendar-controls .calendar-next a svg,
.calendar .calendar-inner .calendar-controls .calendar-prev a svg {
    height: 20px;
    width: 20px;
}

.calendar .calendar-inner .calendar-controls .calendar-next a svg path,
.calendar .calendar-inner .calendar-controls .calendar-prev a svg path{
    fill: var(--next-prev-arrow-color);
}

.calendar .calendar-inner .calendar-body .prev-dates,
.calendar .calendar-inner .calendar-body .next-dates {
    color: var(--calendar-prevnext-date-color);
}

.calendar .calendar-inner .calendar-body .prev-dates:hover,
.calendar .calendar-inner .calendar-body .next-dates:hover {
  border: 1px solid transparent;
  pointer-events: none;
}
</style>
</head>
<body>
	<div class="task_1">
		<div class="calendar"></div>
	</div>
	
	<div class="d-flex justify-content-center">
		<form action="<c:url value="/ticketing/schedule"/>" class="form-seat" method="post">
			<input type="hidden" id="postValue" name="date" value="">
			<button class="btn btn-dark">버튼</button>
		</form>
	</div>
	
	<script type="text/javascript">
	//check the console for date click event
	//Fixed day highlight
	//Added previous month and next month view

	function CalendarControl() {
	    const calendar = new Date();
	    const calendarControl = {
	      localDate: new Date(),
	      prevMonthLastDate: null,
	      calWeekDays: [
	    	  "일", "월", "화", "수", "목", "금", "토"],
	      calMonthName: [
	    	  "1월", "2월", "3월", "4월", "5월", "6월",
	    	  "7월", "8월", "9월", "10월", "11월", "12월"
	      ],
	      daysInMonth: function (month, year) {
	        return new Date(year, month, 0).getDate();
	      },
	      firstDay: function () {
	        return new Date(calendar.getFullYear(), calendar.getMonth(), 1);
	      },
	      lastDay: function () {
	        return new Date(calendar.getFullYear(), calendar.getMonth() + 1, 0);
	      },
	      firstDayNumber: function () {
	        return calendarControl.firstDay().getDay() + 1;
	      },
	      lastDayNumber: function () {
	        return calendarControl.lastDay().getDay() + 1;
	      },
	      getPreviousMonthLastDate: function () {
	        let lastDate = new Date(
	          calendar.getFullYear(),
	          calendar.getMonth(),
	          0
	        ).getDate();
	        return lastDate;
	      },
	      navigateToPreviousMonth: function () {
	        calendar.setMonth(calendar.getMonth() - 1);
	        calendarControl.attachEventsOnNextPrev();
	      },
	      navigateToNextMonth: function () {
	        calendar.setMonth(calendar.getMonth() + 1);
	        calendarControl.attachEventsOnNextPrev();
	      },
	      navigateToCurrentMonth: function () {
	        let currentMonth = calendarControl.localDate.getMonth();
	        let currentYear = calendarControl.localDate.getFullYear();
	        calendar.setMonth(currentMonth);
	        calendar.setYear(currentYear);
	        calendarControl.attachEventsOnNextPrev();
	      },
	      displayYear: function () {
	        let yearLabel = document.querySelector(".calendar .calendar-year-label");
	        yearLabel.innerHTML = calendar.getFullYear();
	      },
	      displayMonth: function () {
	        let monthLabel = document.querySelector(
	          ".calendar .calendar-month-label"
	        );
	        monthLabel.innerHTML = calendarControl.calMonthName[calendar.getMonth()];
	      },
	      selectDate: function (e) {
	        console.log(
	          `\${e.target.textContent} \${
	            calendarControl.calMonthName[calendar.getMonth()]
	          } \${calendar.getFullYear()}`
	        );

	        calendarControl.highlightSelectday(e.target.textContent);
	      },
	      plotSelectors: function () {
	        document.querySelector(
	          ".calendar"
	        ).innerHTML += `
	        <div class="calendar-inner">
	        	<div class="calendar-controls">
	        		<div class="calendar-prev"><a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="128" height="128" viewBox="0 0 128 128"><path fill="#666" d="M88.2 3.8L35.8 56.23 28 64l7.8 7.78 52.4 52.4 9.78-7.76L45.58 64l52.4-52.4z"/></svg></a></div>
	        		<div class="calendar-year-month">
			          	<div class="calendar-year-label"></div>
			          	<div>-</div>
			          	<div class="calendar-month-label"></div>
			        </div>
				    <div class="calendar-next"><a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="128" height="128" viewBox="0 0 128 128"><path fill="#666" d="M38.8 124.2l52.4-52.42L99 64l-7.77-7.78-52.4-52.4-9.8 7.77L81.44 64 29 116.42z"/></svg></a></div>
				</div>
		        <div class="calendar-today-date">오늘:
		        	\${calendarControl.localDate.getFullYear()},
		          	\${calendarControl.calMonthName[calendarControl.localDate.getMonth()]}
		            \${calendarControl.localDate.getDate()}일
		            \${calendarControl.calWeekDays[calendarControl.localDate.getDay()]}요일
		        </div>
		        <div class="calendar-body"></div>
	        </div>`;
	      },
	      plotDayNames: function () {
	        for (let i = 0; i < calendarControl.calWeekDays.length; i++) {
	          document.querySelector(
	            ".calendar .calendar-body"
	          ).innerHTML += `<div>\${calendarControl.calWeekDays[i]}</div>`;
	        }
	      },
	      plotDates: function () {
	        document.querySelector(".calendar .calendar-body").innerHTML = "";
	        calendarControl.plotDayNames();
	        calendarControl.displayMonth();
	        calendarControl.displayYear();
	        let count = 1;
	        let prevDateCount = 0;
	  
	        calendarControl.prevMonthLastDate = calendarControl.getPreviousMonthLastDate();
	        let prevMonthDatesArray = [];
	        let calendarDays = calendarControl.daysInMonth(
	          calendar.getMonth() + 1,
	          calendar.getFullYear()
	        );
	        // dates of current month
	        for (let i = 1; i < calendarDays; i++) {
	          if (i < calendarControl.firstDayNumber()) {
	            prevDateCount += 1;
	            document.querySelector(
	              ".calendar .calendar-body"
	            ).innerHTML += `<div class="prev-dates"></div>`;
	            prevMonthDatesArray.push(calendarControl.prevMonthLastDate--);
	          } else {
	            document.querySelector(
	              ".calendar .calendar-body"
	            ).innerHTML += `<div class="number-item" data-num=\${count}><a class="dateNumber" href="#">\${count++}</a></div>`;
	          }
	        }
	        //remaining dates after month dates
	        for (let j = 0; j < prevDateCount + 1; j++) {
	          document.querySelector(
	            ".calendar .calendar-body"
	          ).innerHTML += `<div class="number-item" data-num=\${count}><a class="dateNumber" href="#">\${count++}</a></div>`;
	        }
	        calendarControl.plotPrevMonthDates(prevMonthDatesArray);
	        calendarControl.plotNextMonthDates();
	      },
	      attachEvents: function () {
	        let prevBtn = document.querySelector(".calendar .calendar-prev a");
	        let nextBtn = document.querySelector(".calendar .calendar-next a");
	        let todayDate = document.querySelector(".calendar .calendar-today-date");
	        let dateNumber = document.querySelectorAll(".calendar .dateNumber");
	        prevBtn.addEventListener(
	          "click",
	          calendarControl.navigateToPreviousMonth
	        );
	        nextBtn.addEventListener("click", calendarControl.navigateToNextMonth);
	        todayDate.addEventListener(
	          "click",
	          calendarControl.navigateToCurrentMonth
	        );
	        for (var i = 0; i < dateNumber.length; i++) {
	            dateNumber[i].addEventListener(
	              "click",
	              calendarControl.selectDate,
	              false
	            );
	        }
	      },
	      highlightSelectday: function (day) {
	        let currentMonth = calendarControl.localDate.getMonth() + 1;
	        let changedMonth = calendar.getMonth() + 1;
	        let currentYear = calendarControl.localDate.getFullYear();
	        let changedYear = calendar.getFullYear();
	        if (
	          document.querySelectorAll(".number-item")
	        ) {
	        	calendarControl.hideSelectday();
	        	
	          	document.querySelectorAll(".number-item")
	          	[day - 1].classList.add("calendar-today");
	          	
	          	let todayDate = document.querySelector(".calendar .calendar-today-date");
	          	let postValue = document.getElementById('postValue');
	          	
	          	postValue.value = `\${changedYear}-\${changedMonth}-\${day}`;
	        }
	      },
	      hideSelectday: function () {
	    	  let element = document.querySelector(".calendar-today");
	    	  if (element != null) {
	    		element.classList.remove("calendar-today");
	    	  }
	      },
	      plotPrevMonthDates: function(dates){
	        dates.reverse();
	        for(let i=0;i<dates.length;i++) {
	            if(document.querySelectorAll(".prev-dates")) {
	                document.querySelectorAll(".prev-dates")[i].textContent = dates[i];
	            }
	        }
	      },
	      plotNextMonthDates: function(){
	       let childElemCount = document.querySelector('.calendar-body').childElementCount;
	       //7 lines
	       if(childElemCount > 42 ) {
	           let diff = 49 - childElemCount;
	           calendarControl.loopThroughNextDays(diff);
	       }

	       //6 lines
	       if(childElemCount > 35 && childElemCount <= 42 ) {
	        let diff = 42 - childElemCount;
	        calendarControl.loopThroughNextDays(42 - childElemCount);
	       }

	      },
	      loopThroughNextDays: function(count) {
	        if(count > 0) {
	            for(let i=1;i<=count;i++) {
	                document.querySelector('.calendar-body').innerHTML += `<div class="next-dates">\${i}</div>`;
	            }
	        }
	      },
	      attachEventsOnNextPrev: function () {
	        calendarControl.plotDates();
	        calendarControl.attachEvents();
	      },
	      init: function () {
	        calendarControl.plotSelectors();
	        calendarControl.plotDates();
	        calendarControl.attachEvents();
	      }
	    };
	    calendarControl.init();
	  }
	  
	  const calendarControl = new CalendarControl();
	</script>
</body>
</html>