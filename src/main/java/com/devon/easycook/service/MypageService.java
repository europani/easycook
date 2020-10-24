package com.devon.easycook.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devon.easycook.domain.OrdersDTO;
import com.devon.easycook.repository.MypageDAO;

@Service
public class MypageService {

	@Autowired
	private MypageDAO mypageDAO;
	
	public List<OrdersDTO> Orders(Map<String, String> map) {
		System.out.println("서비스 : " + map);
		return mypageDAO.orders(map);
		
	}
	
}
