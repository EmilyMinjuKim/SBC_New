package kr.co.soft.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.soft.bean.UserlistBean;
import kr.co.soft.bean.UsermembershipBean;
import kr.co.soft.mapper.UserMapper;

@Repository // DAO 저장소에는 @Repository 어노테이션을 붙여야 한다.
public class UserDao {

	@Autowired
	private UserMapper userMapper;

	//입력받은 아이디 반환
	public String checkUser(String user_id) {
		return userMapper.checkUserIdExist(user_id);
	}

	/*
	 * //회원가입(UserMapper) public void addUserInfo(UserlistBean signupUserBean) {
	 * userMapper.addUserInfo(signupUserBean); }
	 */
	
	/*
	 * public void addUserInfo(UserBean joinUserBean) {
	 * userMapper.addUserInfo(joinUserBean); }
	 */
	
	
	public UserlistBean getLoginUserInfo(UserlistBean tempLoginUserBeanT) {
		return userMapper.getLoginUserInfo(tempLoginUserBeanT);
	}
	
	public UsermembershipBean searchIdByEmail(UsermembershipBean usermembershipBean) {
		return userMapper.searchIdByEmail(usermembershipBean);
	}
	
	public UserlistBean searchPassword(UserlistBean userlistBean) {
		return userMapper.searchPassword(userlistBean);
	}
	
}