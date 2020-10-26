package com.devon.easycook.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devon.easycook.domain.MemberDTO;
import com.devon.easycook.repository.MemberDAO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDao;

	public MemberDTO login(Map<String, String> map) {
		return memberDao.login(map);
	}
	
	public MemberDTO kakaologin(String nickname) {
		return memberDao.kakaologin(nickname);
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
	
	public MemberDTO getInfo(String id) {
		return memberDao.getInfo(id);
	}

	public String getId(MemberDTO member) {
		return memberDao.getId(member);
	}
	
	public String getPwd(String pwd) {
		return memberDao.getPwd(pwd);
	}
	
	public String getEmail(String id) {
		return memberDao.getEmail(id);
	}

	public void changePwd(Map<String, String> map) {
		memberDao.changePwd(map);
	}

	public void modify(MemberDTO member) {
		memberDao.modify(member);
	}
	
	public void delete(String id) {
		memberDao.delete(id);
	}
	
	
	// ADMIN
	public List<MemberDTO> getFullInfo() {
		return memberDao.getFullInfo();
	}
}
