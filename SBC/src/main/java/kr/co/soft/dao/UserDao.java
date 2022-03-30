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

	// 입력받은 아이디 반환
	public String checkUserEmailExist(String user_id) {
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

	public int check_email(String email) {
		return userMapper.check_email(email);
	}

	public void addUserlistInfo(UserBean UserBean) {
		userMapper.addUserlistInfo(UserBean);
	}

	public void addMembershipInfo(UserBean UserBean) {
		userMapper.addMembershipInfo(UserBean);
	}

	// 회원정보 갖고오기
	public UserBean getModifyUserlistInfo(String user_id) {
		return userMapper.getModifyUserlistInfo(user_id);
	}

	public UserBean getModifyUserMemberInfo(String user_id) {
		return userMapper.getModifyUserMemberInfo(user_id);
	}

	// 회원정보수정
	public void updateUserlistModify(UserBean userlistBean) {
		// return userMapper.updateUserlistModify(userlistBean);
		System.out.println("수정되나");
		userMapper.updateUserlistModify(userlistBean);
	}

	public void updateMembershiModify(UserBean usermembershipBean) {
		// return userMapper.updateMembershiModify(usermembershipBean);
		userMapper.updateMembershiModify(usermembershipBean);
	}

	// 회원탈퇴
	public void deleteUserEna(String user_id) {
		System.out.println("탈퇴되나");
		userMapper.deleteUserEna(user_id);
	}
	
	/*
	 * // 이메일 인증 public void addApproval_keyByEamil(UserBean userBean) {
	 * userMapper.addApproval_keyByEamil(userBean); }
	 */
	
	public int checkApproval_keyByEmail(String email, String approval_key) {
		return userMapper.checkApproval_keyByEmail(email, approval_key);
	}
	
	public void updateEnabledByEmail(String email) {
		userMapper.updateEnabledByEmail(email);
	}

}
