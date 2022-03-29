package kr.co.soft.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import kr.co.soft.bean.CartBean;
import kr.co.soft.bean.CartDetailListBean;
import kr.co.soft.bean.CartListBean;
import kr.co.soft.bean.ProductBean;
import kr.co.soft.bean.UserBean;
import kr.co.soft.service.CartService;
import kr.co.soft.service.ProductService;


@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CartService cartService;
	
	@Resource(name="loginUserBean")
	UserBean loginUserBean;
	
	@GetMapping("/main")
	public String product(HttpServletRequest request, HttpServletResponse response,
							Model model){
		
		//제품 목록
		List<ProductBean> productList = productService.getProductList();
		model.addAttribute("productList", productList);
		
		Cookie cookie = WebUtils.getCookie(request, "cartCookie");
		String member_id = null;
		
		//비회원 쿠키 생성
		if(cookie == null && loginUserBean.isUserLogin() == false) {
					
		member_id = RandomStringUtils.random(6, true, true);
	    Cookie cartCookie = new Cookie("cartCookie", member_id);
	    cartCookie.setPath("/");	//path로 지정한 곳에서 쿠키 데이터르 읽을 수 있음.
	    cartCookie.setMaxAge(60 * 60 * 24 * 1);	//기간을 하루로 지정(60초 * 60분 * 24시간)
	    response.addCookie(cartCookie);
	    
		} else if(cookie != null && loginUserBean.isUserLogin() == false) {
			
			//쿠키 시간 재설정해주기
		    cookie.setPath("/");
		    cookie.setMaxAge(60 * 60 * 24 * 1);
		    response.addCookie(cookie);
		    member_id = cookie.getValue();
		     
		    //회원 아이디 빈에 입력  
		} else if(loginUserBean.isUserLogin() == true) {
			member_id = loginUserBean.getUser_id();	
		} 
		
		//장바구니 수량 표시
		Integer cntCart = cartService.countCart(member_id);
		
		//null처리
		if(cntCart==null)
			cntCart=0;
		
		model.addAttribute("cntCart", cntCart);
		
		return "product/main";
	}
	
	@PostMapping("/productPage")
	public String productPage(HttpServletRequest request, HttpServletResponse response,
								@RequestParam("product_name") String product_name, Model model) {

		//제품 목록
		List<ProductBean> productList = productService.getSelectedProducts(product_name);
		model.addAttribute("productList", productList);
		
		//대표 사진 아이디
		ProductBean repProduct = productService.getRepProduct(product_name);
		model.addAttribute("repProduct", repProduct);
		
		Cookie cookie = WebUtils.getCookie(request, "cartCookie");
		String member_id = null;
		
		if(cookie != null && loginUserBean.isUserLogin() == false) {
			
			//쿠키 시간 재설정해주기
		    cookie.setPath("/");
		    cookie.setMaxAge(60 * 60 * 24 * 1);
		    response.addCookie(cookie);
		    member_id = cookie.getValue();
		     
		    //회원 아이디 빈에 입력  
		} else if(loginUserBean.isUserLogin() == true) {
			member_id = loginUserBean.getUser_id();	
		}
		
		//장바구니 수량 표시
		Integer cntCart = cartService.countCart(member_id);
		
		//null처리
		if(cntCart==null)
			cntCart=0;
		
		model.addAttribute("cntCart", cntCart);
		
		return "product/productPage";
	}

	@ResponseBody
	@PostMapping("/addCart")
	public int addCart(HttpServletRequest request, HttpServletResponse response,
						@ModelAttribute("cartList") CartDetailListBean cartList) throws Exception{
		
		Cookie cookie = WebUtils.getCookie(request, "cartCookie");
		String member_id = null;
		    
		if(cookie != null && loginUserBean.isUserLogin() == false) {
			
			//쿠키 시간 재설정해주기
		    cookie.setPath("/");
		    cookie.setMaxAge(60 * 60 * 24 * 1);
		    response.addCookie(cookie);
		    member_id = cookie.getValue();
		     
		    //회원 아이디 빈에 입력  
		} else if(loginUserBean.isUserLogin() == true) {
			member_id = loginUserBean.getUser_id();	
		} 
		
		for(CartBean cartBean:cartList.getCartList()) {
			
			if(cartBean.getQuantity() != 0) {
				//각 경우에 해당하는 member_id값 입력
				cartBean.setMember_id(member_id);
				
			    //같은 상품 있는지 확인하고 있으면 수량 증가 update
			    if(cartService.checkCart(cartBean)>0) {
			    	cartService.updateCart(cartBean);
			    	
			    	//같은 상품 없으면 add
			    } else {
			    	cartService.addCart(cartBean);
			    }
			}
		}
		

	    int count = cartService.countCart(member_id);
	    return count;
	}
	
	@GetMapping("/cart")
	public String cart(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		Cookie cookie = WebUtils.getCookie(request, "cartCookie");
		String member_id = null;
	
		if(cookie == null && loginUserBean.isUserLogin() == false) {
			member_id = RandomStringUtils.random(6, true, true);
		    Cookie cartCookie = new Cookie("cartCookie", member_id);
		    cartCookie.setPath("/");
		    cartCookie.setMaxAge(60 * 60 * 24 * 1);
		    response.addCookie(cartCookie);
		    
		} else if(cookie != null && loginUserBean.isUserLogin() == false) {
			member_id = cookie.getValue();
			
		}  else if(loginUserBean.isUserLogin() == true) {
			member_id = loginUserBean.getUser_id();	
		} 
		
		List<CartListBean> cartList = cartService.cartList(member_id);
		model.addAttribute("cartList", cartList);
		
		return "product/cart";
	}
	
	@ResponseBody
	@DeleteMapping("/deleteAll")
	public int deleteCartAll(HttpServletRequest request) throws Exception{
		
		Cookie cookie = WebUtils.getCookie(request, "cartCookie");
		String member_id = null;
		
		if(cookie != null && loginUserBean.isUserLogin() == false) 
			member_id = cookie.getValue();
		else if(loginUserBean.isUserLogin() == true) 
			member_id = loginUserBean.getUser_id();	
		
		cartService.deleteCartAll(member_id);
		
		return 1;
	}
	
	@ResponseBody
	@PostMapping("/deleteSelected")
	public int deleteCartSelected(HttpServletRequest request, @RequestParam(value = "checkArr[]") List<String> chArr,
									CartBean cartBean) throws Exception{
		
		Cookie cookie = WebUtils.getCookie(request, "cartCookie");
		String member_id = null;
		
		if(cookie != null && loginUserBean.isUserLogin() == false) 
			member_id = cookie.getValue();
		else if(loginUserBean.isUserLogin() == true) 
			member_id = loginUserBean.getUser_id();
		
		cartBean.setMember_id(member_id);
		
		String product_id;
		
		for(String i : chArr) {
			product_id = i;
			cartBean.setProduct_id(product_id);
			cartService.deleteCartSelected(cartBean);
		}
		return 1;
	}
	
	@PostMapping("/changeCnt")
	@ResponseBody
	public int changeCnt(HttpServletRequest request, CartBean cartBean,
						@RequestParam("quantity") int quantity, 
						@RequestParam("product_id") String product_id) throws Exception{
		
		Cookie cookie = WebUtils.getCookie(request, "cartCookie");
		String member_id = null;
		
		if(cookie != null && loginUserBean.isUserLogin() == false) 
			member_id = cookie.getValue();
		else if(loginUserBean.isUserLogin() == true) 
			member_id = loginUserBean.getUser_id();
		
		cartBean.setMember_id(member_id);
		cartBean.setQuantity(quantity);
		cartBean.setProduct_id(product_id);
		
		cartService.changeCnt(cartBean);
		
		return 1;
	}

}
