package kr.kh.spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.kh.spring.data.TicketingData;
import kr.kh.spring.model.dto.MessageDTO;
import kr.kh.spring.model.vo.MemberVO;
import kr.kh.spring.model.vo.MovieVO;
import kr.kh.spring.model.vo.ScheduleVO;
import kr.kh.spring.model.vo.ScreenVO;
import kr.kh.spring.model.vo.SeatVO;
import kr.kh.spring.model.vo.TicketingVO;
import kr.kh.spring.model.vo.Ticketing_listVO;
import kr.kh.spring.service.TicketingService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class RefundController {
	
	@Autowired
	private TicketingService ticketingService;
	
	@GetMapping("/refund/ticketingList")
	public String refundTicketingList(Model model, HttpSession session) {
		log.info("/refund/ticketingList");
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		List<TicketingData> ticketingData = new ArrayList<TicketingData>();
		
		List<TicketingVO> ticketingList = ticketingService.getTicketingList(user.getMe_id());

		for (TicketingVO ticketingVO : ticketingList) {
			List<Ticketing_listVO> ticketing_list_List = ticketingService.getTicketing_list(ticketingVO.getTi_num());

			ScheduleVO scheduleVO = ticketingService.getSchedule(ticketingVO.getTi_sd_num());
			MovieVO movieVO = ticketingService.getMovie(scheduleVO.getSd_mo_num());
			ScreenVO screenVO = ticketingService.getScreen(scheduleVO.getSd_sc_num());
			
			for (Ticketing_listVO ticketing_listVO : ticketing_list_List) {

				SeatVO seatVO = new SeatVO(ticketing_listVO.getTl_se_num(), "", 0);
				seatVO = ticketingService.getSeat(seatVO);
				
				ticketingData.add(new TicketingData(ticketingVO.getTi_num()
												, ticketing_listVO.getTl_num()
												, ticketingVO.getTi_me_id()
												, movieVO.getMo_title()
												, screenVO.getSc_name()
												, seatVO.getSe_name()
												, scheduleVO.getSd_date()
												, scheduleVO.getSd_time()
												));
			}
		}

		model.addAttribute("ticketingData", ticketingData);
		return "/refund/ticketingList";
	}
	
	@PostMapping("/refund/ticketingList")
	public String refundTicketingListPost(Model model, int tl_num) {
		log.info("/refund/ticketingList/post : "+ tl_num);
		
		ticketingService.deleteTicketing_list(tl_num);

		MessageDTO message = new MessageDTO("/", "환불에 성공 했습니다.");

		model.addAttribute("message", message);
		return "/main/message";
	}
}
