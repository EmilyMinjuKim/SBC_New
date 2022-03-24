package kr.co.soft.bean;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderDetailBean {

	private String merchant_uid;
	private String product_id;
	private String product_name;
	private String product_option;
	private int price;
	private int quantity;

}
