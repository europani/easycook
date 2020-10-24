package com.devon.easycook.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.devon.easycook.domain.OrdersDTO;

@Repository
public class MypageDAO extends AbstractMybatisDAO{

	private String namespace = "mypageMapper";
	HashMap<String, String> map = new HashMap<String, String>();
	
	
	public List<OrdersDTO> orders(Map<String, String> map) {
		System.out.println("dao실행 : " + map);
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectList(namespace + ".orders", map);
		} finally {
			sqlsession.close();
		}
	}
	
}
