package com.hotel.biz.service;


import com.hotel.biz.VO.MemberVO;

public interface LoginService {
	
	public MemberVO login(String id, String pw) throws Exception;
	
	
	
}
