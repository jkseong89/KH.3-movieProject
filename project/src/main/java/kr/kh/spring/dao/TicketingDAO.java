package kr.kh.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.spring.model.vo.MovieVO;
import kr.kh.spring.model.vo.ScheduleVO;
import kr.kh.spring.model.vo.ScreenVO;
import kr.kh.spring.model.vo.SeatVO;
import kr.kh.spring.model.vo.TicketingVO;
import kr.kh.spring.model.vo.Ticketing_listVO;

public interface TicketingDAO {

	List<ScreenVO> selectScreenList();

	List<SeatVO> selectSeatList(int sc_num);

	ScreenVO selectScreen(Integer sc_num);

	List<ScheduleVO> selectScheduleList(@Param("mo_num")int mo_num, @Param("sc_num")int sc_num);

	ScheduleVO selectSchedule(Integer sd_num);

	boolean insertTicketing(TicketingVO ticketingVO);

	SeatVO selectSeat(SeatVO seatVO);

	boolean insertTicketing_list(@Param("ti_num")int ti_num, @Param("se_num")int se_num);

	List<Ticketing_listVO> selectTicketing_listList();

	List<TicketingVO> selectTicketingList(String me_id);

	MovieVO selectMovie(int mo_num);

	List<Ticketing_listVO> selectTicketing_list(int ti_num);

	boolean deleteTicketing_list(int tl_num);
}