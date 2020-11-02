package com.hotel.biz.service;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hotel.biz.DAO.LoginDAO;
import com.hotel.biz.VO.MemberVO;


@Service
public class LoginServiceImpl implements LoginService {

	private final LoginDAO loginDAO;
	
	@Inject
	public LoginServiceImpl(LoginDAO loginDAO) {
		
		this.loginDAO = loginDAO;
		
	}
	

	@Override
	public MemberVO login(String id,String pw) throws Exception {
		
		return loginDAO.login(id, pw);
		
	}


	
	 
	 


	


}
