package com.devon.easycook.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.devon.easycook.domain.CouponDTO;
import com.devon.easycook.domain.OrdersDTO;
import com.devon.easycook.domain.ProductDTO;
import com.devon.easycook.domain.ReviewDTO;
import com.devon.easycook.domain.WishlistDTO;

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
   
   public void wishlistInput(Map<String, Object> wishlistMap) {
	   SqlSession sqlsession = getSqlSessionFactory().openSession();
	   int result = 0;
	   try {
		   result = sqlsession.insert(namespace + ".wishlistInput", wishlistMap);
		   if (result != 0) {
				sqlsession.commit();
			}
		} finally {
			sqlsession.close();
		}
	  
   }
   
   public List<WishlistDTO> wishlist(String id) {
	   SqlSession sqlsession = getSqlSessionFactory().openSession();
	   try {
		   return sqlsession.selectList(namespace + ".wishlist", id);
		} finally {
			sqlsession.close();
		}
	  
   }
   
   public OrdersDTO cancelRequire(Map<String, Object> refundCheckMap) {
      SqlSession sqlsession = getSqlSessionFactory().openSession();
      try {
         return sqlsession.selectOne(namespace + ".cancelRequire", refundCheckMap);
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
