package kr.kh.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.spring.model.vo.MovieVO;

public interface MovieDAO {

	List<MovieVO> getMovieList();

	MovieVO selectMovie(@Param("mo_num")int mo_num);


}
