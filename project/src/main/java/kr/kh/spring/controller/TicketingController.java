package kr.kh.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class TicketingController {
	
	@GetMapping("/ticketing/movieList")
	public String ticketingMovieList() {
		log.info("/ticketing/movieList");
		return "/ticketing/movieList";
	}
	
	@GetMapping("/ticketing/screenList")
	public String ticketingScreenList() {
		log.info("/ticketing/screenList");
		return "/ticketing/screenList";
	}
	
	@GetMapping("/ticketing/seatList")
	public String ticketingSeatList() {
		log.info("/ticketing/seatList");
		return "/ticketing/seatList";
	}
	
	@GetMapping("/ticketing/scheduleList")
	public String ticketingScheduleList() {
		log.info("/ticketing/scheduleList");
		return "/ticketing/scheduleList";
	}
	
	@GetMapping("/ticketing/payment")
	public String ticketingPayment() {
		log.info("/ticketing/payment");
		return "/ticketing/payment";
	}
}
