package kr.co.soft.bean;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.PositiveOrZero;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChipBean {
//	@Pattern(regexp = "[0-9]{15}", message = "15자리 숫자를 입력해주세요.")
	private String chip_num;// VARCHAR2(100) NOT NULL, /* 칩셋번호 */
	private String dog_name;// VARCHAR2(100) NOT NULL, /* 주인이름 */ 회원 일 수도 있고, 아닐 수도 있음.
//	@Pattern(regexp = "/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})", message = "올바른 번호를 입력해주세요.")
	private String phone;// NUMBER NOT NULL /* 핸드폰번호 */



}
