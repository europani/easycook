package com.devon.easycook.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.devon.easycook.domain.CouponDTO;
import com.devon.easycook.domain.OrdersDTO;
import com.devon.easycook.domain.ReviewDTO;

@Repository
public class MypageDAO extends AbstractMybatisDAO{

   private String namespace = "mypageMapper";
//   HashMap<String, String> map = new HashMap<String, String>();
   
   
   public List<OrdersDTO> orders(String id) {
      SqlSession sqlsession = getSqlSessionFactory().openSession();
      try {
         return sqlsession.selectList(namespace + ".myOrderList", id);
      } finally {
         sqlsession.close();
      }
   }
   
   public List<OrdersDTO> ordersDetail(int ordersNo) {
	      SqlSession sqlsession = getSqlSessionFactory().openSession();
	      try {
	         return sqlsession.selectList(namespace + ".ordersDetailList", ordersNo);
	      } finally {
	         sqlsession.close();
	      }
	}
   
   public List<OrdersDTO> ordersDate(Map<String, String> map) {
	      SqlSession sqlsession = getSqlSessionFactory().openSession();
	      try {
	         return sqlsession.selectList(namespace + ".ordersDate", map);
	      } finally {
	         sqlsession.close();
	      }
	   }
   
   public List<CouponDTO> coupon(String id) {
      SqlSession sqlsession = getSqlSessionFactory().openSession();
      try {
         return sqlsession.selectList(namespace + ".coupon", id);
      } finally {
         sqlsession.close();
      }
   }
   
   public List<CouponDTO> couponDate(Map<String, String> map) {
	      SqlSession sqlsession = getSqlSessionFactory().openSession();
	      try {
	         return sqlsession.selectList(namespace + ".couponDate", map);
	      } finally {
	         sqlsession.close();
	      }
	   }
   
   public int couponCount(String id) {
	   SqlSession sqlsession = getSqlSessionFactory().openSession();
	   try {
		   return sqlsession.selectOne(namespace + ".couponCount", id);
		} finally {
			sqlsession.close();
		}
   }
   
   public int myPoint(String id) {
	   SqlSession sqlsession = getSqlSessionFactory().openSession();
	   try {
		   return sqlsession.selectOne(namespace + ".myPoint", id);
		} finally {
			sqlsession.close();
		}
	}
   
   public List<OrdersDTO> cancelRequire(int ordersNo) {
      SqlSession sqlsession = getSqlSessionFactory().openSession();
      try {
         return sqlsession.selectList(namespace + ".cancelRequire", ordersNo);
      } finally {
         sqlsession.close();
      }
   }


   // 반품절차
   // 1. 먼저 return(환불) 테이블에 ordersNo정보 추가
   // 2. return테이블에 insert가 제대로 되었다면, detail_refund 컬럼 update(0->1)
   // ****반품이 아닌 주문취소시엔, return테이블 추가없이 바로 checkCancel 진행
   public void returnTablePlus(int ordersNo) {
	   SqlSession sqlsession = getSqlSessionFactory().openSession();
	   int result = 0;
	   try {
		   result = sqlsession.insert(namespace + ".returnTablePlus", ordersNo);
		   if (result != 0) {
				sqlsession.commit();
			}
	   } finally {
	         sqlsession.close();
	   }
	}
   public void checkCancel(int ordersNo) {
	   SqlSession sqlsession = getSqlSessionFactory().openSession();
	   int result = 0;
	   try {
	         result = sqlsession.update(namespace + ".checkCancel", ordersNo);
	         if (result != 0) {
					sqlsession.commit();
				}
	   } finally {
	         sqlsession.close();
	   }
   }

   
   
   
   
   
   
   
   public int writeReview(ReviewDTO review) {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlsession.insert(namespace + ".writeReview", review);
			if (result != 0) {
				sqlsession.commit();
			}
		} finally {
			sqlsession.close();
		}
		return result;
	}
   
   
   // ADMIN
   public List<OrdersDTO> getOrder(int orderNo) {
	   SqlSession sqlsession = getSqlSessionFactory().openSession();
	      try {
	         return sqlsession.selectList(namespace + ".getOrder", orderNo);
	      } finally {
	         sqlsession.close();
	      }
	}




}
