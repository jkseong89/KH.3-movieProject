package kr.kh.spring.dao;

import java.util.List;

import kr.kh.spring.model.vo.ScreenVO;
import kr.kh.spring.model.vo.SeatVO;

public interface TicketingDAO {

	List<ScreenVO> selectScreenList();

	List<SeatVO> selectSeatList(int sc_num);
}

