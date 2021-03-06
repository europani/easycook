package com.devon.easycook.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.devon.easycook.domain.CouponDTO;
import com.devon.easycook.domain.EventDTO;
import com.devon.easycook.domain.MemberDTO;
import com.devon.easycook.domain.NoticeDTO;
import com.devon.easycook.domain.OrdersDTO;
import com.devon.easycook.domain.ProductDTO;
import com.devon.easycook.domain.RefundDTO;
import com.devon.easycook.service.BoardService;
import com.devon.easycook.service.MemberService;
import com.devon.easycook.service.MypageService;
import com.devon.easycook.service.OrderService;
import com.devon.easycook.service.ProductService;
import com.devon.easycook.util.PagingVO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	MemberService memberService;
	@Autowired
	ProductService productService;
	@Autowired
	BoardService boardService;
	@Autowired
	OrderService orderService;
	@Autowired
	MypageService mypageService;
	

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
		List<OrdersDTO> list = orderService.memberOrderlist(id);
		int sum = orderService.memberSum(id);
		Date date = orderService.memberLastest(id);	
		
		model.addAttribute("list", list);
		model.addAttribute("id", id);
		model.addAttribute("sum", sum);
		model.addAttribute("date", date);
		return "admin/memberOrder";
	}
	
	@GetMapping("/member/delete")
	public String memberDelList(PagingVO vo, Model model, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		int total = memberService.countDelNumber();
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
		
		List<MemberDTO> list = memberService.getDelInfo(vo);
		model.addAttribute("infoList", list);
		
		return "admin/memberDelete";
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
			String uploadFolder = request.getServletContext().getRealPath("/resources/product");
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
	public String modifyStockForm(Model model, @PathVariable("productNo") int productNo) {
		ProductDTO product = productService.productDetail(productNo);
		model.addAttribute("product", product);
		return "admin/productStock";
	}

	@PostMapping("/product/stock/{productNo}")
	@ResponseBody
	public void modifyStock(Model model, @PathVariable("productNo") int productNo,
			@RequestParam(value = "productStock") int productStock) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("productNo", productNo);
		map.put("productStock", productStock);
		productService.modifyStock(map);
	}

	@GetMapping("/product/modify/{productNo}")
	public String productModifyForm(Model model, @PathVariable("productNo") int productNo) {
		ProductDTO product = productService.productDetail(productNo);
		model.addAttribute("product", product);
		return "admin/productModify";
	}

	@PostMapping("/product/modify/{productNo}")
	public String productModify(@PathVariable("productNo") int productNo, @ModelAttribute ProductDTO product,
			MultipartHttpServletRequest request) {
		product.setProductNo(productNo);
		MultipartFile file = request.getFile("file");
		if (!file.isEmpty()) {
			String filename = file.getOriginalFilename();
			String uploadFolder = request.getServletContext().getRealPath("/resources/product");
			product.setProductImage(filename);

			File saveFile = new File(uploadFolder, filename);
			try {
				file.transferTo(saveFile);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		productService.modify(product);
		return "redirect:/admin/product";
	}

	@GetMapping("/product/delete/{productNo}")
	public String productDeleteForm(Model model, @PathVariable("productNo") int productNo) {
		return "admin/productDelete";
	}
	
	@PostMapping("/product/delete/{productNo}")
	public String productDelete(@PathVariable("productNo") int productNo, @RequestParam("inputNo") int inputNo) {
		if (inputNo == productNo) {
			productService.delete(productNo);
		} 
		return "redirect:/admin/product";
		
	}

	@GetMapping("/orders")
	public String orders(PagingVO vo, Model model, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		int total = orderService.countOrder();
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

		List<OrdersDTO> list = orderService.getFullInfo(vo);
		model.addAttribute("orders", list);
		
		return "admin/orders";
	}
	
	@GetMapping("/orders/{orderNo}")
	public String ordersDetail(Model model, @PathVariable("orderNo") int orderNo) {
		List<OrdersDTO> order = mypageService.getOrder(orderNo);
		model.addAttribute("order", order);
		
		OrdersDTO orderInfo = orderService.getOrderInfo(orderNo);
		model.addAttribute("orderInfo", orderInfo);
		
		return "admin/orderDetail";
	}
	
	@PostMapping("/orders/{orderNo}")
	public String changeStatus(@PathVariable("orderNo") int orderNo, @RequestParam("status") String status) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("orderNo", orderNo);
		map.put("status", status);
		
		orderService.changeStatus(map);
		
		return "redirect:/admin/orders";
	}
	
	
	@GetMapping("/ordersCancel")
	public String ordersCancel(PagingVO vo, Model model, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		int total = orderService.countCancel();
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

		List<OrdersDTO> list = orderService.getCancelInfo(vo);
		model.addAttribute("orders", list);
		
		return "admin/orders";
	}
	
	@GetMapping("/refund")
	public String refund(PagingVO vo, Model model, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		int total = orderService.countRefund();
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

		List<RefundDTO> list = orderService.getRefundInfo(vo);
		model.addAttribute("refund", list);
		
		return "admin/refund";
	}
	
	@PostMapping("/refund/{orderNo}/{productNo}")
	public String refundStatus(@PathVariable("orderNo") int orderNo, @PathVariable("productNo") int productNo,
					@RequestParam("status") String status) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("orderNo", orderNo);
		map.put("productNo", productNo);
		map.put("status", status);
		
		orderService.refundStatus(map);
		
		return "redirect:/admin/refund";
	}
	

	@GetMapping("/notice")
	public String notice(PagingVO vo, Model model, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) throws Exception {
		int total = boardService.getArticleCount(null, null);
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

		List<NoticeDTO> list = boardService.getNoticeInfo(vo);
		model.addAttribute("notice", list);
		
		return "admin/notice";
	}
	
	@GetMapping("/notice/write")
	public String noticeWriteForm() {
		return "admin/noticeWrite";
	}
	@PostMapping("/notice/write")
	public String noticeWrite(MultipartHttpServletRequest request, @ModelAttribute NoticeDTO notice) {
		MultipartFile file = request.getFile("file");
		if (!file.isEmpty()) {
			String filename = file.getOriginalFilename();
			String uploadFolder = request.getServletContext().getRealPath("/resources/upload");
			notice.setNoticeFilename(filename);

			File saveFile = new File(uploadFolder, filename);
			try {
				file.transferTo(saveFile);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		boardService.noticeWrite(notice);
		
		return "redirect:/admin/notice";
	}
	
	@GetMapping("/notice/modify/{noticeNo}")
	public String noticeModifyForm(Model model, @PathVariable("noticeNo") int noticeNo) throws Exception {
		NoticeDTO notice = boardService.getArticle(noticeNo, false);
		model.addAttribute("notice", notice);
		
		return "admin/noticeModify";
	}
	
	@PostMapping("/notice/modify/{noticeNo}")
	public String noticeModify(@PathVariable("noticeNo") int noticeNo, @ModelAttribute NoticeDTO notice,
					MultipartHttpServletRequest request) {
		notice.setNoticeNo(noticeNo);
		
		MultipartFile file = request.getFile("file");
		if (!file.isEmpty()) {
			String filename = file.getOriginalFilename();
			String uploadFolder = request.getServletContext().getRealPath("/resources/upload");
			notice.setNoticeFilename(filename);

			File saveFile = new File(uploadFolder, filename);
			try {
				file.transferTo(saveFile);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		boardService.noticeModify(notice);
		
		return "redirect:/admin/notice";
	}
	
	@GetMapping("/notice/delete/{noticeNo}")
	public String noticeDeleteForm(Model model, @PathVariable("noticeNo") int noticeNo) {
		model.addAttribute("noticeNo", noticeNo);
		return "admin/noticeDelete";
	}
	
	@PostMapping("/notice/delete/{noticeNo}")
	@ResponseBody
	public void noticeDelete(@PathVariable("noticeNo") int noticeNo) {
		boardService.noticeDelete(noticeNo);
	}
	
	
	@GetMapping("/event")
	public String event(PagingVO vo, Model model, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) throws Exception {
		int total = boardService.countEvent();
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

		List<EventDTO> list = boardService.getEventInfo(vo);
		model.addAttribute("event", list);
		
		return "admin/event";
	}
	
	@GetMapping("/event/write")
	public String eventWriteForm(Model model) {
		List<Integer> couponNo = boardService.getCouponNo();
		
		model.addAttribute("couponNo", couponNo);
		return "admin/eventWrite";
	}
	
	@PostMapping("/event/write")
	public String eventWrite(MultipartHttpServletRequest request, @ModelAttribute EventDTO event) {
		MultipartFile file = request.getFile("file");
		if (!file.isEmpty()) {
			String filename = file.getOriginalFilename();
			String uploadFolder = request.getServletContext().getRealPath("/resources/upload");
			event.setEventImage(filename);

			File saveFile = new File(uploadFolder, filename);
			try {
				file.transferTo(saveFile);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		boardService.eventWrite(event);
		
		return "redirect:/admin/event";
	}
	
	
	@GetMapping("/event/modify/{eventNo}")
	public String eventModifyForm(Model model, @PathVariable("eventNo") int eventNo) throws Exception {
		EventDTO event = boardService.getEvent(eventNo);
		model.addAttribute("event", event);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String start = sdf.format(event.getEventStartdate());
		String end = sdf.format(event.getEventEnddate());
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		
		return "admin/eventModify";
	}
	
	@PostMapping("/event/modify/{eventNo}")
	public String eventModify(@PathVariable("eventNo") int eventNo, @ModelAttribute EventDTO event,
					MultipartHttpServletRequest request) {
		event.setEventNo(eventNo);
		
		MultipartFile file = request.getFile("file");
		if (!file.isEmpty()) {
			String filename = file.getOriginalFilename();
			String uploadFolder = request.getServletContext().getRealPath("/resources/upload");
			event.setEventImage(filename);

			File saveFile = new File(uploadFolder, filename);
			try {
				file.transferTo(saveFile);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		boardService.eventModify(event);
		
		return "redirect:/admin/event";
	}
	
	@GetMapping("/event/delete/{eventNo}")
	public String eventDeleteForm(Model model, @PathVariable("eventNo") int eventNo) {
		model.addAttribute("eventNo", eventNo);
		return "admin/eventDelete";
	}
	
	@PostMapping("/event/delete/{eventNo}")
	@ResponseBody
	public void eventDelete(@PathVariable("eventNo") int eventNo) {
		boardService.eventDelete(eventNo);
	}
	
	
	
	@GetMapping("/coupon")
	public String coupon(Model model) throws Exception {
		List<CouponDTO> list = boardService.getCouponList();
		model.addAttribute("coupon", list);
		
		return "admin/coupon";
	}
	
	@GetMapping("/coupon/write")
	public String couponWriteForm(Model model) {
		return "admin/couponWrite";
	}
	
	@PostMapping("/coupon/write")
	public String couponWrite(@ModelAttribute CouponDTO coupon) {
		boardService.couponWrite(coupon);
		
		return "redirect:/admin/coupon";
	}
	
	
	@GetMapping("/coupon/modify/{couponNo}")
	public String couponModifyForm(Model model, @PathVariable("couponNo") int couponNo) {
		CouponDTO coupon = boardService.getCoupon(couponNo);
		model.addAttribute("coupon", coupon);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String start = sdf.format(coupon.getCouponSdate());
		String end = sdf.format(coupon.getCouponEdate());
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		
		return "admin/couponModify";
	}
	
	@PostMapping("/coupon/modify/{couponNo}")
	public String couponModify(@PathVariable("couponNo") int couponNo, @ModelAttribute CouponDTO coupon) {
		coupon.setCouponNo(couponNo);
		boardService.couponModify(coupon);
		
		return "redirect:/admin/coupon";
	}
	
	@GetMapping("/coupon/delete/{couponNo}")
	public String couponDeleteForm(Model model, @PathVariable("couponNo") int couponNo) {
		model.addAttribute("couponNo", couponNo);
		return "admin/couponDelete";
	}
	
	@PostMapping("/coupon/delete/{couponNo}")
	@ResponseBody
	public void couponDelete(@PathVariable("couponNo") int couponNo) {
		boardService.couponDelete(couponNo);
	}
}
