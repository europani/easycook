package com.devon.easycook.repository;

import java.util.HashMap;
import java.util.List;
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
	
	public MemberDTO kakaologin(String nickname) {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectOne(namespace + ".kakaologin", nickname);
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
	
	public MemberDTO getInfo(String id) {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectOne(namespace + ".getInfo", id);
		} finally {
			sqlsession.close();
		}
	}
	
	public String getId(MemberDTO member) {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectOne(namespace + ".getId", member);
		} finally {
			sqlsession.close();
		}
	}
	
	public String getPwd(String pwd) {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectOne(namespace + ".getPwd", pwd);
		} finally {
			sqlsession.close();
		}
	}

	public String getEmail(String id) {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectOne(namespace + ".getEmail", id);
		} finally {
			sqlsession.close();
		}
	}

	public void changePwd(Map<String, String> map) {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlsession.update(namespace + ".changePwd", map);
			if (result != 0) {
				sqlsession.commit();
			}
		} finally {
			sqlsession.close();
		}
	}

	public void modify(MemberDTO member) {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlsession.update(namespace + ".modify", member);
			if (result != 0) {
				sqlsession.commit();
			}
		} finally {
			sqlsession.close();
		}
	}
	
	public void delete(String id) {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlsession.update(namespace + ".delete", id);
			if (result != 0) {
				sqlsession.commit();
			}
		} finally {
			sqlsession.close();
		}
	}

	// ADMIN
	public List<MemberDTO> getFullInfo() {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectList(namespace + ".getFullInfo");
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
