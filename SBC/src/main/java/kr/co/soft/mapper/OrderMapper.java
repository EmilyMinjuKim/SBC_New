package kr.co.soft.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.co.soft.bean.CartBean;
import kr.co.soft.bean.OrderDetailBean;
import kr.co.soft.bean.OrderListBean;

public interface OrderMapper {
	
	@Insert("insert into orderlist(merchant_uid, member_id, temp_pw, order_name, "
			+ "order_phone, email, order_postcode, order_address1, order_address2, "
			+ "order_date, shipping_name, shipping_phone, shipping_postcode, "
			+ "shipping_address1, shipping_address2, total_price, shipping, total_amount) "
			+ "values(#{merchant_uid}, #{member_id}, #{temp_pw, jdbcType = VARCHAR}, #{order_name}, "
			+ "#{order_phone}, #{email}, #{order_postcode}, #{order_address1}, "
			+ "#{order_address2}, sysdate, #{shipping_name}, #{shipping_phone}, "
			+ "#{shipping_postcode}, #{shipping_address1}, #{shipping_address2}, "
			+ "#{total_price}, #{shipping}, #{total_amount})")
	void insertOrderInfo(OrderListBean orderListBean);
	
	@Insert("insert into order_detail(merchant_uid, product_id, quantity) "
			+ "values(#{merchant_uid}, #{product_id}, #{quantity})")
	void insertOrderList(OrderDetailBean orderDetailBean);
	
	@Delete("delete from cart where member_id=#{member_id} and product_id=#{product_id}")
	void deleteCartList(CartBean cartBean);
	
	@Select("select l.merchant_uid, order_date, total_amount, product_name "
			+ "from orderlist l "
			+ "join order_detail d "
			+ "on l.merchant_uid = d.merchant_uid "
			+ "join product p "
			+ "on d.product_id = p.product_id "
			+ "where l.merchant_uid = #{merchant_uid, jdbcType = VARCHAR} "
			+ "and d.product_id = (select min(product_id) "
			+ "                    from order_detail "
			+ "                    where merchant_uid = #{merchant_uid, jdbcType = VARCHAR})")
	OrderListBean showOrder(String merchant_uid); 
	
}
