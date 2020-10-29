package com.devon.easycook.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devon.easycook.domain.EventDTO;
import com.devon.easycook.util.PagingVO;

@Repository
public class EventDAO extends AbstractMybatisDAO{
	
	@Autowired
	SqlSession sqlsession;
	
	private String namespace = "eventMapper";
	HashMap<String, Object> map = new HashMap<String, Object>();
	//1.eventTitle보기
	public List<EventDTO> allEvent(){
		sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectList(namespace+".allEvent");
		}finally {
			sqlsession.close();
		}
	}
	
	   //상세
	   public EventDTO eventDetail(int eventNo) throws Exception{
	      sqlsession = getSqlSessionFactory().openSession();
	      map.clear();
	      map.put("eventNo", eventNo);
	      try {
	         return (EventDTO) sqlsession.selectOne(namespace + ".eventDetail", map);
	      } finally {
	         sqlsession.close();
	      }
	   }
	
	
	
	
	// ADMIN	
	
	public int countEvent() {
		sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectOne(namespace + ".countEvent");
		}finally {
			sqlsession.close();
		}
	}

	public List<EventDTO> getFullInfo(PagingVO vo) {
		sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectList(namespace + ".getFullInfo", vo);
		}finally {
			sqlsession.close();
		}
	}

	public void write(EventDTO event) {
		sqlsession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlsession.insert(namespace + ".write", event);
			if (result != 0) {
				sqlsession.commit();
			}
		} finally {
			sqlsession.close();
		}
	}

	public EventDTO getEvent(int eventNo) {
		sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectOne(namespace + ".getEvent", eventNo);
		}finally {
			sqlsession.close();
		}
	}

	public void modify(EventDTO event) {
		sqlsession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlsession.insert(namespace + ".modify", event);
			if (result != 0) {
				sqlsession.commit();
			}
		} finally {
			sqlsession.close();
		}
	}

	public void delete(int eventNo) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlSession.delete(namespace + ".delete", eventNo);
			if (result != 0) {
				sqlSession.commit();
			}
		} finally {
			sqlSession.close();
		}
	}

}
