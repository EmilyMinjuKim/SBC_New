package kr.co.soft.bean;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class User_logBean {

	private String user_id;
	
	private Date last_login_time;
	
	private Date register_time;
	
	private Date update_time;
	
	private Date withdrawal_time;

}
