package kr.co.soft.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.soft.bean.UserBean;
import kr.co.soft.dao.VisitCountDao;

@Service
public class VisitCountService {

	@Autowired
	private VisitCountDao visitCountDao;

	// UserController
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

	@Transactional
	public void setTotalCount() {

		visitCountDao.setTotalCount();

	} // end setTotalCount()

	/**
	 * 총 방문자수를 가져온다.
	 * 
	 * @return totalCount : 총 방문자 수
	 */
	public int getTotalCount() {

		System.out.println("값 확인용" + visitCountDao.getTodayCount());

		return visitCountDao.getTotalCount();
	} // end getTotalCount()

	/**
	 * 오늘 방문자 수를 가져온다.
	 * 
	 * @return todayCount : 오늘 방문자
	 */
	public int getTodayCount() {

		return visitCountDao.getTodayCount();
	}// end getTodayCount()
	
	
	/**
	 * 
	 * 신규가입자 수를 가져온다.
	 * 
	 * @return
	 */
	public int getNewSignup() {
		
		return visitCountDao.getNewSignup();
	}
	

}
