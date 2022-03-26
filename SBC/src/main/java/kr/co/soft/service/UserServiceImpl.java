package kr.co.soft.service;

import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.soft.bean.UserBean;
import kr.co.soft.dao.UserDao;


@Service
public class UserServiceImpl implements UserService {

	private static final int SALT_SIZE = 16;

	@Autowired
	private UserDao userDao;

	// UserController
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

	// 넘겨받은 아이디가 사용가능한지 판단
	@Override
	public String checkUserIdExist(String user_id) {

		String user_name = userDao.checkUserIdExist(user_id);

		if (user_name == null) {
			return "true";
		}
		return "false";
	}

	@Override
	public void getLoginUserInfo(UserBean tempLoginUserBeanT) {

		String user_id = tempLoginUserBeanT.getUser_id();	
		String pw = tempLoginUserBeanT.getUser_password();
		String salt = userDao.getSaltByUser_id(user_id);
		System.out.println(salt);		
		String encryptpww = getEncrypt(pw, salt);
		
		tempLoginUserBeanT.setUser_password(encryptpww);		
		UserBean tempLoginUserBean2 = userDao.getLoginUserInfo(tempLoginUserBeanT);

		System.out.println("값이 오나?" + tempLoginUserBean2);

		if (tempLoginUserBean2 != null) {
			loginUserBean.setUser_id(tempLoginUserBean2.getUser_id());
			loginUserBean.setAuthority(tempLoginUserBean2.getAuthority());
			// System.out.println(loginUserBean.getAuthority());
			loginUserBean.setEnabled(tempLoginUserBean2.getEnabled());
			// System.out.println(loginUserBean.getEnabled());
			loginUserBean.setUserLogin(true); // 로그인 된 상태
		}
	}

	@Override
	public UserBean searchIdByEmail(UserBean UserBean) {
		return userDao.searchIdByEmail(UserBean);
	}

	@Override
	public String getEmailByUser_id(String UserBean) {
		return userDao.getEmailByUser_id(UserBean);
	}

	@Override
	public void find_pw(HttpServletResponse response, UserBean UserBean) throws Exception {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 아이디가 없으면
		if (userDao.check_id(UserBean.getUser_id()) == 0) {
			out.print("아이디 정보가 확인되지 않습니다.");
			out.close();
		}
		// 가입에 사용한 이메일이 아니면
		else if (!UserBean.getEmail().equals(userDao.getEmailByUser_id(UserBean.getUser_id()))) {
			out.print("잘못된 이메일 입니다.");
			out.close();
		} else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			UserBean.setUser_password(pw);
				
			// 비밀번호 변경 메일 발송
			sendEmail(UserBean);
			
			//발송된 비밀번호 암호화
			String salt = generateSalt();	
			String encryptpww = getEncrypt(pw, salt);
			
			UserBean.setUser_password(encryptpww);
			UserBean.setSalt(salt);
			
			// 비밀번호 변경
			userDao.updatePassword(UserBean);
			
			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}

	// =====================================
	// 회원가입
	@Override
	@Transactional
	public void addUserlistInfo(UserBean userBean) {

		String pw = userBean.getUser_password();
		String salt = generateSalt(); 

		String encryptpww = getEncrypt(pw, salt);
		
		userBean.setUser_password(encryptpww); 
		userBean.setSalt(salt);

		userBean.setAuthority("ROLE_USER"); // 회원가입시 유저 권한
		userBean.setEnabled(1); // 회원가입시의 상태 설정

		userDao.addUserlistInfo(userBean);

	}

	@Override
	@Transactional
	public void addMembershipInfo(UserBean userBean) {

		userBean.setPersonal_info_agmt("1");

		userDao.addMembershipInfo(userBean);
	}

	// ========================================================
	// 인증키 생성용
	public String create_key() throws Exception {
		String key = "";

		Random rd = new Random();

		for (int i = 0; i < 8; i++) {
			key += rd.nextInt(10);
		}
		return key;
	}

	// 이메일 발송
	public void sendEmail(UserBean UserBean) throws Exception {

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
		msg += UserBean.getUser_id() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
		msg += "<p>임시 비밀번호 : ";
		msg += UserBean.getUser_password() + "</p></div>";

		String mail = UserBean.getEmail();
		String user_id = UserBean.getUser_id();

		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, user_id);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}

	}

	@Override
	public void check_id(String user_id, HttpServletResponse response) throws Exception {

		PrintWriter out = response.getWriter();
		out.println(userDao.check_id(user_id));
		out.close();

	}

	@Override
	public void check_email(String email, HttpServletResponse response) throws Exception {

		PrintWriter out = response.getWriter();
		out.println(userDao.check_email(email));
		out.close();
	}

	@Override
	@Transactional
	public void updatePassword(UserBean UserBean) {
		userDao.updatePassword(UserBean);
	}

	// ------------------------------------------------------------------------------------------
	// 비밀번호 암호화를 위한 메소드

	// SHA-256으로 해싱하는 메소드
	public static String getEncrypt(String source, String salt) {
		return getEncrypt(source, salt.getBytes());
	}

	/** 
	 * SHA-256 암호화 함
	 * @param source 원본 
	 * @param salt(byte[]) SALT 값
	 * @return   
	 */
	public static String getEncrypt(String source, byte[] salt) {
		String result = "";
		byte[] a = source.getBytes();
		byte[] bytes = new byte[a.length + salt.length];
		System.arraycopy(a, 0, bytes, 0, a.length);
		System.arraycopy(salt, 0, bytes, a.length, salt.length);

		try { // 암호화 방식 지정 메소드
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(bytes);
			byte[] byteData = md.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xFF) + 256, 16).substring(1));
			}
			result = sb.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return result;
	}

	/**  SALT 값을 얻어온다. 
	 *  @return 
	 */
	public static String generateSalt() {
		Random random = new Random();
		byte[] salt = new byte[8];
		random.nextBytes(salt);
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < salt.length; i++) { // byte 값을 Hex 값으로 바꾸기.
			sb.append(String.format("%02x", salt[i]));
		}

		return sb.toString();
	}

	@Override
	public String getSaltByUser_id(String user_id) {

		return userDao.getSaltByUser_id(user_id);
	}

}