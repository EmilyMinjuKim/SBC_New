package kr.co.soft.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.soft.bean.UserBean;

public interface UserMapper {
	
	//아이디 중복 확인
	@Select("select user_id from userlist where user_id = #{user_id}")
	String checkUserIdExist(String user_id);
	
	//로그인 및 로그인 정보 받아오기
	@Select("select user_idx, user_id, Email, authority, enabled from Userlist where user_id=#{user_id} and user_password=#{user_password}")
	UserBean getLoginUserInfo(UserBean tempLoginUserBeanT);
	
	//아이디를 통해 데이터베이스에 저장된 솔트 값 가져오기
	@Select("select salt from userlist where user_id = #{user_id}")
	String getSaltByUser_id(String user_id);
	
	@Select("select user_id from userlist where email = #{email}")
	UserBean searchIdByEmail(UserBean userlistBean);
	
	@Select("select email from userlist where user_id = #{user_id}")
	String getEmailByUser_id(String user_id);
	
	//로그인 성공 시 최근 접속 시간, 아이피 주소 로그에 남김
	@Update("update user_log set last_login_time = sysdate, recentlogin_ip = #{recentlogin_ip} where user_id = #{user_id}")
	void updateRecentlogin_ipByUser_id(UserBean tempLoginUserBeanT);
	
	
	// 비밀번호 변경
	@Update("update userlist set user_password = #{user_password}, salt = #{salt} where user_id = #{user_id}")
	void updatePassword(UserBean userlistBean);
	
	@Select("select count(user_idx) from userlist where user_id = #{user_id}")
	int check_id(String user_id);
	
	@Select("select count(user_idx) from userlist where user_id = #{email}")
	int check_email(String email);
	
	
	// 회원가입
	@Insert("insert into userlist(user_idx, user_id, user_password, salt, email, authority, enabled) "
			+ "values(user_idx.nextval, #{user_id}, #{user_password}, #{salt}, #{email}, #{authority}, #{enabled})")
	void addUserlistInfo(UserBean userlistbean);
	
	@Insert("insert into membership(user_name, user_id, phone, postcode, address1, address2, gender, birthdate, personal_info_agmt) "
			+ "values(#{user_name}, #{user_id}, #{phone}, #{postcode}, #{address1}, #{address2}, #{gender}, #{birthdate}, #{personal_info_agmt})")
	void addMembershipInfo(UserBean usermembershipBean);
	
	
	
	
	
	
	
}