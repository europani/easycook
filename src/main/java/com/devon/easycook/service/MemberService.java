package com.devon.easycook.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devon.easycook.domain.MemberDTO;
import com.devon.easycook.repository.MemberDAO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDao;

	public void login() {
		// TODO Auto-generated method stub
		
	}
	
	public void signup(MemberDTO member) {
		memberDao.signup(member);
	}
	
	
}
