package kr.co.soft.service;

import javax.servlet.http.HttpServletResponse;

import kr.co.soft.bean.UserBean;

public interface UserService {
	
	public String checkUserIdExist(String user_id);
	
	public void getLoginUserInfo(UserBean tempLoginUserBeanT);
	
	public UserBean searchIdByEmail(UserBean userlistBean);
	
	public String getEmailByUser_id(String user_id);

	public void check_id(String user_id, HttpServletResponse response) throws Exception;

	public void check_email(String email, HttpServletResponse response) throws Exception;
	
	public void find_pw(HttpServletResponse response, UserBean userlistBean) throws Exception;
	
	public void updatePassword(UserBean userlistBean);
	
	public void addUserlistInfo(UserBean userJoinBean);

	public void addMembershipInfo(UserBean userJoinBean);
	
	public String getSaltByUser_id(String user_id);
	
	
	
	
	


}
