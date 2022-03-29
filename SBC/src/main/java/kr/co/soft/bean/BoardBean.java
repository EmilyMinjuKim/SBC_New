package kr.co.soft.bean;

import java.sql.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardBean {
	private int board_num;// NUMBER(30) NOT NULL, /* 게시글번호 */
	private String user_id; // VARCHAR2(30) NOT NULL, /* user_id */
//	@Pattern(regexp = "/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})", message = "올바른 번호를 입력해주세요.")
	private String writer_phone;// NUMBER Not null,/* 글쓴이 연락받을 번호 */
	private Date reg_time;// DATE NOT NULL, /* 작성시간 */
	private Date modi_time; // DATE NOT NULL, /* 수정시간 */
	private int readcount=0;// = 0;// NUMBER, /* 조회수 */
	private int dog_num;// VARCHAR2(30) NOT NULL, /* 유기견고유번호 */
	private String board_category; // VARCHAR2(30) NOT NULL, /* 카테고리 */

}
