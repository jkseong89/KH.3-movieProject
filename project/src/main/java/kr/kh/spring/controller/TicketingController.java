package kr.kh.spring.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.spring.model.vo.ScreenVO;
import kr.kh.spring.model.vo.SeatVO;
import kr.kh.spring.service.TicketingService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class TicketingController {
	
	@Autowired
	private TicketingService ticketingService;
	
	@GetMapping("/ticketing/movieList")
	public String ticketingMovieList() {
		log.info("/ticketing/movieList");
		return "/ticketing/movieList";
	}
	
	@GetMapping("/ticketing/screenList")
	public String ticketingScreenList(Model model) {
		log.info("/ticketing/screenList");
		
		List<ScreenVO> screenList = ticketingService.getScreenList();
		
		model.addAttribute("screenList", screenList);
		return "/ticketing/screenList";
	}

	@PostMapping("/ticketing/seatList")
	public String ticketingSeatListPost(Model model, Integer sc_num) {
		log.info("/ticketing/seatList/Post : " + sc_num);
		
		List<SeatVO> seatList = ticketingService.getSeatList(sc_num);
		
		List<List<SeatVO>> seatList_byLine = new ArrayList<List<SeatVO>>();
		
		String lineAlphabet = "~";
		for (SeatVO item : seatList) {
			if (item.getSe_name().contains(lineAlphabet) == false) {
				lineAlphabet = item.getSe_name().charAt(0) + "";
				seatList_byLine.add(new ArrayList<SeatVO>());
			}
			seatList_byLine.get(seatList_byLine.size()-1).add(item);
		}

		model.addAttribute("seatList_byLine", seatList_byLine);
		return "/ticketing/seatList";
	}
	
	@ResponseBody
	@PostMapping("/ticketing/scheduleList")
	public String ticketingScheduleListPost(@RequestParam(value="arr") List<String> array) {
		log.info("/ticketing/scheduleList/post");
		
		System.out.println(array);
		return "/ticketing/scheduleList";
	}
	
	@GetMapping("/ticketing/payment")
	public String ticketingPayment() {
		log.info("/ticketing/payment");
		return "/ticketing/payment";
	}
}
