package kr.co.soft.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.soft.bean.CartBean;
import kr.co.soft.bean.OrderDetailBean;
import kr.co.soft.bean.OrderListBean;
import kr.co.soft.mapper.OrderMapper;

@Service
public class OrderService {
	
	@Autowired
	OrderMapper mapper;
	
	public void insertOrder(OrderListBean orderListBean) {
		mapper.insertOrderInfo(orderListBean);
	}
	
	public void insertOrderList(OrderDetailBean orderDetailBean) {
		mapper.insertOrderList(orderDetailBean);
	}
	
	public void deleteCartList(CartBean cartBean) {
		mapper.deleteCartList(cartBean);
	}

	public OrderListBean showOrder(String merchant_uid) {
		return mapper.showOrder(merchant_uid);
	}
	
	public List<OrderListBean> showOrderList(String member_id) {
		return mapper.showOrderList(member_id);
	}
	
	public List<OrderDetailBean> showOrderProductList(String merchant_uid){
		return mapper.showOrderProductList(merchant_uid);
	}
	
	public OrderListBean showOrderInfo(String merchant_uid) {
		return mapper.showOrderInfo(merchant_uid);
	}
}
