package kr.co.soft.bean;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserBean {

	private int index;
	
	@Size(min = 2, max = 8)
	@Pattern(regexp = "[가-힣]*")
	private String user_name;
	
	@Size(min = 4, max = 20)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String user_id;

	@Pattern(regexp = "01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}")
	private String phone;

	private int postcode; // 우편번호

	private String address1; // 기본주소

	private String address2; // 상세주소

	private String gender;

	private String birthdate;

	private String personal_info_agmt;

	private int user_idx;

	private String user_password;

	private String user_password2;

	private String salt;
	
	@Email
	private String email;

	private String authority;

	private int enabled;

	private boolean userIdExist;
	private boolean userLogin;

	public UserBean() {

		this.userIdExist = false; // 최초 가입자 아이디 존재 여부는 false 디폴트 값을 준다. 중복 검사를 하지 않기 때문에
		this.userLogin = false; // 로그인 안 된 상태.
	}
	
	// =========================================
	// log 관련
	
	private Date last_login_time;
	
	private Date register_time;
	
	private Date update_time;
	
	private Date withdrawal_time;
	
	private String recentlogin_ip;
	
	
}