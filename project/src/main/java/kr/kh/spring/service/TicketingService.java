package kr.kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.spring.dao.TicketingDAO;
import kr.kh.spring.model.vo.ScheduleVO;
import kr.kh.spring.model.vo.ScreenVO;
import kr.kh.spring.model.vo.SeatVO;

@Service
public class TicketingService {

	@Autowired
	TicketingDAO ticketingDao;

	public List<ScreenVO> getScreenList() {
		return ticketingDao.selectScreenList();
	}

	public List<SeatVO> getSeatList(int sc_num) {
		return ticketingDao.selectSeatList(sc_num);
	}

	public ScreenVO getScreen(Integer sc_num) {
		return ticketingDao.selectScreen(sc_num);
	}

	public List<ScheduleVO> getScheduleList(int mo_num, int sc_num) {
		return ticketingDao.selectScheduleList(mo_num, sc_num);
	}
	
}
