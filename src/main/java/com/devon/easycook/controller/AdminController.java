package com.devon.easycook.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.devon.easycook.domain.MemberDTO;
import com.devon.easycook.domain.ProductDTO;
import com.devon.easycook.service.MemberService;
import com.devon.easycook.service.ProductService;
import com.devon.easycook.util.PagingVO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	MemberService memberService;
	@Autowired
	ProductService productService;

	@GetMapping("")
	public String index() {
		return "admin/admin";
	}

	@GetMapping("/member")
	public String member(PagingVO vo, Model model, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) throws ParseException {
		int total = memberService.countNumber();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}

		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);

		List<MemberDTO> list = memberService.getFullInfo(vo);
		model.addAttribute("infoList", list);
		return "admin/member";
	}

	// 회원별 주문내역
	@GetMapping("/member/{id}")
	public String member(Model model, @PathVariable("id") String id) {

		return "";
	}

	@GetMapping("/product")
	public String product(PagingVO vo, Model model, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		int total = productService.countNumber();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}

		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);

		List<ProductDTO> list = productService.getFullInfo(vo);
		model.addAttribute("product", list);
		return "admin/product";
	}

	@GetMapping("/product/write")
	public String productWriteForm() {
		return "admin/productWrite";
	}

	@PostMapping("/product/write")
	public String productWrite(MultipartHttpServletRequest request, @ModelAttribute ProductDTO product) {
		MultipartFile file = request.getFile("file");
		if (!file.isEmpty()) {
			String filename = file.getOriginalFilename();
			String uploadFolder = "C:\\tmp";
			product.setProductImage(filename);
			
			File saveFile = new File(uploadFolder, filename);
			try {
				file.transferTo(saveFile);
				productService.insert(product);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "redirect:/admin/product";
	}

	@GetMapping("/product/write/count")
	@ResponseBody
	public int countByCategory(@RequestParam("category") String num) {
		return productService.countByCategory(num);
	}

	@GetMapping("/product/stock/{productNo}")
	public String modifyStock(Model model, @PathVariable("productNo") int productNo) {
		ProductDTO product = productService.productDetail(productNo);
		model.addAttribute("product", product);
		return "admin/productStock";
	}

	@GetMapping("/product/modify/{productNo}")
	public String productModify(Model model, @PathVariable("productNo") String productNo) {

		return "redirect:/admin/product";
	}

	@GetMapping("/product/delete/{productNo}")
	public String productDelete(Model model, @PathVariable("productNo") String productNo) {

		return "admin/productDelete";
	}

	@GetMapping("/orders")
	public String orders() {
		return "admin/orders";
	}

	@GetMapping("/board")
	public String board() {
		return "admin/board";
	}
}
