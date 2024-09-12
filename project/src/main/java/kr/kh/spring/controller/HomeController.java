package kr.kh.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.spring.model.dto.MessageDTO;
import kr.kh.spring.model.vo.MemberVO;
import kr.kh.spring.model.vo.MovieVO;
import kr.kh.spring.model.vo.ScheduleVO;
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
	public String home(Model model, HttpSession session) {
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
		MessageDTO message;
		
		if(res) {
			message = new MessageDTO("/", "회원 가입을 했습니다.");
		}else {
			message = new MessageDTO("/guest/signup", "회원 가입을 하지 못했습니다.");
		}
		
		model.addAttribute("message", message);
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
		
		MessageDTO message;
		
		if (user.getMe_authority().equals("ADMIN")) {
			
			message = new MessageDTO("/", "관리자 로그인에 성공 했습니다.");
		} else {
			if(user != null) {
				message = new MessageDTO("/", "로그인을 성공 했습니다.");
			}else {
				message = new MessageDTO("/guest/login", "로그인을 실패 했습니다.");
			}
		}
		
		model.addAttribute("user", user);
		model.addAttribute("message", message);
		return "/main/message";
	}
	
	@GetMapping("/member/logout")
	public String logout(Model model, HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		session.removeAttribute("user");

		MessageDTO message = new MessageDTO("/", "로그아웃 했습니다.");

		model.addAttribute("message", message);
		return "/main/message";
	}
	
	@GetMapping("/main/moviedetail")
	public String movieDetail(Model model, @RequestParam("mo_num") int mo_num, HttpSession session) {
		MovieVO movie = movieService.selectMovie(mo_num);
		MemberVO user = (MemberVO)session.getAttribute("user");
		

		model.addAttribute("user", user);
		model.addAttribute("movie", movie);
		return "/main/moviedetail";
	}

	@ResponseBody
	@PostMapping("/main/moviedetail/update")
	public Map<String, Object> updateMovieDetail(@RequestBody MovieVO movie) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			movieService.updateMovie(movie);
			map.put("mo", movie);

		} catch (Exception e) {
			log.error("Failed to update movie", e);
		}
		return map;
	}
 	
 	@GetMapping("/main/movieregistration")
	public String movieRegistration(Model model) {
		return "/main/movieregistration";
	}
 	
 	@PostMapping("/main/movieregistration")
 	public String movieRegistrationInsert(Model model, MovieVO movie) {
 		movieService.insertMovie(movie);
 		 return "redirect:/main/home";
 	}
}
