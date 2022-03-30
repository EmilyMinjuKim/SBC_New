package kr.co.soft.bean;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
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
	
	@NotBlank
	private String user_id;

	@Pattern(regexp = "^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$")
	private String phone;

	private String postcode; // 우편번호

	private String address1; // 기본주소

	private String address2; // 상세주소

	private String gender;

	@Size(min = 6, max = 6)
	@Pattern(regexp = "([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))")
	private String birthdate;

	private String personal_info_agmt;

	private int user_idx;

	@Pattern(regexp = "^(?=.*d)(?=.*[a-zA-ZS]).{8,}")
	private String user_password;

	@Pattern(regexp = "^(?=.*d)(?=.*[a-zA-ZS]).{8,}")
	private String user_password2;

	private String salt;
	
	@Email
	private String email;

	private String authority;

	private int enabled;
	
	private String approval_key;

	private boolean userIdExist;
	private boolean userEmailExist;
	private boolean userLogin;

	public UserBean() {

		this.userIdExist = false; // 최초 가입자 아이디 존재 여부는 false 디폴트 값을 준다. 중복 검사를 하지 않기 때문에
		
		this.userEmailExist = false;
		
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