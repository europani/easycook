package com.devon.easycook.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.devon.easycook.domain.ProductDTO;
import com.devon.easycook.domain.ReviewDTO;
import com.devon.easycook.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	public String sentence = "";
	public String remoteId = "";
	
	
	public ModelAndView mv = new ModelAndView();

	@Autowired
	ProductService productService;
	
	@ModelAttribute
	public void headProcess(HttpServletRequest request, HttpServletResponse res) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		remoteId = request.getRemoteAddr();
		if(request.getParameter("sentence") != null) {
			session.setAttribute("sentence", request.getParameter("sentence"));
		}
		sentence = (String) session.getAttribute("sentence");
	}
	
	@PostMapping("")
	public ModelAndView list(@RequestParam("sentence") String sentence) throws Exception {
		List productSearchList = null;
		
		int count = productService.getProductSearch(sentence);
		if (count > 0) {
			try {
				productSearchList = productService.getProductSearchitem(sentence);
			} catch (NullPointerException e) {
				e.printStackTrace();
			}
		}
		
		mv.clear();
		mv.addObject("list", productSearchList);
		mv.addObject("isSearch", 1);
		mv.setViewName("product/product");
		
		return mv;
	}

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
