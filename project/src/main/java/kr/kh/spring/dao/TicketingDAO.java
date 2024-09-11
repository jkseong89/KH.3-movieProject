package kr.kh.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.spring.model.vo.ScheduleVO;
import kr.kh.spring.model.vo.ScreenVO;
import kr.kh.spring.model.vo.SeatVO;

public interface TicketingDAO {

	List<ScreenVO> selectScreenList();

	List<SeatVO> selectSeatList(int sc_num);

	ScreenVO selectScreen(Integer sc_num);

	List<ScheduleVO> selectScheduleList(@Param("mo_num")int mo_num, @Param("sc_num")int sc_num);
}

