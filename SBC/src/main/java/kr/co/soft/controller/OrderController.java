package kr.co.soft.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.WebUtils;

import kr.co.soft.bean.CartBean;
import kr.co.soft.bean.OrderDetailBean;
import kr.co.soft.bean.OrderDetailListBean;
import kr.co.soft.bean.OrderListBean;
import kr.co.soft.bean.UserBean;
import kr.co.soft.service.CartService;
import kr.co.soft.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	CartService cartService;
	
	@Autowired
	OrderService orderService;
	
	@Resource(name="loginUserBean")
	UserBean loginUserBean;
	
	@PostMapping("/orderform")
	public String order(OrderDetailListBean orderDetailList,
						Model model) {

		//받아서 
		List<OrderDetailBean> list = new ArrayList<>();
		for(OrderDetailBean order : orderDetailList.getOrderDetailList()) {
			if(order.getProduct_id()!=null) {
				list.add(order);
			} 
				
		}

		//넘기기
		model.addAttribute("list", list);
	
		return "/order/orderform";
	}
	
	//결제 성공 후 주문정보 저장하기
	@PostMapping("/orderComplete")
	public String orderComplete(HttpServletRequest request, HttpServletResponse response, 
								OrderDetailListBean orderDetailList,
								OrderListBean orderList,
								Model model) {
		
		Cookie cookie = WebUtils.getCookie(request, "cartCookie");
		String member_id = null;
		
		if(cookie != null && loginUserBean.isUserLogin() == false) 
			member_id = cookie.getValue();
		else if(loginUserBean.isUserLogin() == true) 
			member_id = loginUserBean.getUser_id();
		orderList.setMember_id(member_id);
		
		
		orderService.insertOrder(orderList);
		
		String merchant_uid = orderList.getMerchant_uid();
		
		//받아서 DB에 저장 
		List<OrderDetailBean> list = new ArrayList<>();
		for(OrderDetailBean order : orderDetailList.getOrderDetailList()) {
			order.setMerchant_uid(merchant_uid);
			orderService.insertOrderList(order);
			
			//주문한 제품은 장바구니에서 제외 
			CartBean cart = new CartBean();
			cart.setMember_id(member_id);
			cart.setProduct_id(order.getProduct_id());
			orderService.deleteCartList(cart);
		}
		
		model.addAttribute("merchant_uid", merchant_uid);

		return "/order/orderComplete";
	}


}

