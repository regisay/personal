
package com.hotel.biz.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hotel.biz.VO.MemberVO;
import com.hotel.biz.service.JoinService;
import com.hotel.biz.service.LoginService;
import com.hotel.biz.service.MypageService;

@Controller

@RequestMapping("/user/*")
public class UserController {

	@Inject
	JoinService joinService;
	@Inject
	LoginService loginService;
	@Inject
	MypageService mypageService;
	
	
	
	@RequestMapping("loginpage.do")
	public String loginpage(HttpServletRequest request,HttpSession session,Model model) {
		
		model.addAttribute("pwchk",'1');
		
		
		
		return "login/login";
		
	}
	
	@RequestMapping(value="login.do", method = RequestMethod.POST)
	public String login(MemberVO vo,HttpSession session,HttpServletRequest request,Model model) throws Exception {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		System.out.println(id);
		System.out.println(pw);
		
		// 값이 있는지 없는지 확인하는 기준
		
		MemberVO login = loginService.login(id,pw);
		System.out.println("login값:"+login);
		
		
		// 있는지 없는지 확인
		if(login != null) {
		
			System.out.println("로그인 성공");
			session.setAttribute("loginChk", login);
			session.setAttribute("id", id);
			model.addAttribute("pwchk",id);
			model.addAttribute("pwchk2",pw);
			return "index";
			
		} else {
			
			System.out.println("로그인 실패");
			model.addAttribute("pwchk",login);
			return "login/login";
			
			
		}
		
	}
	
	 
	
	
	@RequestMapping(value = "mypageP.do", method = RequestMethod.GET)
	public String mypage(Model model, HttpServletRequest request, MemberVO vo) throws Exception {

		HttpSession session = request.getSession();

		return "/user/mypage";

	}
	
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}
	

	@RequestMapping(value="hoteljoin.do", method = RequestMethod.POST )
	public String joinhotel(MemberVO vo,HttpSession session,Model model) throws Exception {
		
		
		System.out.println("이름값:"+vo.getName());
		System.out.println("ID:"+vo.getId());
		
		String fail = (String) session.getAttribute("fail");
		
		if(vo.getName() == null || vo.getName() == "") {
			
			return "user/joinpage";
			
		}else {
			
			joinService.joinhotel(vo);
			
			return "index";		
		
			}
		}
	
	
	
	
	//회원가입 페이지 이동
	@RequestMapping(value = "joinpage.do", method = RequestMethod.GET)
	public String joinpage(MemberVO vo) throws Exception {
		return "user/join";
		
	}
	
	//아이디 중복 체크
	@RequestMapping(value="idCheck.do",method = RequestMethod.GET)
	public String idcheck(Model model, HttpServletRequest request, HttpSession session,MemberVO memberVO) throws Exception {
			
			String id = request.getParameter("id");
			System.out.println(id);
			String chkresult = joinService.idCheck(id);	
			model.addAttribute("result",chkresult);
			
			if(chkresult.equals("0")){
				
				System.out.println("중복 없음"+chkresult);
				model.addAttribute("0",chkresult);
				session.setAttribute("success", chkresult);
				
			}else {
				
				System.out.println("중복 있음"+chkresult);
				model.addAttribute("1",chkresult);
				session.setAttribute("fail", chkresult);
			}
			
			return "user/idCheckC";

		}
	
	//중복체크 했는지 안했는지 
	
	@RequestMapping(value="JoinChk.do",method = RequestMethod.GET)
	public String JoinChk(Model model, HttpServletRequest request, HttpSession session,MemberVO memberVO) throws Exception {
		
		String id = request.getParameter("id");
		System.out.println(id);
		String chkresult = joinService.idCheck(id);
		model.addAttribute("JoinChk",chkresult);
		
		if(chkresult.equals("0")){
			
			System.out.println("중복 없음"+chkresult);
			
		}else {
			
			System.out.println("중복 있음");
			
		}
		
		return "user/JoinChk";
		
	}

	//아이디 중복 체크 form으로 이동
	@RequestMapping(value = "MemberIdCheckAction.do", method = RequestMethod.GET)
	public String MemberIdCheckAction(MemberVO vo) throws Exception {
		return "user/IdCheckForm";
		
	}
	
	//개인정보 수정
	@RequestMapping(value="updateuser.do") 
	  public String updateuser(MemberVO vo) throws Exception {
		  
		  System.out.println("id값:"+vo.getId());
	  
		  joinService.updateuser(vo);
	  
		  return "index";
	  
	  }
	  
	//회원 탈퇴
	@RequestMapping(value="deleteuser.do")
	public String deleteuser(MemberVO vo,HttpServletRequest request,HttpSession session ) throws Exception {
		
	
		System.out.println("deleteuser 기동");
		
		MemberVO mv = (MemberVO)session.getAttribute("loginChk");
		
		joinService.deleteuser(mv);
		
		  
		session.invalidate();
		
		return "index";

		  
	  }
	  
	//회원탈퇴용 비밀번호 체크 jsp 이동 
	@RequestMapping(value = "pwCheck.do")
	public String pwCheck(MemberVO vo,HttpServletRequest request,Model model,HttpSession session) throws Exception {
		
		System.out.println("pwCheck.do"+vo.getPw());
		session.getAttribute("loginChk");
		
		
		return "user/pwCheckForm";
		
	}
	
	

}
