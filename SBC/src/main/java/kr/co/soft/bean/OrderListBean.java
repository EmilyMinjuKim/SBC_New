package kr.co.soft.bean;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderListBean {
	
	private String merchant_uid;
	private String member_id;
	private String temp_pw;
	private String order_name;
	private String order_phone;
	private String email;
	private int order_postcode;
	private String order_address1;
	private String order_address2;
	private String order_date;
	private String shipping_name;
	private String shipping_phone;
	private int shipping_postcode;
	private String shipping_address1;
	private String shipping_address2;
	private int total_price;
	private int shipping;
	private int total_amount;
	private String product_name;
}
