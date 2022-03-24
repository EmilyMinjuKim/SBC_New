package kr.co.soft.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.soft.bean.CartBean;
import kr.co.soft.bean.CartListBean;
import kr.co.soft.mapper.CartMapper;

@Service
public class CartService {
	
	@Autowired
	CartMapper mapper;

	public void addCart(CartBean cartBean) {
		mapper.addCart(cartBean);
	}
	
	public Integer countCart(String member_id) {
		return mapper.countCart(member_id);
	}
	
	public List<CartListBean>  cartList(String member_id) {
		return mapper.cartList(member_id);
	}
	
	public void deleteCartAll(String member_id) {
		mapper.deleteCartAll(member_id);
	}
	
	public void deleteCartSelected(CartBean cartBean) {
		mapper.deleteCartSelected(cartBean);
	}
	
	public int checkCart(CartBean cartBean) {
		return mapper.checkCart(cartBean);
	}
	
	public void updateCart(CartBean cartBean) {
		mapper.updateCart(cartBean);
	}
	
	public void changeCnt(CartBean cartBean) {
		mapper.changeCnt(cartBean);
	}
	
}
