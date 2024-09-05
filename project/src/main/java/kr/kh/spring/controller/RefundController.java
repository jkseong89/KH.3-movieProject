package kr.kh.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class RefundController {
	
	@GetMapping("/refund/ticketingList")
	public String refundTicketingList() {
		log.info("/refund/ticketingList");
		return "/refund/ticketingList";
	}
}
