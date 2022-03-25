package kr.co.soft.bean;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CareAnimal {
	private String user_id;
	private String animal_code;
	private Date add_date;

	
}
