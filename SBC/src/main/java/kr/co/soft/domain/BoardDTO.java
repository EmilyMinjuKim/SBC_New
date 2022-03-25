package kr.co.soft.domain;



import kr.co.soft.bean.BoardBean;
import kr.co.soft.bean.ChipBean;
import kr.co.soft.bean.DogBean;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardDTO {

	BoardBean board;
	DogBean dog;
	ChipBean chip;

}
