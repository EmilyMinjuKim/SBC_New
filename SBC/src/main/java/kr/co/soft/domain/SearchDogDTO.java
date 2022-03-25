package kr.co.soft.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SearchDogDTO {

	private String serviceKey;// 서비스키
	private String upkind;// 검색 종
	private String bgnDate;// 검색 시작 날짜
	private String endDate;// 검색 끝 날짜
	private String areaCode;
	private String cityCode;

	public SearchDogDTO() {
		this.serviceKey = "GWv4aKTZE270SNJz1KlsyPjSSTvX5fcbqQdY3LZmajyhY4vjftteM5ioDf61rFCzmHeuDjiOeOgg9kNIwK7irw%3D%3D";
	}

	public SearchDogDTO(String serviceKey, String upkind, String bgnDate, String endDate, String areaCode,
			String cityCode) {
		this.serviceKey = serviceKey;
		this.upkind = upkind;
		this.bgnDate = bgnDate;
		this.endDate = endDate;
		this.areaCode = areaCode;
		this.cityCode = cityCode;
	}

}
