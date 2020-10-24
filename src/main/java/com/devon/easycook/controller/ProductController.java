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
	public String showDetailProduct(Model model, @PathVariable("productNo") int productNo) {
		ProductDTO detail = productService.productDetail(productNo);
		model.addAttribute("detail", detail);
		return "product/productDetail";
	}
	
	/*
	 * @GetMapping("/{category}") public String product(Model model, @PathVariable
	 * String category) { List<ProductDTO> list = productService.productList();
	 * model.addAttribute("list", list); return "product"; }
	 * 
	 * 
	 * @RequestMapping("/detail/{product_no}") public ModelAndView
	 * detail(@RequestParam("product_no") int product_no, ModelAndView mv) {
	 * mv.setViewName("detail"); mv.addObject("detail",
	 * productService.productDetail(product_no)); return mv; }
	 */
	/*
	 * // 상품 상세보기
	 * 
	 * @GetMapping("/detail") public String detail() { return "detail"; }
	 * 
	 * @PostMapping("/detail/{product_no}") public ModelAndView
	 * detail(@RequestParam("product_no") int product_no, ModelAndView mv) {
	 * //mv.setViewName(viewName); mv.addObject("list",
	 * productService.productDetail(product_no)); return mv; }
	 */

}
