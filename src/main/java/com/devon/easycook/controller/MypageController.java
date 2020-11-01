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
import com.devon.easycook.domain.ReviewDTO;
import com.devon.easycook.domain.WishlistDTO;
import com.devon.easycook.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
   
   @Autowired
   MypageService mypageService;
   
   Map<String, String> dateMap = new HashMap<String, String>();
   
   @GetMapping("/orders")
   public String orders(Model model, HttpServletRequest request) {   

	  HttpSession session = request.getSession(true);
	  MemberDTO member =(MemberDTO) session.getAttribute("member");
	  String id = member.getId();
		       
      
      List<OrdersDTO> orderList = mypageService.orders(id);
      
      model.addAttribute("orderList", orderList);
   
      return "mypage/orders";
      
   }
   
	@GetMapping("ordersProduct/{ordersNo}")
	public String ordersDetail(@PathVariable("ordersNo") int ordersNo, Model model) {
		List<OrdersDTO> detail = mypageService.ordersDetail(ordersNo);

		int totalpay = detail.get(0).getOrdersTotal();
		model.addAttribute("detail", detail);
		model.addAttribute("totalpay", totalpay);
		model.addAttribute("orderNum", ordersNo);
		return "mypage/ordersDetail";
	}
   
   
   @RequestMapping(value = "/ordersDaySearch.action", method = RequestMethod.POST)
   public ModelAndView ordersDaySearch(HttpServletRequest request,
		   String fromDate, String toDate, ModelAndView mv) {
	   
	   // ModelAndView 초기화 ㄱㄱ
	   mv.clear();

	   
	   // 나중에 session으로 id 받을것
	   HttpSession session = request.getSession(true);
	   MemberDTO member =(MemberDTO) session.getAttribute("member");
	   String id = member.getId();
	   
	   dateMap.clear();
	   dateMap.put("id", id);
	   dateMap.put("fromDate", fromDate);
	   dateMap.put("toDate", toDate);
	   List<OrdersDTO> orderListDate = mypageService.ordersDate(dateMap);
	 	
	   
	   mv.addObject("orderListDate", orderListDate);
	   mv.setViewName("common/ordersDaySearch");
	   return mv;	   
   }
      
   // 처음 반품창
   @RequestMapping("/cancelRequire")
   public String cancelRequire(@RequestParam("productNo") int productNo,
		   @RequestParam("ordersNo") int ordersNo,
		   HttpServletRequest request ,Model model) {
	
	HttpSession session = request.getSession(true);
	MemberDTO member =(MemberDTO) session.getAttribute("member");
	String id = member.getId(); 


    
	Map<String, Object> refundCheckMap = new HashMap<String, Object>();
	refundCheckMap.put("productNo", productNo);
	refundCheckMap.put("ordersNo", ordersNo);

    OrdersDTO cancelRequireList = mypageService.cancelRequire(refundCheckMap);
    int productPrice = cancelRequireList.getProduct().getProductPrice();
    System.out.println("할인쿠폰 check전" + productPrice);
    // 구매시 할인쿠폰 사용여부 check
    int discountPercent = cancelRequireList.getDiscountPercent();
    if (discountPercent != 0) {
    	int productPriceAfterDiscount = productPrice * (100-discountPercent)/100;
    	productPrice = productPriceAfterDiscount;
    	System.out.println("할인쿠폰 check후" + productPrice);
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
	  String id = member.getId();
	  
	  Map<String, Object> wishlistMap = new HashMap<String, Object>();
	  wishlistMap.put("id", id);
	  wishlistMap.put("productNo", productNo);
	  System.out.println("wishlistMap" + wishlistMap);
	  mypageService.wishlistInput(wishlistMap);
	  

      return "mypage/wishlistAddSuccess";
   }
   
   @GetMapping("/wishlist")
   public String wishlist(HttpServletRequest request ,Model model) {
	   	  
	  HttpSession session = request.getSession(true);
	  MemberDTO member =(MemberDTO) session.getAttribute("member");
	  String id = member.getId();
	  List<WishlistDTO> myWishlist = mypageService.wishlist(id);
	  myWishlist.get(0).getProductNo();
	  myWishlist.get(0).getProduct().getProductNo();
	  System.out.println("wishlist ok:" + myWishlist);
	  model.addAttribute("myWishlist", myWishlist);
      return "mypage/wishlist";
   }
   
   
   @GetMapping("/cancel")
   public String cancle() {
      return "mypage/cancel";
   }
   
   
   @GetMapping("/coupon")
   public String coupon(HttpServletRequest request, Model model) {

      
      HttpSession session = request.getSession(true);
	  MemberDTO member =(MemberDTO) session.getAttribute("member");
	  String id = member.getId(); 
      
      
      List<CouponDTO> couponList = mypageService.coupon(id);
      int couponCount = mypageService.couponCount(id);
      int myPoint = mypageService.myPoint(id);
      
      System.out.println(couponList);
      
      model.addAttribute("id", id);
      model.addAttribute("couponList", couponList);   
      model.addAttribute("couponCount", couponCount);
      model.addAttribute("myPoint", myPoint);
      return "mypage/coupon";
   }
   
/*   @RequestMapping(value = "/couponDaySearch.action", method = RequestMethod.POST)
   public ModelAndView couponDaySearch(String fromDate, String toDate, ModelAndView mv) {
	   
	   // ModelAndView 초기화 ㄱㄱ
	   mv.clear();
	   System.out.println("couponDaySearch 실행");
	   System.out.println(fromDate);
	   System.out.println(toDate);
	   
	   // 나중에 session으로 id 받을것
	   String id = "haram511";
	   
	   dateMap.clear();
	   dateMap.put("id", id);
	   dateMap.put("fromDate", fromDate);
	   dateMap.put("toDate", toDate);
	   List<CouponDTO> couponListDate = mypageService.couponDate(dateMap);
	 			   
	   mv.addObject("couponListDate", couponListDate);
	   mv.setViewName("common/couponDaySearch");
	   return mv;	   
   }*/
   












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