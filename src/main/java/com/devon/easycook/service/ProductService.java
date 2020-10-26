package com.devon.easycook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devon.easycook.domain.ProductDTO;
import com.devon.easycook.repository.ProductDAO;

@Service
public class ProductService {

	@Autowired
	private ProductDAO productDao;
	
	// 상품목록
	public List<ProductDTO> productList() {
		return productDao.productList();
	}
	// 상품상세
	public ProductDTO productDetail(int productNo) {
		return productDao.productDetail(productNo);
	}
	
	/*상품 수정 및 삭제
	 * public void productUpdate(ProductDTO dto) { return }
	 * 
	 * public ProductDTO productDelete(int product_no) { return }
	 */
	








	// ADMIN
	public int countByCategory(String category) {
		return productDao.countByCategory(category);
	}

}
