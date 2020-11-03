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
	      System.out.println(total);
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
	   
	      return "mypage/orders";
      
   }
   
	@GetMapping("ordersProduct/{ordersNo}")
	public String ordersDetail(@PathVariable("ordersNo") int ordersNo, Model model) {
		List<OrdersDTO> detail = mypageService.ordersDetail(ordersNo);

		int totalpay = detail.get(0).getOrdersTotal();
		int discountPercent = detail.get(0).getDiscountCoupon();
		model.addAttribute("detail", detail);
		model.addAttribute("totalpay", totalpay);
		model.addAttribute("discountPercent", discountPercent);
		model.addAttribute("orderNum", ordersNo);
		return "mypage/ordersDetail";
	}
   
   
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
	   List<OrdersDTO> orderListDate = mypageService.ordersSearch(dateMap);
	 	
	   
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
    
    

    // 구매시 할인쿠폰 사용여부 check
    int discountPercent = cancelRequireList.getDiscountCoupon();
    if (discountPercent != 0) {
    	int productPriceAfterDiscount = productPrice * (100-discountPercent)/100;
    	productPrice = productPriceAfterDiscount;
	}
    
    
      
      // 주문번호는 어차피 하나이니, 처음 list만 가져와도 ok
      
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
   
   
   @GetMapping("/wishlistAdd/{productNo}")
   public String wishlistAdd(@PathVariable("productNo") int productNo,
		   HttpServletRequest request) {
	   	  
	  HttpSession session = request.getSession(true);
	  MemberDTO member =(MemberDTO) session.getAttribute("member");
//	  if (member == null) { return "redirect:/member/login"; }
	  String id = member.getId();
	  
	  Map<String, Object> wishlistMap = new HashMap<String, Object>();
	  wishlistMap.put("id", id);
	  wishlistMap.put("productNo", productNo);
	  mypageService.wishlistInput(wishlistMap);
	  

      return "mypage/wishlistAddSuccess";
   }
   
   @GetMapping("/wishlist")
   public String wishlist(HttpServletRequest request ,Model model) {
	   	  
	  HttpSession session = request.getSession(true);
	  MemberDTO member =(MemberDTO) session.getAttribute("member");
//	  if (member == null) { return "redirect:/member/login"; }
	  String id = member.getId();
	  List<WishlistDTO> myWishlist = mypageService.wishlist(id);
	  myWishlist.get(0).getProductNo();
	  myWishlist.get(0).getProduct().getProductNo();
	  model.addAttribute("myWishlist", myWishlist);
      return "mypage/wishlist";
   }
   
   
   @GetMapping("/cancel")
   public String cancle(HttpServletRequest request, Model model) {
		  HttpSession session = request.getSession(true);
		  MemberDTO member =(MemberDTO) session.getAttribute("member");
//		  if (member == null) { return "redirect:/member/login"; }
		  String id = member.getId();
			       
	      
	      List<RefundDTO> refund = mypageService.refund(id);	      
	      model.addAttribute("refund", refund);      
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
	   List<RefundDTO> refundSearch = mypageService.refundSearch(dateMap);		   
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
	   List<UcouponDTO> couponSearch = mypageService.couponSearch(dateMap);			   
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