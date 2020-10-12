package com.devon.easycook.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devon.easycook.repository.MemberDAO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDao;
}
