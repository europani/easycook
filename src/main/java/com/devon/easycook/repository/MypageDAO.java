package com.devon.easycook.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.devon.easycook.domain.CouponDTO;
import com.devon.easycook.domain.OrdersDTO;

@Repository
public class MypageDAO extends AbstractMybatisDAO{

   private String namespace = "mypageMapper";
//   HashMap<String, String> map = new HashMap<String, String>();
   
   
   public List<OrdersDTO> orders(String id) {
      SqlSession sqlsession = getSqlSessionFactory().openSession();
      try {
         return sqlsession.selectList(namespace + ".OrderList", id);
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





   
}
