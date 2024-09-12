package kr.kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.spring.dao.TicketingDAO;
import kr.kh.spring.model.vo.MovieVO;
import kr.kh.spring.model.vo.ScheduleVO;
import kr.kh.spring.model.vo.ScreenVO;
import kr.kh.spring.model.vo.SeatVO;
import kr.kh.spring.model.vo.TicketingVO;
import kr.kh.spring.model.vo.Ticketing_listVO;

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

	public ScheduleVO getSchedule(Integer sd_num) {
		return ticketingDao.selectSchedule(sd_num);
	}

	public boolean insertTicketing(TicketingVO ticketingVO) {
		return ticketingDao.insertTicketing(ticketingVO);		
	}

	public SeatVO getSeat(SeatVO seatVO) {
		return ticketingDao.selectSeat(seatVO);
	}

	public boolean insertTicketing_list(int ti_num, int se_num) {
		return ticketingDao.insertTicketing_list(ti_num, se_num);
	}

	public List<Ticketing_listVO> getTicketing_listList() {
		return ticketingDao.selectTicketing_listList();
	}

	public List<TicketingVO> getTicketingList(String me_id) {
		return ticketingDao.selectTicketingList(me_id);
	}

	public MovieVO getMovie(int mo_num) {
		return ticketingDao.selectMovie(mo_num);
	}

	public List<Ticketing_listVO> getTicketing_list(int ti_num) {
		return ticketingDao.selectTicketing_list(ti_num);
	}

	public boolean deleteTicketing_list(int tl_num) {
		return ticketingDao.deleteTicketing_list(tl_num);
	}
}
