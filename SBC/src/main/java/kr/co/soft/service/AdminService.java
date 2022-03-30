package kr.co.soft.service;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.co.soft.bean.PageNoticeBean;
import kr.co.soft.bean.UserBean;
import kr.co.soft.dao.AdminDao;

@Service
public class AdminService {
	
	//글 번호 10개씩
	@Value("${page.listcnt}")
	private int page_listcnt;
			
	//버튼 10개씩 
	@Value("${page.paginationcnt}")
	private int paginationcnt;

	@Autowired
	private AdminDao adminDao;

	// UserController
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

	// 전체 유저 리스트
	public List<UserBean> getUserList(int page) {
		
		int start=(page-1)*page_listcnt;
		RowBounds rowBounds=new RowBounds(start, page_listcnt);

		return adminDao.getUserList(rowBounds);
	}

	// 유저 검색
	public List<UserBean> getUserInfo(String user_id) {
		return adminDao.getUserInfo(user_id);
	}

	// 유저 삭제, 비활성화
	public void updateUserEnabled(String user_id) {

		adminDao.updateUserEnabled(user_id);
	}

	// 유저 복구, 활성화
	public void updateUserAbled(String user_id) {

		adminDao.updateUserAbled(user_id);
	}

	// 관리자 업데이트
	public void updateRole(String authority, String user_id) {

		System.out.println("서비스에 안오나" + authority);

		adminDao.updateRole(authority, user_id);
	}

	// 이름 가운데 글자 마스킹
	public static String nameMasking(String name) throws Exception {
		// 한글만 (영어, 숫자 포함 이름은 제외)

		String regex = "(^[가-힣]+)$";

		Matcher matcher = Pattern.compile(regex).matcher(name);

		if (matcher.find()) {

			int length = name.length();
			String middleMask = "";

			if (length > 2) {
				middleMask = name.substring(1, length - 1);
			}

			else { // 이름이 외자

				middleMask = name.substring(1, length);
			}
			String dot = "";
			for (int i = 0; i < middleMask.length(); i++) {
				dot += "*";
			}
			if (length > 2) {
				return name.substring(0, 1) + middleMask.replace(middleMask, dot) + name.substring(length - 1, length);
			} else { // 이름이 외자 마스킹 리턴
				return name.substring(0, 1) + middleMask.replace(middleMask, dot);
			}
		}

		return name;
	}
	
	public PageNoticeBean getAdminCnt(int currentPage) {
		
		//전체글의 갯수
		int current_cnt=adminDao.getAdminCnt();
				
		PageNoticeBean pageBean=new PageNoticeBean(current_cnt, currentPage, page_listcnt, paginationcnt);
				
		return pageBean;
	}

}
