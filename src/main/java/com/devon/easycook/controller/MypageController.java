package com.devon.easycook.controller;

import java.io.File;
import java.io.IOException;
import java.io.Console;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.devon.easycook.domain.CouponDTO;
import com.devon.easycook.domain.MemberDTO;
import com.devon.easycook.domain.OrdersDTO;
import com.devon.easycook.domain.ProductDTO;
import com.devon.easycook.domain.RefundDTO;
import com.devon.easycook.domain.ReviewDTO;
import com.devon.easycook.domain.UcouponDTO;
import com.devon.easycook.domain.WishlistDTO;
import com.devon.easycook.service.MypageService;
import com.devon.easycook.service.OrderService;
import com.devon.easycook.util.PagingVO;

@Controller
@RequestMapping("/mypage")
public class MypageController {
   
   @Autowired
   MypageService mypageService;
   
   @Autowired
   OrderService orderService;
   
   // 각 마이페이지별 날짜계산용 map
   Map<String, Object> dateMap = new HashMap<String, Object>();
   
   
   
   @GetMapping("/orders")
   public String orders(PagingVO vo,  Model model, HttpServletRequest request,
		   @RequestParam(value = "nowPage", required = false) String nowPage,
		   @RequestParam(value = "cntPerPage", required = false) String cntPerPage) {   

	   	  Map<String, Object> map = new HashMap<String, Object>();
	   
		  HttpSession session = request.getSession(true);
		  MemberDTO member =(MemberDTO) session.getAttribute("member");
	//	  if (member == null) { return "redirect:/member/login"; }
		  String id = member.getId();
		
		  
	      int total = mypageService.countUserOrder(id);
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
		  int start = vo.getStart();	map.put("start", start);
		  int end = vo.getEnd();	 map.put("end", end);
		  map.put("id", id);       
		  
		  
	      List<OrdersDTO> orderList = mypageService.orders(map);	    			
		  model.addAttribute("orderList", orderList);
		  model.addAttribute("id", id);
		  
	      return "mypage/orders";
      
   }
   
	@GetMapping("ordersProduct/{ordersNo}")
	public String ordersDetail(@PathVariable("ordersNo") int ordersNo, Model model) {
		List<OrdersDTO> detail = mypageService.ordersDetail(ordersNo);

		
		// 이세개는 0번째부터 끝까지 다 같은값이다!
		int totalpay = detail.get(0).getOrdersTotal();
		int discountCoupon = detail.get(0).getDiscountCoupon();
		int discountPoint = detail.get(0).getDiscountPoint();
		
		
		model.addAttribute("detail", detail);
		model.addAttribute("totalpay", totalpay);
		model.addAttribute("discountCoupon", discountCoupon);
		model.addAttribute("discountPoint", discountPoint);
		model.addAttribute("orderNum", ordersNo);
		return "mypage/ordersDetail";
	}
   
