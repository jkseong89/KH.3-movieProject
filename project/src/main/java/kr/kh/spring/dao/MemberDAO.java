package kr.kh.spring.dao;

import kr.kh.spring.model.vo.MemberVO;

public interface MemberDAO {

	boolean insertMember(MemberVO member);

	MemberVO selectMember(String me_id);
}
