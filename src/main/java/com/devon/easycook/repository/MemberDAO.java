package com.devon.easycook.repository;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO extends AbstractMybatisDAO {
	private String namespace = "memberMapper";
	HashMap<String, Object> map = new HashMap<String, Object>();
	
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
