package com.hotel.biz.DAO;

import com.hotel.biz.VO.MemberVO;

public class LoginParam {

	String id = "";
	String pw = "";
	
	public LoginParam(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}

	public LoginParam(MemberVO vo) {
	}

	public String getid() {
		return id;
	}

	public String getpw() {
		return pw;
	}

	
	
	

}
