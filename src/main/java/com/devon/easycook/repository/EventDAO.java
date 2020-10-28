package com.devon.easycook.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devon.easycook.domain.EventDTO;

@Repository
public class EventDAO extends AbstractMybatisDAO{
	
	@Autowired
	SqlSession sqlsession;
	
	private String namespace = "eventMapper";
	
	//1.eventTitle보기
	public List<EventDTO> selectTitle(){
		sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectList((namespace + ".eventTitle"));
		}finally {
			sqlsession.close();
		}
	}

}
