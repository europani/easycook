package com.devon.easycook.repository;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devon.easycook.domain.CartDTO;
import com.devon.easycook.domain.CouponDTO;
import com.devon.easycook.domain.OrdersDTO;
import com.devon.easycook.domain.OrdersDetailDTO;
import com.devon.easycook.domain.RefundDTO;
import com.devon.easycook.domain.ReviewDTO;
import com.devon.easycook.util.PagingVO;

@Repository
public class OrderDAO extends AbstractMybatisDAO {

	@Autowired
	SqlSession sqlsession;

	private String namespace = "orderMapper";

	// 1. 장바구니에 추가하기
	// dto에 저장된 값을 받아서 sql 세션에 저장하고 cart/cartInsert로 감 mapper로
	public void cartInsert(CartDTO dto) {
		sqlsession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlsession.insert(namespace + ".cartInsert", dto);
			if (result != 0) {
				sqlsession.commit();
			}
		} finally {
			sqlsession.close();
		}
	}

	// 2. 장바구니 목록 보기
	public List<CartDTO> cartList(String id) {
		sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectList(namespace + ".cartList", id);
		} finally {
			sqlsession.close();
		}
	}

	// 3. 장바구니 삭제하기
	public void cartDelete(int cartNo) {
		sqlsession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlsession.delete(namespace + ".cartDelete", cartNo);
			if (result != 0) {
				sqlsession.commit();
			}
		} finally {
			sqlsession.close();
		}
	}

	// 4. 쿠폰 목록 보기 
	public List<CouponDTO> couponList(String id) {
		sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectList(namespace + ".couponList", id);
		} finally {
			sqlsession.close();
		}
	}
	// 5. 장바구니 합계구하기 public int sumMoney(String Id) { sqlsession =
	/*
	 * getSqlSessionFactory().openSession(); try { return
	 * sqlsession.selectOne(namespace + ".sumMoney", Id); } finally {
	 * sqlsession.close(); } }
	 */

	/*
	 * // 3. 장바구니 수정하기 - 수량덮어쓰기 public void cartModify(CartDTO cart) { sqlsession =
	 * getSqlSessionFactory().openSession(); int result = 0; try { result =
	 * sqlsession.update(namespace + ".cartModify", cart); if(result != 0) {
	 * sqlsession.commit(); } } finally { sqlsession.close(); } }
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * // 6. 장바구니 동일 상품 확인 public int cartCount(int productNo, String Id) {
	 * sqlsession = getSqlSessionFactory().openSession(); Map<String, Object> map =
	 * new HashMap<String, Object>(); map.put("productNo", productNo); map.put("Id",
	 * Id); try { return sqlsession.selectOne(namespace + ".cartCount", map); }
	 * finally { sqlsession.close(); } }
	 * 
	 * // 7. 장바구니에 같은상품있으면 수량합산 public void cartUpdate(CartDTO cart) { sqlsession =
	 * getSqlSessionFactory().openSession(); int result = 0; try { result =
	 * sqlsession.update(namespace + ".sumTotal", cart); if(result != 0) {
	 * sqlsession.commit(); } } finally { sqlsession.close(); } }
	 */



	
	
	
	
	
	
  public void updateReviewCheck(ReviewDTO review) {
	   SqlSession sqlsession = getSqlSessionFactory().openSession();
	   int result = 0;
	   try {
	         result = sqlsession.update(namespace + ".updateReviewCheck", review);
	         if (result != 0) {
				sqlsession.commit();
			}
	   } finally {
	         sqlsession.close();
	   }
	}
	
  
  
  
  // 반품절차
  // 1. 먼저 return(환불) 테이블에 ordersNo정보 추가
  // 2. return테이블에 insert가 제대로 되었다면, detail_refund 컬럼 update(0->1)
  // ****반품이 아닌 주문취소시엔, return테이블 추가없이 바로 checkCancel 진행

  public int checkCancel(int ordersNo) {
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
	   return result;
  }
  
  public int makeRefundTable(RefundDTO refund) {
	   SqlSession sqlsession = getSqlSessionFactory().openSession();
	   int result = 0;
	   try {
		   result = sqlsession.insert(namespace + ".makeRefundTable", refund);
		   if (result != 0) {
				sqlsession.commit();
			}
	   } finally {
	         sqlsession.close();
	   }
	   return result;
	}
  
  public void checkRefund(int ordersNo) {
	   SqlSession sqlsession = getSqlSessionFactory().openSession();
	   int result = 0;
	   try {
	         result = sqlsession.update(namespace + ".checkRefund", ordersNo);
	         if (result != 0) {
					sqlsession.commit();
				}
	   } finally {
	         sqlsession.close();
	   }
 }
  
  
  
  
  
	// ADMIN

	public int countOrder() {
		sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectOne(namespace + ".countOrder");
		} finally {
			sqlsession.close();
		}
	}

	public List<OrdersDTO> getFullInfo(PagingVO vo) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(namespace + ".getFullInfo", vo);
		} finally {
			sqlSession.close();
		}
	}

	public OrdersDTO getOrderInfo(int orderNo) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne(namespace + ".getOrderInfo", orderNo);
		} finally {
			sqlSession.close();
		}
	}

	public void changeStatus(HashMap<String, Object> map) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlSession.update(namespace + ".changeStatus", map);
			if (result != 0) {
				sqlSession.commit();
			}
		} finally {
			sqlSession.close();
		}
	}

	public int countCancel() {
		sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectOne(namespace + ".countCancel");
		} finally {
			sqlsession.close();
		}
	}

	public List<OrdersDTO> getCancelInfo(PagingVO vo) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(namespace + ".getCancelInfo", vo);
		} finally {
			sqlSession.close();
		}
	}

	public List<OrdersDTO> memberOrderlist(String id) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(namespace + ".memberOrderlist", id);
		} finally {
			sqlSession.close();
		}
	}

	public int memberSum(String id) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne(namespace + ".memberSum", id);
		} finally {
			sqlSession.close();
		}
	}

	public Date memberLastest(String id) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne(namespace + ".memberLastest", id);
		} finally {
			sqlSession.close();
		}
	}

	public int countRefund() {
		sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectOne(namespace + ".countRefund");
		} finally {
			sqlsession.close();
		}
	}

	public List<RefundDTO> getRefundInfo(PagingVO vo) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(namespace + ".getRefundInfo", vo);
		} finally {
			sqlSession.close();
		}
	}

	public void refundStatus(HashMap<String, Object> map) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlSession.update(namespace + ".refundStatus", map);
			if (result != 0) {
				sqlSession.commit();
			}
		} finally {
			sqlSession.close();
		}
	}


}
