package com.devon.easycook.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.devon.easycook.domain.NoticeDTO;
import com.devon.easycook.util.PagingVO;

@Service
public class NoticeDAO extends AbstractMybatisDAO{
	
	String namespace = "noticeMapper";
	HashMap<String, Object> map = new HashMap<String, Object>();
	
	public List<NoticeDTO> noticeAllList(){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".noticeAllList";
			return sqlSession.selectList(statement);
		}finally {
			sqlSession.close();
		}
	}
	
	public int getArticleCount(String category, String sentence) throws Exception {
		
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		System.out.println(sqlSession);
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("category", category);
			map.put("sentence", sentence);
			//null이 떠서 안댐!!
			return sqlSession.selectOne(namespace + ".getArticleCount", map);
		} finally {
			sqlSession.close();
		}
	}
	
	public List<NoticeDTO> getArticles(int start, int end, String category, String sentence) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		System.out.println("getArticles===old");
		map.clear();
		map.put("start", start);
		map.put("end", end);
		map.put("category", category);
		map.put("sentence", sentence);
		try {
			return sqlSession.selectList(namespace + ".getArticles", map);
		} finally {
			sqlSession.close();
		}
	}
	
	public NoticeDTO getArticle(int noticeNo, boolean noticeReadCount) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		map.clear();
		map.put("noticeNo", noticeNo);
		System.out.println(map);
		NoticeDTO article = new NoticeDTO();
		int result = 0;
		try {
			if(noticeReadCount)
				result = sqlSession.update(namespace + ".addReadCount", map);
			System.out.println(result);
			article = (NoticeDTO) sqlSession.selectOne(namespace + ".getArticle", map);
			System.out.println(article);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
		return article;
	}
	
	public void insertArticle(NoticeDTO article) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int noticeNo = article.getNoticeNo();
		int noticeRef = article.getNoticeRef();
		int noticeRe_step = article.getNoticeRe_step();
		int noticeRe_level = article.getNoticeRe_level();
		try {
			map.clear();
			int number = sqlSession.selectOne(namespace + ".insertArticle_new");
			if(number != 0)
				number = number + 1;
			else
				number = 1;
			if(noticeNo != 0) {
				map.put("noticeRef", noticeRef);
				map.put("noticeRe_step", noticeRe_step);
				sqlSession.update(namespace + ".insertArticle_update", map);
				sqlSession.commit();
				noticeRe_step = noticeRe_step + 1;
				noticeRe_level = noticeRe_level + 1;
			} else {
				noticeRef = number;
				noticeRe_step = 0;
				noticeRe_level = 0;
			}
			article.setNoticeNo(number);
			article.setNoticeRef(noticeRef);
			article.setNoticeRe_step(noticeRe_step);
			article.setNoticeRe_level(noticeRe_level);
			
			System.out.println("insert:" + article);
			int result = sqlSession.insert(namespace + ".insertArticle_insert", article);
			System.out.println("insert Ok:" + result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}
	
	public int updateArticle(NoticeDTO article) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		map.clear();
		map.put("noticeNo", article.getNoticeNo());
		int x = -1;
		try {
			String dbpasswd = (String)
					sqlSession.selectOne(namespace + ".update_passwd", map);
			if(dbpasswd.contentEquals(article.getNoticePasswd())) {
				x = sqlSession.update(namespace + ".update_update", article);
			}
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return x;
	}
	
	public int deleteArticle(int noticeNo, String noticePasswd) 
	         throws Exception {
	      SqlSession sqlSession = getSqlSessionFactory().openSession();
	      map.clear();
	      map.put("noticeNo", noticeNo);
	      int x = -1;
	      try {
	   String dbpasswd = (String) sqlSession.selectOne(namespace
	         + ".update_passwd", map);
	   if (dbpasswd.equals(noticePasswd)) {
	      x = sqlSession.delete(namespace + ".delete", map);
	         }      } finally {
	         sqlSession.commit();
	         sqlSession.close();
	      }      return x;   }
	
	
	
	
	
	
	
	

	// ADMIN
	public List<NoticeDTO> getFullInfo(PagingVO vo) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(namespace + ".getFullInfo", vo);
		} finally {
			sqlSession.close();
		}
	}

	public void write(NoticeDTO notice) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlSession.insert(namespace + ".write", notice);
			if (result != 0) {
				sqlSession.commit();
			}
		} finally {
			sqlSession.close();
		}
	}

	public void modify(NoticeDTO notice) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlSession.insert(namespace + ".modify", notice);
			if (result != 0) {
				sqlSession.commit();
			}
		} finally {
			sqlSession.close();
		}
		
	}

	public void delete(int noticeNo) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlSession.insert(namespace + ".del", noticeNo);
			if (result != 0) {
				sqlSession.commit();
			}
		} finally {
			sqlSession.close();
		}
	}
	
}
