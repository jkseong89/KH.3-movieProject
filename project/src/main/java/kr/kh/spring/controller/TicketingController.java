package kr.kh.spring.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.spring.model.vo.MemberVO;
import kr.kh.spring.model.vo.ScheduleVO;
import kr.kh.spring.model.vo.ScreenVO;
import kr.kh.spring.model.vo.SeatVO;
import kr.kh.spring.service.TicketingService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class TicketingController {
	
	@Autowired
	private TicketingService ticketingService;
	
	@GetMapping("/ticketing/movie")
	public String ticketingMovie() {
		log.info("/ticketing/movie");
		return "/ticketing/movieList";
	}
	
	@GetMapping("/ticketing/screen")
	public String ticketingScreen(Model model) {
		log.info("/ticketing/screen");
		
		List<ScreenVO> screenList = ticketingService.getScreenList();
		
		model.addAttribute("screenList", screenList);
		return "/ticketing/screenList";
	}
	
	@PostMapping("/ticketing/screen")
	public String ticketingScreenPost(Model model, int mo_num) {
		log.info("/ticketing/screen/post" + mo_num);
		
		List<ScreenVO> screenList = ticketingService.getScreenList();
		
		model.addAttribute("screenList", screenList);
		return "/ticketing/screenList";
	}
	
	@PostMapping("/ticketing/calendar")
	public String ticketingCalendarPost(Model model, Integer sc_num, HttpSession session) {
		log.info("/ticketing/calendar/post : " + sc_num);
		
		ScreenVO screenVO = ticketingService.getScreen(sc_num);
		session.setAttribute("screenVO", screenVO);
		
		return "/ticketing/calendarList";
	}
	//public String ticketingSchedulePost( HttpSession session) {
	@PostMapping("/ticketing/schedule")
	public String ticketingSchedulePost(Model model, String date, HttpSession session) {		
		log.info("/ticketing/calendar/post");
		
		session.setAttribute("date", date);
		
		ScreenVO screenVO = (ScreenVO)session.getAttribute("screenVO");
		
		List<ScheduleVO> scheduleList = ticketingService.getScheduleList(1, screenVO.getSc_num());
		
		for (int i = 0; i < scheduleList.size(); ++i) {
		
			log.info(scheduleList.get(i));
		}
		
		model.addAttribute("scheduleList", scheduleList);
		return "/ticketing/scheduleList";
	}

	@PostMapping("/ticketing/seat")
	public String ticketingSeatPost(Model model, ScheduleVO scheduleVO, HttpSession session) {
		log.info("/ticketing/seat/Post : " + scheduleVO);
		
		session.setAttribute("scheduleVO", scheduleVO);
		
		ScreenVO screenVO = (ScreenVO)session.getAttribute("screenVO");
		
		List<SeatVO> seatList = ticketingService.getSeatList(screenVO.getSc_num());
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
	
	@GetMapping("/ticketing/payment")
	public String ticketingPayment(Model model, HttpSession session, HttpServletRequest request) {
		log.info("/ticketing/payment");
		
		ScreenVO screenVO = (ScreenVO)session.getAttribute("screenVO");
		String[] selectedSeatList = (String[])session.getAttribute("selectedSeatList");
		
		model.addAttribute("screenVO", screenVO);
		model.addAttribute("selectedSeatList", selectedSeatList);
		return "/ticketing/payment";
	}
	
	@PostMapping("/ticketing/payment")
	public String ticketingPaymentPost(Model model, String[] selectedSeatList
			, HttpSession session, HttpServletRequest request) {
		log.info("/ticketing/payment/post : " + selectedSeatList.length);

		session.setAttribute("selectedSeatList", selectedSeatList);
		
		ScreenVO screenVO = (ScreenVO)session.getAttribute("screenVO");
		ScheduleVO scheduleVO = (ScheduleVO)session.getAttribute("scheduleVO");
		
		model.addAttribute("screenVO", screenVO);
		model.addAttribute("scheduleVO", scheduleVO);
		model.addAttribute("selectedSeatList", selectedSeatList);
		return "/ticketing/payment";
	}
	
	@GetMapping("/ticketing/complete")
	public String ticketingComplete(Model model, HttpSession session, HttpServletRequest request) {
		log.info("/ticketing/complete");
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		String prevUrl = request.getHeader("Referer");
		log.info(prevUrl);
		if(prevUrl != null && !prevUrl.contains("/complete")) {
			request.getSession().setAttribute("prevUrl", prevUrl);
		}
		
		if(user != null) {
			//ticketingService.insertTicket();
			model.addAttribute("msg", "결제에 성공 했습니다.");
			model.addAttribute("url", "/");
		}else {
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			model.addAttribute("url", "/guest/login");
		}
		
		return "/main/message";
	}
}