   // 주문목록 날짜따라출력
   @RequestMapping(value = "/ordersSearch.action", method = RequestMethod.POST)
   public ModelAndView ordersSearch(HttpServletRequest request,
		   String fromDate, String toDate, ModelAndView mv) {
	   
	   // ModelAndView 초기화 ㄱㄱ
	   mv.clear();

	   // 나중에 session으로 id 받을것
	   HttpSession session = request.getSession(true);
	   MemberDTO member =(MemberDTO) session.getAttribute("member");
//	   if (member == null) { return "redirect:/member/login"; }
	   String id = member.getId();
	   
	   dateMap.clear();
	   dateMap.put("id", id);
	   dateMap.put("fromDate", fromDate);
	   dateMap.put("toDate", toDate);
	   List<OrdersDTO> orderListDate = mypageService.ordersDaySearch(dateMap);
	 	
	   
	   mv.addObject("orderListDate", orderListDate);
	   mv.setViewName("common/ordersSearch");
	   return mv;	   
	   
   }
   
   
   // 처음 반품창
   @RequestMapping("/cancelRequire")
   public String cancelRequire(@RequestParam("productNo") int productNo,
		   @RequestParam("ordersNo") int ordersNo,
		   HttpServletRequest request ,Model model) {
	
	HttpSession session = request.getSession(true);
	MemberDTO member =(MemberDTO) session.getAttribute("member");
//	if (member == null) { return "redirect:/member/login"; }
	String id = member.getId(); 


    
	Map<String, Object> refundCheckMap = new HashMap<String, Object>();
	refundCheckMap.put("productNo", productNo);
	refundCheckMap.put("ordersNo", ordersNo);

    OrdersDTO cancelRequireList = mypageService.cancelRequire(refundCheckMap);
    
    
    int productPrice = cancelRequireList.getProduct().getProductPrice();
    // 구매시 할인쿠폰 or 적립금 사용여부 check
    int discountCoupon = cancelRequireList.getDiscountCoupon();
    int discountPoint = cancelRequireList.getDiscountPoint();
    // 둘중하나만 적용될것
    if (discountCoupon != 0) {
    	int priceAfterDiscount = productPrice * (100-discountCoupon)/100;
    	productPrice = priceAfterDiscount;
	}
    if (discountPoint != 0) {
    	int pointPerOrders = discountPoint/mypageService.orderPerProduct(ordersNo);
    	int priceAfterDiscount = productPrice - pointPerOrders;
    	productPrice = priceAfterDiscount;
	}
    
    
      
      // 주문번호는 어차피 하나이니, 처음 list만 가져와도 ok
      
    //  model.addAttribute("checkRefund", checkRefund);
      model.addAttribute("productNum", productNo);
      model.addAttribute("orderNum", ordersNo);
      model.addAttribute("productPrice", productPrice);
      model.addAttribute("cancelRequire", cancelRequireList);
      return "mypage/cancelRequire";
   }
     
   
   	// 주문취소 경고창  
	@GetMapping("returnOrderQuestion/{ordersNo}")
	public String returnOrderQuestion(@PathVariable("ordersNo") int ordersNo, Model model) {
		model.addAttribute("ordersNo", ordersNo);
		return "mypage/returnOrder";
	}
   
   
	// 위시리스트 추가, 목록보기, 삭제창
	@GetMapping("/wishlistAddRequire/{productName}/{productNo}")
	public String wishlistAddRequire(@PathVariable("productName") String productName,
			@PathVariable("productNo") String productNo, Model model) {
		model.addAttribute("productName", productName);
		model.addAttribute("productNo", productNo);
		return "mypage/wishlistAddRequire";
	}
	
	
   @PostMapping("/wishlistAdd/{productNo}")
   public String wishlistAdd(@PathVariable("productNo") int productNo, HttpServletRequest request) {
	   	  
	  HttpSession session = request.getSession(true);
	  MemberDTO member =(MemberDTO) session.getAttribute("member");
//	  if (member == null) { return "redirect:/member/login"; }
	  String id = member.getId();
	  
	  Map<String, Object> wishlistMap = new HashMap<String, Object>();
	  wishlistMap.put("id", id);
	  wishlistMap.put("productNo", productNo);
	  mypageService.wishlistInput(wishlistMap);
	  

      return "mypage/wishlistAddRequire";
   }
   
   @GetMapping("/wishlist")
   public String wishlist(HttpServletRequest request ,Model model) {
	   	  
	  HttpSession session = request.getSession(true);
	  MemberDTO member =(MemberDTO) session.getAttribute("member");
//	  if (member == null) { return "redirect:/member/login"; }
	  String id = member.getId();
	  List<WishlistDTO> myWishlist = mypageService.wishlist(id);
	  model.addAttribute("myWishlist", myWishlist);
      return "mypage/wishlist";
   }
   
