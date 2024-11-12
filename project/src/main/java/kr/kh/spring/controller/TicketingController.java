package kr.kh.spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.kh.spring.model.dto.MessageDTO;
import kr.kh.spring.model.vo.MemberVO;
import kr.kh.spring.model.vo.MovieVO;
import kr.kh.spring.model.vo.ScheduleVO;
import kr.kh.spring.model.vo.ScreenVO;
import kr.kh.spring.model.vo.SeatVO;
import kr.kh.spring.model.vo.TicketingVO;
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
	public String ticketingScreenPost(Model model, int mo_num, HttpSession session) {
		log.info("/ticketing/screen/post : " + mo_num);
		
		MovieVO movieVO = ticketingService.getMovie(mo_num);		
		session.setAttribute("movieVO", movieVO);
		
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
		log.info("/ticketing/schedule/post : " + date);
		
		session.setAttribute("date", date);
		
		MovieVO movieVO = (MovieVO)session.getAttribute("movieVO");
		ScreenVO screenVO = (ScreenVO)session.getAttribute("screenVO");
		
		List<ScheduleVO> scheduleList = ticketingService.getScheduleList(movieVO.getMo_num(), screenVO.getSc_num());
		
		model.addAttribute("scheduleList", scheduleList);
		return "/ticketing/scheduleList";
	}

	@PostMapping("/ticketing/seat")
	public String ticketingSeatPost(Model model, Integer sd_num, HttpSession session) {
		log.info("/ticketing/seat/Post : " + sd_num);

		ScheduleVO scheduleVO = ticketingService.getSchedule(sd_num);
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

		MemberVO user = (MemberVO)session.getAttribute("user");
		MovieVO movieVO = (MovieVO)session.getAttribute("movieVO");
		ScreenVO screenVO = (ScreenVO)session.getAttribute("screenVO");
		ScheduleVO scheduleVO = (ScheduleVO)session.getAttribute("scheduleVO");
		String date = (String)session.getAttribute("date");

		model.addAttribute("user", user);
		model.addAttribute("movieVO", movieVO);
		model.addAttribute("screenVO", screenVO);
		model.addAttribute("scheduleVO", scheduleVO);
		model.addAttribute("date", date);
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

		MessageDTO message;
		if(user != null) {
			String[] selectedSeatList = (String[])session.getAttribute("selectedSeatList");
			ScreenVO screenVO = (ScreenVO)session.getAttribute("screenVO");
			ScheduleVO scheduleVO = (ScheduleVO)session.getAttribute("scheduleVO");
			
			TicketingVO ticketingVO = new TicketingVO();
			ticketingVO.setTi_me_id(user.getMe_id());
			ticketingVO.setTi_sd_num(scheduleVO.getSd_num());
			ticketingService.insertTicketing(ticketingVO);
			
			for (String se_name : selectedSeatList) {
				SeatVO seatVO = new SeatVO(0, se_name, screenVO.getSc_num());
				seatVO = ticketingService.getSeat(seatVO);
				
				ticketingService.insertTicketing_list(ticketingVO.getTi_num(), seatVO.getSe_num());
			}

			session.removeAttribute("prevUrl");
			message = new MessageDTO("/", "결제에 성공 했습니다.");
		}else {
			message = new MessageDTO("/guest/login", "로그인이 필요한 서비스입니다.");
		}

		model.addAttribute("message", message);
		return "/main/message";
	}
}
