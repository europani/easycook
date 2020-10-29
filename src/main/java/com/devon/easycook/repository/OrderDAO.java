package com.devon.easycook.repository;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devon.easycook.domain.CartDTO;
import com.devon.easycook.domain.OrdersDTO;
import com.devon.easycook.domain.OrdersDetailDTO;
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
	public List<CartDTO> cartList(String Id) {
		sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectList(namespace + ".cartList", Id);
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
	 * // 4. 장바구니 삭제하기 public void cartDelete(int cartNo) { sqlsession =
	 * getSqlSessionFactory().openSession(); int result = 0; try { result =
	 * sqlsession.delete(namespace + ".cartDelete", cartNo);
	 * 
	 * if(result != 0) { sqlsession.commit(); } } finally { sqlsession.close(); } }
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

	public List<OrdersDetailDTO> getOrder(int orderNo) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(namespace + ".getOrder", orderNo);
		} finally {
			sqlSession.close();
		}
	}

	public Timestamp getOrderDate(int orderNo) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne(namespace + ".getOrderDate", orderNo);
		} finally {
			sqlSession.close();
		}
	}


}
