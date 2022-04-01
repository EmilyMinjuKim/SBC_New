package kr.co.soft.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.soft.bean.UserBean;
import kr.co.soft.mapper.AdminMapper;

@Repository
public class AdminDao {
	
	@Autowired
	private AdminMapper adminMapper;
	
	//전체 리스트
	public List<UserBean> getUserList(RowBounds rowBounds){
		
		List<UserBean> list = adminMapper.getUserList(rowBounds);
		
		for (UserBean templist : list) {
			System.err.println(templist.getUser_id());
		}
		
		return list;
	}
	
	// 유저 검색
	public List<UserBean> getUserInfo(String user_id) {
		return adminMapper.getUserInfo(user_id);
	}
	
	// 유저 삭제
	public void updateUserEnabled(String user_id) {
		
		adminMapper.updateUserEnabled(user_id);
	}
	
	// 유저 활성화
	public void updateUserAbled(String user_id) {
		
		adminMapper.updateUserAbled(user_id);
	}
	
	// 관리자 권한 부여
	public void updateRole(String authority, String user_id) {
		
		System.out.println("다오에도 값이 안오나" + authority);
		System.out.println("다오에도 값이 안오나" + user_id);
		
		adminMapper.updateRole(authority, user_id);
	}
	
	public int getAdminCnt() {
		return adminMapper.getAdminCnt();
	}
	
	public String getUser_passwordByUser_id(String user_id) {
		return adminMapper.getUser_passwordByUser_id(user_id);
	}
	
	public String getSaltByUser_id(String user_id) {
		return adminMapper.getSaltByUser_id(user_id);
	}
	
	
	


}
