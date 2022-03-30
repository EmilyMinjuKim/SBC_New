package kr.co.soft.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kr.co.soft.mapper.SiteInfoMapper;

@Repository
public class VisitCountDao {

	@Autowired
	SiteInfoMapper siteInfoMapper;

	/*
	 * private static VisitCountDao instance;
	 * 
	 * // 싱글톤 패턴 private VisitCountDao() { }
	 * 
	 * public static VisitCountDao getInstance() {
	 * 
	 * if (instance == null) instance = new VisitCountDao(); return instance; }
	 */

	/**
	 * 총방문자수를 증가시킨다.
	 */
	@Transactional
	public void setTotalCount() {

		siteInfoMapper.insertCount();

	} // end setTotalCount()

	/**
	 * 총 방문자수를 가져온다.
	 * 
	 * @return totalCount : 총 방문자 수
	 */
	public int getTotalCount() {
		
		System.out.println("매퍼에서 무슨값을 가져오고 있나" + siteInfoMapper.getVisitCount());
		return siteInfoMapper.getVisitCount();
		
	} // end getTotalCount()

	/**
	 * 오늘 방문자 수를 가져온다.
	 * 
	 * @return todayCount : 오늘 방문자
	 */
	public int getTodayCount() {
		
		return siteInfoMapper.getTodayVisitCount();
	}// end getTodayCount()
	
	
	/**
	 * 
	 * 신규가입자 수를 가져온다.
	 * 
	 * @return
	 */
	public int getNewSignup() {
		
		return siteInfoMapper.getNewSignup();
		
	}
	
	
}
