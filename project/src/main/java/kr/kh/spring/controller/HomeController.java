package kr.kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.kh.spring.model.vo.MemberVO;
import kr.kh.spring.model.vo.MovieVO;
import kr.kh.spring.service.MemberService;
import kr.kh.spring.service.MovieService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class HomeController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	MovieService movieService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		List<MovieVO> list = movieService.getMovieList();
		model.addAttribute("list", list);
		return "/main/home";
	}
	@GetMapping("/main/home")
	public String movieHome(Model model) {
		List<MovieVO> list = movieService.getMovieList();
		model.addAttribute("list", list);
		return "/main/home";
	}
	
	@GetMapping("/main/moviedetail") 
	public String movieDetail(Model model, int mo_num) {
	  MovieVO movie = movieService.selectMovie(mo_num);
	  model.addAttribute("movie", movie); 
	  return "/main/moviedetail"; 
	}
	
	@PostMapping("/main/updateMovieInfo") 
	public String updateMovieInfo(Model model, int mo_num) {
	  MovieVO movie = movieService.selectMovie(mo_num);
	  model.addAttribute("movie", movie); 
	  return "/main/moviedetail"; 
	}
	
	@GetMapping("/guest/signup")
	public String signup() {
		return "/member/signup";
	}
	
	@PostMapping("/guest/signup")
	public String signupPost(Model model, MemberVO member) {
		boolean res = memberService.signup(member);
		if(res) {
			model.addAttribute("msg", "회원 가입을 했습니다.");
			model.addAttribute("url", "/");
		}else {
			model.addAttribute("msg", "회원 가입을 하지 못했습니다.");
			model.addAttribute("url", "/signup");
		}
		return "/main/message";
	}
	
	@GetMapping("/guest/login")
	public String login(HttpServletRequest request) {
		log.info("/guest/login");
		return "/member/login";
	}
	
	@PostMapping("/guest/login")
	public String loginPost(Model model, MemberVO member, HttpSession session) {
		log.info("/guest/login/post");
		MemberVO user = memberService.login(member);
		
		if(user != null) {
			model.addAttribute("msg", "로그인을 성공 했습니다.");
			model.addAttribute("url", "/");
		}else {
			model.addAttribute("msg", "로그인을 실패 했습니다.");
			model.addAttribute("url", "/login");
		}
		
		model.addAttribute("user", user);
		return "/main/message";
	}
	
	@GetMapping("/member/logout")
	public String logout(Model model, HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		session.removeAttribute("user");
		model.addAttribute("msg", "로그아웃 했습니다.");
		model.addAttribute("url", "/");
		return "/main/message";
	}
}
