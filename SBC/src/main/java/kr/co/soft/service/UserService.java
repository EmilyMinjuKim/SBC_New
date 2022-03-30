package kr.co.soft.service;

import javax.servlet.http.HttpServletResponse;

import kr.co.soft.bean.UserBean;

public interface UserService {

	public String checkUserIdExist(String user_id);
	
	public String checkUserEmailExist(String email);

	public void getLoginUserInfo(UserBean tempLoginUserBeanT) throws Exception;

	public void updateRecentlogin_ipByUser_id(UserBean userlistBean);

	public UserBean searchIdByEmail(UserBean userlistBean);

	public String getEmailByUser_id(String user_id);

	public void check_id(String user_id, HttpServletResponse response) throws Exception;

	public void check_email(String email, HttpServletResponse response) throws Exception;

	public void find_pw(HttpServletResponse response, UserBean userlistBean) throws Exception;

	public void updatePassword(UserBean userlistBean);

	public void addUserlistInfo(UserBean userJoinBean) throws Exception;

	public void addMembershipInfo(UserBean userJoinBean);

	public String getSaltByUser_id(String user_id);

	// 회원정보 갖고오기
	public UserBean getModifyUserlistInfo(String user_id);

	public UserBean getModifyUserMemberInfo(String user_id);

	// 회원정보수정
	public void updateUserlistModify(UserBean userlistBean);

	public void updateMembershiModify(UserBean usermembershipBean);

	// 회원탈퇴
	public void deleteUserEna(String user_id);
	
	//인증과정
	/* public void addApproval_keyByEamil(UserBean userBean); */
	
	public int checkApproval_keyByEmail(String email, String approval_key);
	
	public void updateEnabledByEmail(String email);
	

}
