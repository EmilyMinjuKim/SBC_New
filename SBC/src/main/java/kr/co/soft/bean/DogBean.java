package kr.co.soft.bean;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Positive;
import javax.validation.constraints.PositiveOrZero;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DogBean {

	private int dog_num;// VARCHAR2(30) NOT NULL, /* 유기견고유번호 */
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

//	@Pattern(regexp = "[0-9]{15}", message = "15자리 숫자를 입력해주세요.")
	private String chip_num;// VARCHAR2(100), /* 칩셋번호 */
	
	private MultipartFile originFile;// VARCHAR2(500) /*이미지 파일*/
	private String dog_img;// VARCHAR2(500) /*이미지 파일*/ dog_img
	private String happen_date;// DATE NOT NULL /* 발생 날짜 */



}
