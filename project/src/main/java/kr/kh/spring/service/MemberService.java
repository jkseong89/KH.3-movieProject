package kr.kh.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.spring.dao.MemberDAO;
import kr.kh.spring.model.vo.MemberVO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDao;
	
	public boolean signup(MemberVO member) {
		if(member == null) {
			return false;
		}
		System.out.println("1");
		try {
			//아이디 중복, 이메일 중복일 때 예외 발생
			return memberDao.insertMember(member);
		}catch(Exception e) {
			return false;
		}
	}

	public MemberVO login(MemberVO member) {
		if(member == null) {
			return null;
		}
		MemberVO user = memberDao.selectMember(member.getMe_id());
		if(user == null
		&& member.getMe_pw().equals(user.getMe_pw()) == false) {
			return null;
		}
		
		return user;
	}
}
