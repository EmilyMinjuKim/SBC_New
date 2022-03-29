package kr.co.soft.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.soft.bean.UserBean;
import kr.co.soft.mapper.UserMapper;

@Repository // DAO 저장소에는 @Repository 어노테이션을 붙여야 한다.
public class UserDao {

	@Autowired
	private UserMapper userMapper;

	// 입력받은 아이디 반환
	public String checkUserIdExist(String user_id) {
		return userMapper.checkUserIdExist(user_id);
	}
	
	// 아이디를 통해 해당 계정의 솔트 값 가져오기
	public String getSaltByUser_id(String user_id) {
		return userMapper.getSaltByUser_id(user_id);
	}
	

	/*
	 * //회원가입(UserMapper) public void addUserInfo(UserBean signupUserBean) {
	 * userMapper.addUserInfo(signupUserBean); }
	 */

	/*
	 * public void addUserInfo(UserBean joinUserBean) {
	 * userMapper.addUserInfo(joinUserBean); }
	 */

	public UserBean getLoginUserInfo(UserBean tempLoginUserBeanT) {
		return userMapper.getLoginUserInfo(tempLoginUserBeanT);
	}
	
	
	public void updateRecentlogin_ipByUser_id(UserBean tempLoginUserBeanT) {
		userMapper.updateRecentlogin_ipByUser_id(tempLoginUserBeanT);
	}
	
	public String getEmailByUser_id(String user_id) {
		return userMapper.getEmailByUser_id(user_id);
	}

	public UserBean searchIdByEmail(UserBean UserBean) {
		return userMapper.searchIdByEmail(UserBean);
	}

	public void updatePassword(UserBean UserBean) {
		userMapper.updatePassword(UserBean);
	}

	public int check_id(String user_id) {
		return userMapper.check_id(user_id);
	}

	public int check_email(String user_id) {
		return userMapper.check_email(user_id);
	}

	public void addUserlistInfo(UserBean UserBean) {
		userMapper.addUserlistInfo(UserBean);
	}

	public void addMembershipInfo(UserBean UserBean) {
		userMapper.addMembershipInfo(UserBean);
	}

}
