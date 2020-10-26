package com.devon.easycook.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devon.easycook.domain.ProductDTO;

@Repository
public class ProductDAO extends AbstractMybatisDAO {
	
	
	@Autowired
	SqlSession sqlsession;
	private String namespace = "productMapper";
	
	public List<ProductDTO> productList() {
		sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectList((namespace + ".productList"));
		} finally {
			sqlsession.close();
		}
	}
	
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









	public int countByCategory(String category) {
		sqlsession = getSqlSessionFactory().openSession();
		try {
			return sqlsession.selectOne(namespace + ".countByCategory", category);
		} finally {
			sqlsession.close();
		}
	}

}
