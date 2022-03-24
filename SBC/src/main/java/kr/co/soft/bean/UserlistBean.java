package kr.co.soft.bean;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserlistBean {

	private int user_idx;
	private String user_id;
	private String user_password;
	private String user_password2;
	private String email;
	private String authority; //등급
	private int enabled; //권한 0은 X, 1은 O
	
	private boolean userIdExist;
	private boolean userLogin;
	
	public UserlistBean() {
		this.userIdExist = false; //최초 가입자 아이디 존재 여부는 false 디폴트 값을 준다. 중복 검사를 하지 않기 때문에
		this.userLogin = false;	//로그인 안 된 상태. 
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_password2() {
		return user_password2;
	}

	public void setUser_password2(String user_password2) {
		this.user_password2 = user_password2;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public boolean isUserIdExist() {
		return userIdExist;
	}

	public void setUserIdExist(boolean userIdExist) {
		this.userIdExist = userIdExist;
	}

	public boolean isUserLogin() {
		return userLogin;
	}

	public void setUserLogin(boolean userLogin) {
		this.userLogin = userLogin;
	}
	
}