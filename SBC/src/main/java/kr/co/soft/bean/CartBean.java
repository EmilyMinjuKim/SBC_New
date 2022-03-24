package kr.co.soft.bean;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartBean {

	private String member_id;
	private String product_id;
	private int quantity;
	private String cart_date;
	
}
