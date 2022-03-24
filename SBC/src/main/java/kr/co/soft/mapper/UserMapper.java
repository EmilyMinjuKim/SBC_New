package kr.co.soft.mapper;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.soft.bean.UserlistBean;
import kr.co.soft.bean.UsermembershipBean;

public interface UserMapper {
	
	//아이디 중복 확인
	@Select("select user_name from membership where user_id = #{user_id}")
	String checkUserIdExist(String user_id);
	
	/*회원가입(수정)
	@Insert("insert into userlist (user_idx, user_id, user_password, user_pw) " +
			"values (user_idx.nextval, #{user_name}, #{user_id}, #{user_pw})")
	void addUserInfo(UserBean signupUserBean);
	*/
	
	/*
	 * //회원가입
	 * 
	 * @Insert("insert into membsrship (user_id, phone, email, postcode, address1, address2, gender, birthdate, personal_info_agmt, user_name)"
	 * +
	 * "values (#{user_id}, #{phone}, #{email}, #{postcode}, #{address1}, #{address2}, #{gender}, #{birthdate}, #{personal_info_agmt},#{user_name})"
	 * ) void addUserInfo(UserBean signupUserBean);
	 */
	
	
	/* 회원가입
	@Insert("insert into user_table (user_idx, user_name, user_id, user_pw) " +
			"values (user_seq.nextval, #{user_name}, #{user_id}, #{user_pw})")
	void addUserInfo(UserBean joinUserBean);
	*/
	
	//로그인 테스트
	@Select("select user_idx, user_id, user_password from Userlist where user_id=#{user_id} and user_password=#{user_password}")
	UserlistBean getLoginUserInfo(UserlistBean tempLoginUserBeanT);
	
	/*유효성 검사
	@Select("select user_idx, user_name " + 
			"from user_table " + 
			"where user_id=#{user_id} and user_pw=#{user_pw}")
	UserBean getLoginUserInfo(UserBean tempLoginUserBean);
	*/
	
	/*
	@Select("select user_id, user_name " +
			"from user_table " +
			"where user_idx = #{user_idx}")
	UserBean getModifyUserInfo(int user_idx); 
	
	@Update("update user_table " +
			"set user_pw = #{user_pw} " +
			"where user_idx = #{user_idx}")
	void modifyUserInfo(UserBean modifyUserBean);
	*/
	
	@Select("select ul.user_id\r\n"
			+ "from userlist ul, membership m\r\n"
			+ "where ul.user_id = m.user_id\r\n"
			+ "and m.email = #{email}")
	UsermembershipBean searchIdByEmail(UsermembershipBean usermembershipBean);
	
	@Update("update userlist set user_password = #{user_password} where user_id = #{user_id}")
	UserlistBean searchPassword(UserlistBean userlistBean);
	
}