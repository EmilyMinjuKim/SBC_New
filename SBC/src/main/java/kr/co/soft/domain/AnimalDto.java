package kr.co.soft.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AnimalDto {
	private String title;
	private Object info;

	public AnimalDto(String title, Object info) {
		super();
		this.title = title;
		this.info = info;
	}

	public AnimalDto() {
		super();
		// TODO Auto-generated constructor stub
	}

}
