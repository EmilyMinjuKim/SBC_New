package kr.co.soft.mapperVO;

import lombok.Getter;
import lombok.Setter;

public class AreaCodeMapperValue {

	private String code;
	private String name;

	public AreaCodeMapperValue() {
	}

	public AreaCodeMapperValue(AreaCodeMapperType enumMapperType) {
		code = enumMapperType.getCode();
		name = enumMapperType.getName();
	}

	public String getCode() {
		return code;
	}

	public String getName() {
		return name;
	}

	@Override
	public String toString() {
		return "EnumMapperValue [code=" + code + ", name=" + name + "]";
	}

}