	@RequestMapping("/wishlist/delete")
	public String delete(@RequestParam int productNo) {
		mypageService.wishlistDelete(productNo);
		return "redirect:/mypage/wishlist";
	}
   
   
   @GetMapping("/cancel")
   public String cancle(HttpServletRequest request, Model model) {
		  HttpSession session = request.getSession(true);
		  MemberDTO member =(MemberDTO) session.getAttribute("member");
//		  if (member == null) { return "redirect:/member/login"; }
		  String id = member.getId();
			       
	      
	      List<RefundDTO> refund = mypageService.refund(id);	      
	      model.addAttribute("refund", refund);
	      model.addAttribute("id", id);
	      return "mypage/cancel";
   }
   
   @RequestMapping(value = "/refundSearch.action", method = RequestMethod.POST)
   public ModelAndView refundDaySearch(
		   HttpServletRequest request,String fromDate, String toDate, ModelAndView mv) {
	   
	   // ModelAndView 초기화 ㄱㄱ
	   mv.clear();
	   

		HttpSession session = request.getSession(true);
		MemberDTO member =(MemberDTO) session.getAttribute("member");
	//	if (member == null) { return "redirect:/member/login"; }
		String id = member.getId();
	   
	   dateMap.clear();
	   dateMap.put("id", id);
	   dateMap.put("fromDate", fromDate);
	   dateMap.put("toDate", toDate);
	   List<RefundDTO> refundSearch = mypageService.refundDaySearch(dateMap);		   
	   mv.addObject("refundSearch", refundSearch);
	   mv.setViewName("common/cancelSearch");
	   return mv;	   
   }
   
   
   
   
   
   @GetMapping("/coupon")
   public String coupon(HttpServletRequest request, Model model) {

      
      HttpSession session = request.getSession(true);
	  MemberDTO member =(MemberDTO) session.getAttribute("member");
//	  if (member == null) { return "redirect:/member/login"; }
	  String id = member.getId(); 
      
      
      List<UcouponDTO> couponList = mypageService.coupon(id);
      int couponCount = mypageService.couponCount(id);
      int myPoint = mypageService.myPoint(id);
      

      
      model.addAttribute("id", id);
      model.addAttribute("couponList", couponList);   
      model.addAttribute("couponCount", couponCount);
      model.addAttribute("myPoint", myPoint);
      return "mypage/coupon";
   }
   
   @RequestMapping(value = "/couponSearch.action", method = RequestMethod.POST)
   public ModelAndView couponSearch(
		   HttpServletRequest request,String fromDate, String toDate, ModelAndView mv) {
	   
	   // ModelAndView 초기화 ㄱㄱ
	   mv.clear();	   
	   HttpSession session = request.getSession(true);
	   MemberDTO member =(MemberDTO) session.getAttribute("member");
//	   if (member == null) { return "redirect:/member/login"; }
	   String id = member.getId(); 
	   
	   dateMap.clear();	
	   dateMap.put("id", id);
	   dateMap.put("fromDate", fromDate);
	   dateMap.put("toDate", toDate);
	   List<UcouponDTO> couponSearch = mypageService.couponDaySearch(dateMap);			   
	   mv.addObject("couponListDate", couponSearch);
	   mv.setViewName("common/couponSearch");
	   return mv;	   
   }
   












   @GetMapping("/review")
   public String reviewForm(@RequestParam("productNo") int productNo, @RequestParam("ordersNo") int ordersNo, Model model) {
	   model.addAttribute("productNo", productNo);
	   model.addAttribute("ordersNo", ordersNo);
	   return "mypage/review";
   }

   @PostMapping("/review")
   public String review(MultipartHttpServletRequest request, @ModelAttribute ReviewDTO review) {
	   MultipartFile file = request.getFile("file");
		if (!file.isEmpty()) {
			String filename = file.getOriginalFilename();
			String uploadFolder = request.getServletContext().getRealPath("/resources/images");
			review.setReviewImage(filename);

			File saveFile = new File(uploadFolder, filename);
			try {
				file.transferTo(saveFile);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	   HttpSession session = request.getSession();
	   MemberDTO member = (MemberDTO) session.getAttribute("member");
	   String id = member.getId();
	   review.setId(id);
	   System.out.println(review.getOrdersNo());
	   mypageService.writeReview(review);
	   
	   return "redirect:/mypage/orders";
   }

}