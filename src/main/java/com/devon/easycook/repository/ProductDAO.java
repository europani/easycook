package com.devon.easycook.repository;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devon.easycook.domain.ProductDTO;
import com.devon.easycook.domain.ReviewDTO;
import com.devon.easycook.util.PagingVO;

@Repository
public class ProductDAO extends AbstractMybatisDAO {
	
	HashMap<String, Object> map = new HashMap<String, Object>();
	
	
	@Autowired
	SqlSession sqlsession;
	private String namespace = "productMapper";
	
	//상품 검색
	public int getProductSearch(String sentence) throws Exception {
		sqlsession = getSqlSessionFactory().openSession();
		try {
			map.put("sentence", sentence);
			return sqlsession.selectOne(namespace + ".getProductSearch", map);
		} finally {
			sqlsession.close();
		}
	}
	
	//상품 검색 결과
	public List<ProductDTO> getProductSearchitem(String sentence) throws Exception {
		sqlsession = getSqlSessionFactory().openSession();
		map.clear();
		map.put("sentence", sentence);
		try {
			return sqlsession.selectList(namespace + ".getProductSearchitem", map);
		} finally {
			sqlsession.close();
		}
	}
	
	//상품 목록
	public List<ProductDTO> productList(String sort) {
		sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectList(namespace + ".productList", sort);
		} finally {
			sqlsession.close();
		}
	}
	
	//상품 상세
	public ProductDTO productDetail(int productNo) {
		sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectOne(namespace + ".productDetail", productNo);
		} finally {
			sqlsession.close();
		}
	}
	
	/*
	 * public void productUpdate(ProductDTO dto) { return }
	 * 
	 * public ProductDTO productDelete(int product_no) { return }
	 */






	public ReviewDTO reviewCal(int productNo) {
		sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectOne(namespace + ".reviewCal", productNo);
		} finally {
			sqlsession.close();
		}
	}
	
	public List<ReviewDTO> getReview(int productNo) {
		sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectList(namespace + ".getReview", productNo);
		} finally {
			sqlsession.close();
		}
	}

	public List<ProductDTO> getWeather(String weather) {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectList(namespace + ".getWeather", weather);
		} finally {
			sqlsession.close();
		}
	}
	
	// ADMIN
	public int countByCategory(String category) {
		sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectOne(namespace + ".countByCategory", category);
		} finally {
			sqlsession.close();
		}
	}

	public void insert(ProductDTO product) {
		sqlsession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlsession.insert(namespace + ".insertProduct", product);
			if (result != 0) {
				sqlsession.commit();
			}
		} finally {
			sqlsession.close();
		}
	}

	public int countMember() {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectOne(namespace + ".countProduct");
		} finally {
			sqlsession.close();
		}
	}
	
	public List<ProductDTO> getFullInfo(PagingVO vo) {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectList(namespace + ".getFullInfo", vo);
		} finally {
			sqlsession.close();
		}
	}

	public void modifyStock(Map<String, Integer> map) {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlsession.update(namespace + ".modifyStock", map);
			if (result != 0) {
				sqlsession.commit();
			}
		} finally {
			sqlsession.close();
		}
		
	}

	public void modify(ProductDTO product) {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlsession.update(namespace + ".modify", product);
			if (result != 0) {
				sqlsession.commit();
			}
		} finally {
			sqlsession.close();
		}
	}

	public void delete(int productNo) {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		int result = 0;
		try {
			result = sqlsession.update(namespace + ".delete", productNo);
			if (result != 0) {
				sqlsession.commit();
			}
		} finally {
			sqlsession.close();
		}
	}

	public ProductDTO getToday() {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectOne(namespace + ".getToday");
		} finally {
			sqlsession.close();
		}
	}

	public Date getDate() {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectOne(namespace + ".getDate");
		} finally {
			sqlsession.close();
		}
	}

	public int todayProNo() {
		SqlSession sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectOne(namespace + ".todayProNo");
		} finally {
			sqlsession.close();
		}
	}
}
