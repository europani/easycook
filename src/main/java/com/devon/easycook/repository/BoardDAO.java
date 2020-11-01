package com.devon.easycook.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.devon.easycook.domain.CouponDTO;
import com.devon.easycook.domain.EventDTO;
import com.devon.easycook.domain.NoticeDTO;
import com.devon.easycook.util.PagingVO;

@Repository
public class BoardDAO extends AbstractMybatisDAO {
	private String namespace = "boardMapper";
	HashMap<String, Object> map = new HashMap<String, Object>();
	
	public List<NoticeDTO> noticeAllList(){	// ??
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
	
	public NoticeDTO getArticle(int noticeNo, boolean noticeCount) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		map.clear();
		map.put("noticeNo", noticeNo);
		NoticeDTO article = new NoticeDTO();
		int result = 0;
		try {
			if(noticeCount)
				result = sqlSession.update(namespace + ".addReadCount", map);
			article = (NoticeDTO) sqlSession.selectOne(namespace + ".getArticle", map);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
		return article;
	}
	
	public List<EventDTO> eventList(){
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectList(namespace + ".eventList");
		} finally {
			sqlsession.close();
		}
	}
	
	   //상세
	   public EventDTO eventDetail(int eventNo) throws Exception{
		   SqlSession sqlsession = getSqlSessionFactory().openSession();
	      map.clear();
	      map.put("eventNo", eventNo);
	      try {
	         return (EventDTO) sqlsession.selectOne(namespace + ".eventDetail", map);
	      } finally {
	         sqlsession.close();
	      }
	   }
	
	
	
	
	
	
	
	
	// ADMIN
	public List<NoticeDTO> getNoticeInfo(PagingVO vo) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(namespace + ".getNoticeInfo", vo);
		} finally {
			sqlSession.close();
		}
	}

	public void noticeWrite(NoticeDTO notice) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlSession.insert(namespace + ".noticeWrite", notice);
			if (result != 0) {
				sqlSession.commit();
			}
		} finally {
			sqlSession.close();
		}
	}

	public void noticeModify(NoticeDTO notice) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlSession.insert(namespace + ".noticeModify", notice);
			if (result != 0) {
				sqlSession.commit();
			}
		} finally {
			sqlSession.close();
		}
		
	}

	public void noticeDelete(int noticeNo) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlSession.insert(namespace + ".noticeDelete", noticeNo);
			if (result != 0) {
				sqlSession.commit();
			}
		} finally {
			sqlSession.close();
		}
	}	
	
	public int countEvent() {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectOne(namespace + ".countEvent");
		}finally {
			sqlsession.close();
		}
	}

	public List<EventDTO> getEventInfo(PagingVO vo) {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectList(namespace + ".getEventInfo", vo);
		}finally {
			sqlsession.close();
		}
	}

	public void eventWrite(EventDTO event) {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlsession.insert(namespace + ".eventWrite", event);
			if (result != 0) {
				sqlsession.commit();
			}
		} finally {
			sqlsession.close();
		}
	}

	public EventDTO getEvent(int eventNo) {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectOne(namespace + ".getEvent", eventNo);
		}finally {
			sqlsession.close();
		}
	}

	public void eventModify(EventDTO event) {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlsession.insert(namespace + ".eventModify", event);
			if (result != 0) {
				sqlsession.commit();
			}
		} finally {
			sqlsession.close();
		}
	}

	public void eventDelete(int eventNo) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlSession.delete(namespace + ".eventDelete", eventNo);
			if (result != 0) {
				sqlSession.commit();
			}
		} finally {
			sqlSession.close();
		}
	}

	
	public List<Integer> getCouponNo() {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectList(namespace + ".getCouponNo");
		} finally {
			sqlsession.close();
		}
	}

	public List<CouponDTO> getCouponList() {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectList(namespace + ".getCouponList");
		}finally {
			sqlsession.close();
		}
	}

	public CouponDTO getCoupon(int couponNo) {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectOne(namespace + ".getCoupon", couponNo);
		}finally {
			sqlsession.close();
		}
	}
	
	public void couponWrite(CouponDTO coupon) {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlsession.insert(namespace + ".insertCoupon", coupon);
			if (result != 0) {
				sqlsession.commit();
			}
		} finally {
			sqlsession.close();
		}
		
	}

	public void couponModify(CouponDTO coupon) {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlsession.update(namespace + ".modifyCoupon", coupon);
			if (result != 0) {
				sqlsession.commit();
			}
		} finally {
			sqlsession.close();
		}
	}

	public void couponDelete(int couponNo) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlSession.update(namespace + ".deleteCoupon", couponNo);
			if (result != 0) {
				sqlSession.commit();
			}
		} finally {
			sqlSession.close();
		}
	}

	public int checkUserCoupon(HashMap<String, Object> map) {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectOne(namespace + ".checkUserCoupon", map);
		}finally {
			sqlsession.close();
		}
	}

	public int giveCoupon(HashMap<String, Object> map) {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlsession.insert(namespace + ".giveCoupon", map);
			if (result != 0) {
				sqlsession.commit();
			}
			return result;
		}finally {
			sqlsession.close();
		}
	}

	
}
