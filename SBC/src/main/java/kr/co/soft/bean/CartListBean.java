package kr.co.soft.bean;

import lombok.Setter;

import lombok.Getter;

@Getter
@Setter
public class CartListBean {
	private String product_id;
	private String product_name;
	private String product_option;
	private int price;
	private int quantity;
	private int total;
}
