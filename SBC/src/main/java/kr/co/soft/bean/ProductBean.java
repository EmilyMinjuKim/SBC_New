package kr.co.soft.bean;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductBean {

	private String product_id;
	private String product_name;
	private String product_option;
	private int price;
	private int stock;
	private String product_category;

}
