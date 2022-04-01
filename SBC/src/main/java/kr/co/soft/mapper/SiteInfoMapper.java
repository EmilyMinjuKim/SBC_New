package kr.co.soft.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface SiteInfoMapper {
	
	@Select("select count(*) from userlist")
	int userCount();

	@Insert("INSERT INTO VISIT(V_DATE) VALUES(sysdate)")
	void insertCount();
	
	@Select("SELECT COUNT(V_DATE) AS TotalCnt FROM VISIT")
	int getVisitCount();
	
	@Select("SELECT COUNT(V_DATE) AS TodayCnt FROM VISIT WHERE TO_DATE(V_DATE, 'YYYY-MM-DD') = TO_DATE(sysdate, 'YYYY-MM-DD')")
	int getTodayVisitCount();
	
	@Select("select count(*) from user_log where to_date(register_time, 'YYYY-MM-DD') = to_date(sysdate, 'YYYY-MM-DD')")
	int getNewSignup();
	
	@Select("select count(*) from orderlist where to_date(order_date, 'YY-MM-DD') = to_date(sysdate, 'YY-MM-DD')")
	int getTodayOrderCount();
	
	@Select("select sum(total_amount) from orderlist where to_date(order_date, 'YY-MM-DD') = to_date(sysdate, 'YY-MM-DD')")
	int getTotal_amount();
	
	
	
	
	
}
