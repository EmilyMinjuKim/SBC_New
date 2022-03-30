package kr.co.soft.bean;

import lombok.Getter;
import lombok.Setter;
import oracle.sql.DATE;

@Getter
@Setter
public class VisitCountBean {
	
	public DATE V_DATE;
	
	public int TotalCnt;
	
	public int TodayCnt;

}
