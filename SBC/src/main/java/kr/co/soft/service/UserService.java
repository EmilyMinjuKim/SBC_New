package kr.co.soft.service;

import java.util.Random;

import javax.annotation.Resource;

/*import org.apache.commons.mail.HtmlEmail;*/
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.soft.bean.UserlistBean;
import kr.co.soft.bean.UsermembershipBean;
import kr.co.soft.dao.UserDao;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;

	// UserController
	@Resource(name = "loginUserBean")
	private UserlistBean loginUserBean;

	// 넘겨받은 아이디가 사용가능한지 판단
	public boolean checkUserIdExist(String user_id) {

		String user_name = userDao.checkUser(user_id);

		if (user_name == null) {
			return true;
		} else {
			return false;
		}
	}

	/*
	 * // UserController에서 joinUserBean /join(user/join) public void
	 * addUserInfo(UserlistBean signupUserBean) {
	 * userDao.addUserInfo(signupUserBean); }
	 */

	public void getLoginUserInfo(UserlistBean tempLoginUserBeanT) {
		UserlistBean tempLoginUserBean2 = userDao.getLoginUserInfo(tempLoginUserBeanT);

		if (tempLoginUserBean2 != null) {
			loginUserBean.setUser_idx(tempLoginUserBean2.getUser_idx());
			loginUserBean.setAuthority(tempLoginUserBean2.getAuthority());
			loginUserBean.setEnabled(tempLoginUserBean2.getEnabled());
			loginUserBean.setUserLogin(true); // 로그인 된 상태
		}
	}

	/*
	 * //UserController에서 joinUserBean /join(user/join) public void
	 * addUserInfo(UserBean joinUserBean) { userDao.addUserInfo(joinUserBean); }
	 * 
	 * public void getLoginUserInfo(UserBean tempLoginUserBean) { UserBean
	 * tempLoginUserBean2 = userDao.getLoginUserInfo(tempLoginUserBean); if
	 * (tempLoginUserBean2 != null) {
	 * loginUserBean.setUser_idx(tempLoginUserBean2.getUser_idx());
	 * loginUserBean.setUser_name(tempLoginUserBean2.getUser_name());
	 * loginUserBean.setUserLogin(true); //로그인 된 상태 } }
	 */

	public UsermembershipBean searchIdByEmail(UsermembershipBean usermembershipBean) {
		return userDao.searchIdByEmail(usermembershipBean);
	}

	// ========================================================
	// 인증키 생성
	public String create_key() throws Exception {
		String key = "";

		Random rd = new Random();

		for (int i = 0; i < 8; i++) {
			key += rd.nextInt(10);
		}
		return key;
	}

	// 이메일 발송
	public void sendEmail(UsermembershipBean usermembershipBean, UserlistBean userlistBean) throws Exception {

		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com";
		String hostSMTPid = "sbcmailserver@gmail.com";
		String hostSMTPpwd = "soldesk1234";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "sbcmailserver@gmail.com";
		String fromName = "SBC-Together";
		String subject = "";
		String msg = "";
		
		subject = "SBC-Together 임시비밀번호 발송.";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += usermembershipBean.getUser_name() + "(" + usermembershipBean.getUser_id() + ")" +  "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
		msg += "<p>임시 비밀번호 : ";
		msg += userlistBean.getUser_password() + "</p></div>";
		
		/*String mail = usermembershipBean.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
*/
	}

}