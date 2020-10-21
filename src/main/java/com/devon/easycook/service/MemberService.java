package com.devon.easycook.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.devon.easycook.domain.MemberDTO;
import com.devon.easycook.repository.MemberDAO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDao;

	public MemberDTO login(Map<String, String> map) {
		return memberDao.login(map);
	}
	
	public void signup(MemberDTO member) {
		memberDao.signup(member);
	}

	public void insertAuthKey(Map<String, String> map) {
		memberDao.insertAuthKey(map);
	}

	public boolean checkAuthKey(Map<String, String> map) {
		String authKey = memberDao.checkAuthKey(map);
		boolean result = authKey.equals(map.get("authKey"));
		if (result) {
			memberDao.changeAuthCheck(map.get("id"));
		}
		
		return result;
	}

	
	
	
}
