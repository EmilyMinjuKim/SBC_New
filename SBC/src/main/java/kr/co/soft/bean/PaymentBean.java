package kr.co.soft.bean;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PaymentBean {

	private String imp_id;
	private String merchant_id;
	private String pay_date;
	private int amount;

}
