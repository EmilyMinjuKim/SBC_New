package kr.co.soft.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import kr.co.soft.bean.UserBean;

public interface AdminMapper {
	
	@Select("select rownum \"index\", ul.user_id, m.user_name, ul.authority, log.last_login_time, log.recentlogin_ip, ul.enabled from userlist ul, membership m, user_log log\r\n"
			+ "	where ul.user_id = m.user_id and ul.user_id = log.user_id")
	List<UserBean> getUserList(RowBounds rowBounds);
	
	@Select("select rownum \"index\", ul.user_id, m.user_name, ul.authority, log.last_login_time, log.recentlogin_ip, ul.enabled from userlist ul, membership m, user_log log\r\n"
			+ "	where ul.user_id = m.user_id and ul.user_id = log.user_id and ul.user_id = #{user_id}" )
	List<UserBean> getUserInfo(String user_id);
	
	@Update("update userlist set enabled = 0 where user_id = #{user_id}")
	void updateUserEnabled(String user_id);
	
	@Update("update userlist set enabled = 1 where user_id = #{user_id}")
	void updateUserAbled(String user_id);
	
	@Update("update userlist set authority = #{authority} where user_id = #{user_id}")
	void updateRole(@Param("authority") String authority, @Param("user_id")String user_id);
	
	@Select("select count(*) from userlist")
	int getAdminCnt();
}
