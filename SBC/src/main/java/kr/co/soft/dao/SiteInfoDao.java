package kr.co.soft.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.soft.mapper.SiteInfoMapper;

@Repository // DAO 저장소에는 @Repository 어노테이션을 붙여야 한다.
public class SiteInfoDao {

	@Autowired
	private SiteInfoMapper siteInfoMapper;
	
	public int userCount() {
		return siteInfoMapper.userCount();
	}

	
	public int getTodayOrderCount() {
		
		return siteInfoMapper.getTodayOrderCount();
		
	}
	
}
