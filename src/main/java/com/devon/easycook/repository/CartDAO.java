package com.devon.easycook.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devon.easycook.domain.CartDTO;

@Repository
public class CartDAO extends AbstractMybatisDAO {
	
	
	@Autowired
	SqlSession sqlsession;
	
	private String namespace = "cartMapper";

	// 1. 장바구니에 추가하기
	public void cartInsert(CartDTO cart) {
		sqlsession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlsession.insert(namespace + ".cartInsert", cart);
			if(result != 0) {
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

	// 3. 장바구니 수정하기 - 수량덮어쓰기
	public void cartModify(CartDTO cart) {
		sqlsession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlsession.update(namespace + ".cartModify", cart);
			if(result != 0) {
				sqlsession.commit();
			}
		} finally {
			sqlsession.close();
		}
	}	
	
	// 4. 장바구니 삭제하기
	public void cartDelete(int cartNo) {
		sqlsession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlsession.delete(namespace + ".cartDelete", cartNo);
			
			  if(result != 0) {
				  sqlsession.commit(); 
				  }
			 } 
		finally {
			sqlsession.close();
		}
	}
	
	
	// 5. 장바구니 합계구하기
	public int sumTotal(String Id) {
		sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectOne(namespace + ".sumTotal", Id);
		} finally {
			sqlsession.close();
		}
	}
	
	// 6. 장바구니 동일 상품 확인
	public int cartCount(int productNo, String Id) {
		sqlsession = getSqlSessionFactory().openSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productNo", productNo);
		map.put("Id", Id);
		try {
			return sqlsession.selectOne(namespace + ".cartCount", map);
		} finally {
			sqlsession.close();
		}
	}	
	
	// 7. 장바구니에 같은상품있으면 수량합산
	public void cartUpdate(CartDTO cart) {
		sqlsession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlsession.update(namespace + ".sumTotal", cart);
			if(result != 0) {
				sqlsession.commit();
			}
		} finally {
			sqlsession.close();
		}
	}	
		
}
	

