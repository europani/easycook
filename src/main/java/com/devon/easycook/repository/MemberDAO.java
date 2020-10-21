package com.devon.easycook.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.devon.easycook.domain.MemberDTO;

@Repository
public class MemberDAO extends AbstractMybatisDAO {
	private String namespace = "memberMapper";
	HashMap<String, Object> map = new HashMap<String, Object>();

	public int signup(MemberDTO member) {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlsession.insert(namespace + ".signup", member);
			if (result != 0) {
				sqlsession.commit();
			}
			return result;
		} finally {
			sqlsession.close();
		}
	}
	
	public MemberDTO login(Map<String, String> map) {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectOne(namespace + ".login", map);
		} finally {
			sqlsession.close();
		}
	}

	public void insertAuthKey(Map<String, String> map) {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlsession.update(namespace + ".insertAuthKey", map);
			if (result != 0) {
				sqlsession.commit();
			}
		} finally {
			sqlsession.close();
		}
	}

	public String checkAuthKey(Map<String, String> map) {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectOne(namespace + ".checkAuthKey", map);
		} finally {
			sqlsession.close();
		}
	}
	
	public void changeAuthCheck(String id) {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		try {
			sqlsession.update(namespace + ".changeAuthCheck", id);
			sqlsession.commit();
		} finally {
			sqlsession.close();
		}
	}

//	public int getArticleCount(String boardid, String category, String sentence) {
//		SqlSession sqlsession = getSqlSessionFactory().openSession();
//		try {
//			map.clear();
//			map.put("boardid", boardid);
//			map.put("category", category);
//			map.put("sentence", sentence);
//			return sqlsession.selectOne(namespace + ".getArticleCount", map);
//		} finally {
//			sqlsession.close();
//		}
//	}

}
