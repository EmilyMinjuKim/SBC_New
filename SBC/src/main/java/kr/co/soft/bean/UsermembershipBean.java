package kr.co.soft.bean;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UsermembershipBean {

	private String user_name; //db insert 순서 맞춤
	private String user_id;
	private String phone;
	private int postcode; //우편번호
	private String address1; //기본주소
	private String address2; //상세주소
	private String gender;
	private String birthdate;
	private String personal_info_agmt;
	
	//롬복 작동하면 지우셔도 되요(제거에선 작동안해서...)
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getPostcode() {
		return postcode;
	}
	public void setPostcode(int postcode) {
		this.postcode = postcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public String getPersonal_info_agmt() {
		return personal_info_agmt;
	}
	public void setPersonal_info_agmt(String personal_info_agmt) {
		this.personal_info_agmt = personal_info_agmt;
	}
	
}