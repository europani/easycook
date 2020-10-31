package com.devon.easycook.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.devon.easycook.domain.ProductDTO;
import com.devon.easycook.domain.ReviewDTO;
import com.devon.easycook.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	ProductService productService;

	@GetMapping("")
	public String showAllProduct(Model model) {
		List<ProductDTO> list = productService.productList();
		model.addAttribute("list", list);
		return "product/product";
	}

	@GetMapping("/{productNo}")
	public String showDetailProduct(@PathVariable("productNo") int productNo, Model model) {
		ProductDTO detail = productService.productDetail(productNo);
		List<ReviewDTO> review = productService.getReview(productNo);
		ReviewDTO cal = productService.reviewCal(productNo);

		model.addAttribute("detail", detail);
		model.addAttribute("review", review);
		model.addAttribute("cal", cal);
		return "product/productDetail";
	}

	/*
	 * @GetMapping("/{category}") public String product(@PathVariable("categoty")
	 * String category, Model model) { ProductDTO cate =
	 * productService.productCategory(category); model.addAttribute("list", list);
	 * return "product"; }
	 */

}
