package kr.co.soft.domain;

import java.sql.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.PositiveOrZero;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardListDTO {
	// board
	private int board_num;// NUMBER(30) NOT NULL, /* 게시글번호 */
	private String user_id; // VARCHAR2(30) NOT NULL, /* user_id */
//	@Pattern(regexp = "/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})", message = "올바른 번호를 입력해주세요.")
	private String writer_phone;// NUMBER Not null,/* 글쓴이 연락받을 번호 */
	private Date reg_time;// DATE NOT NULL, /* 작성시간 */
	private Date modi_time; // DATE NOT NULL, /* 수정시간 */
	private int readcount;// = 0;// NUMBER, /* 조회수 */
	private int dog_num;// VARCHAR2(30) NOT NULL, /* 유기견고유번호 */
	private String board_category; // VARCHAR2(30) NOT NULL, /* 카테고리 */

	private boolean likeck;

	// dog
	private String breed;// VARCHAR2(30) NOT NULL, /* 품종 */
	private String color;// VARCHAR2(30) NOT NULL, /* 털색 */
	private String sex;// VARCHAR2(30) NOT NULL, /* 성별 */
	private String age;// NUMBER NOT NULL, /* 나이 */
	private String weight;// NUMBER NOT NULL, /* 몸무게 */
	private String charcteristic;// VARCHAR2(1000), /* 특징 */
	private String neutering; // char 중성화

	private String address1;// VARCHAR2(100) NOT NULL, /* 주소1 */
	private String address2;// VARCHAR2(100) /* 주소2(상세주소) */
	private String dog_content;// VARCHAR2(1000) NOT NULL, /* 상세글 */

	private MultipartFile originFile;// VARCHAR2(500) /*이미지 파일*/
	private String dog_img;// VARCHAR2(500) /*이미지 파일*/ dog_img
	private String happen_date;// DATE NOT NULL /* 발생 날짜 */

	// chip
//	@Pattern(regexp = "[0-9]{15}", message = "15자리 숫자를 입력해주세요.")
	private String chip_num;// VARCHAR2(100) NOT NULL, /* 칩셋번호 */
	private String dog_name;// VARCHAR2(100) NOT NULL, /* 주인이름 */ 회원 일 수도 있고, 아닐 수도 있음.
	// @Pattern(regexp = "/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})", message =
	// "올바른 번호를 입력해주세요.")
	private String phone;// NUMBER NOT NULL /* 핸드폰번호 */

	public BoardListDTO() {
		this.likeck = false;
	}

}
