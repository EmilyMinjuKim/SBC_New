package kr.co.soft.domain;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.json.JSONObject;
import org.json.simple.JSONArray;

import kr.co.soft.mapperVO.AreaCodeMapperValue;

public class BoardSearchDogHandler {

	// 도시 리스트 만들기
	public List<AreaCodeMapperValue> cityCategory1() {
		AreaCode[] names = AreaCode.values();// AreaCode 전체 객체.

		List<AreaCode> a = new ArrayList<>();// 그룹별 리스트. (A, B, ...Q)

		for (AreaCode areaCode : names) {
			String str = areaCode.toString();
			if (str.contains("A"))
				a.add(areaCode);
		}

		List<AreaCodeMapperValue> city_list = Arrays.stream(cityList(a)).map(AreaCodeMapperValue::new)
				.collect(Collectors.toList());

		return city_list;
	}

	// Json 형식 시,군,구 리스트 만들기
	public List<JSONObject> cityCategory2() {
		// BoardFunction = new BoardFunction();// BoradController
		List areaCodeList = new ArrayList();

		AreaCode[] names = AreaCode.values();// AreaCode 전체 객체.

		List<AreaCode> b = new ArrayList<>();
		List<AreaCode> c = new ArrayList<>();
		List<AreaCode> d = new ArrayList<>();
		List<AreaCode> e = new ArrayList<>();
		List<AreaCode> f = new ArrayList<>();
		List<AreaCode> g = new ArrayList<>();
		List<AreaCode> h = new ArrayList<>();
		List<AreaCode> i = new ArrayList<>();
		List<AreaCode> j = new ArrayList<>();
		List<AreaCode> k = new ArrayList<>();
		List<AreaCode> l = new ArrayList<>();
		List<AreaCode> m = new ArrayList<>();
		List<AreaCode> n = new ArrayList<>();
		List<AreaCode> o = new ArrayList<>();
		List<AreaCode> p = new ArrayList<>();
		List<AreaCode> q = new ArrayList<>();

		for (AreaCode areaCode : names) {
			String str = areaCode.toString();
			if (str.contains("B"))
				b.add(areaCode);
			else if (str.contains("C"))
				c.add(areaCode);
			else if (str.contains("D"))
				d.add(areaCode);
			else if (str.contains("E"))
				e.add(areaCode);
			else if (str.contains("F"))
				f.add(areaCode);
			else if (str.contains("G"))
				g.add(areaCode);
			else if (str.contains("H"))
				h.add(areaCode);
			else if (str.contains("I"))
				i.add(areaCode);
			else if (str.contains("J"))
				j.add(areaCode);
			else if (str.contains("K"))
				k.add(areaCode);
			else if (str.contains("L"))
				l.add(areaCode);
			else if (str.contains("M"))
				m.add(areaCode);
			else if (str.contains("N"))
				n.add(areaCode);
			else if (str.contains("O"))
				o.add(areaCode);
			else if (str.contains("P"))
				p.add(areaCode);
			else if (str.contains("Q"))
				q.add(areaCode);
		}

		// AreaCode Enum 지역별로 나눈 것을 ListMap으로 만들기.
		List<Map<String, String>> seoul = Arrays.stream(cityList(b)).map(AreaCode -> {
			Map<String, String> map = new HashMap();
			map.put("cityName", AreaCode.getName());
			map.put("cityCode", AreaCode.getCode());
			return map;
		}).collect(Collectors.toList());

		List<Map<String, String>> gyeonggi = Arrays.stream(cityList(c)).map(AreaCode -> {
			Map<String, String> map = new HashMap();
			map.put("cityName", AreaCode.getName());
			map.put("cityCode", AreaCode.getCode());
			return map;
		}).collect(Collectors.toList());

		List<Map<String, String>> incheon = Arrays.stream(cityList(d)).map(AreaCode -> {
			Map<String, String> map = new HashMap();
			map.put("cityName", AreaCode.getName());
			map.put("cityCode", AreaCode.getCode());
			return map;
		}).collect(Collectors.toList());

		List<Map<String, String>> gangwon = Arrays.stream(cityList(e)).map(AreaCode -> {
			Map<String, String> map = new HashMap();
			map.put("cityName", AreaCode.getName());
			map.put("cityCode", AreaCode.getCode());
			return map;
		}).collect(Collectors.toList());

		List<Map<String, String>> chungnam = Arrays.stream(cityList(f)).map(AreaCode -> {
			Map<String, String> map = new HashMap();
			map.put("cityName", AreaCode.getName());
			map.put("cityCode", AreaCode.getCode());
			return map;
		}).collect(Collectors.toList());

		List<Map<String, String>> daejeon = Arrays.stream(cityList(g)).map(AreaCode -> {
			Map<String, String> map = new HashMap();
			map.put("cityName", AreaCode.getName());
			map.put("cityCode", AreaCode.getCode());
			return map;
		}).collect(Collectors.toList());

		List<Map<String, String>> chungbuk = Arrays.stream(cityList(h)).map(AreaCode -> {
			Map<String, String> map = new HashMap();
			map.put("cityName", AreaCode.getName());
			map.put("cityCode", AreaCode.getCode());
			return map;
		}).collect(Collectors.toList());

		List<Map<String, String>> busan = Arrays.stream(cityList(i)).map(AreaCode -> {
			Map<String, String> map = new HashMap();
			map.put("cityName", AreaCode.getName());
			map.put("cityCode", AreaCode.getCode());
			return map;
		}).collect(Collectors.toList());

		List<Map<String, String>> ulsan = Arrays.stream(cityList(j)).map(AreaCode -> {
			Map<String, String> map = new HashMap();
			map.put("cityName", AreaCode.getName());
			map.put("cityCode", AreaCode.getCode());
			return map;
		}).collect(Collectors.toList());

		List<Map<String, String>> daegu = Arrays.stream(cityList(k)).map(AreaCode -> {
			Map<String, String> map = new HashMap();
			map.put("cityName", AreaCode.getName());
			map.put("cityCode", AreaCode.getCode());
			return map;
		}).collect(Collectors.toList());

		List<Map<String, String>> gyeongbuk = Arrays.stream(cityList(l)).map(AreaCode -> {
			Map<String, String> map = new HashMap();
			map.put("cityName", AreaCode.getName());
			map.put("cityCode", AreaCode.getCode());
			return map;
		}).collect(Collectors.toList());

		List<Map<String, String>> gyeongnam = Arrays.stream(cityList(m)).map(AreaCode -> {
			Map<String, String> map = new HashMap();
			map.put("cityName", AreaCode.getName());
			map.put("cityCode", AreaCode.getCode());
			return map;
		}).collect(Collectors.toList());

		List<Map<String, String>> jeollanam = Arrays.stream(cityList(n)).map(AreaCode -> {
			Map<String, String> map = new HashMap();
			map.put("cityName", AreaCode.getName());
			map.put("cityCode", AreaCode.getCode());
			return map;
		}).collect(Collectors.toList());

		List<Map<String, String>> gwangju = Arrays.stream(cityList(o)).map(AreaCode -> {
			Map<String, String> map = new HashMap();
			map.put("cityName", AreaCode.getName());
			map.put("cityCode", AreaCode.getCode());
			return map;
		}).collect(Collectors.toList());

		List<Map<String, String>> jeollabuk = Arrays.stream(cityList(p)).map(AreaCode -> {
			Map<String, String> map = new HashMap();
			map.put("cityName", AreaCode.getName());
			map.put("cityCode", AreaCode.getCode());
			return map;
		}).collect(Collectors.toList());

		List<Map<String, String>> jeju = Arrays.stream(cityList(q)).map(AreaCode -> {
			Map<String, String> map = new HashMap();
			map.put("cityName", AreaCode.getName());
			map.put("cityCode", AreaCode.getCode());
			return map;
		}).collect(Collectors.toList());

		// 변환된 ListMap을 JsonArray 형식으로 변환
		List<JSONObject> seoul1 = cityJson(seoul);
		List<JSONObject> gyeonggi1 = cityJson(gyeonggi);
		List<JSONObject> incheon1 = cityJson(incheon);
		List<JSONObject> gangwon1 = cityJson(gangwon);
		List<JSONObject> chungnam1 = cityJson(chungnam);
		List<JSONObject> daejeon1 = cityJson(daejeon);
		List<JSONObject> chungbuk1 = cityJson(chungbuk);
		List<JSONObject> busan1 = cityJson(busan);
		List<JSONObject> ulsan1 = cityJson(ulsan);
		List<JSONObject> daegu1 = cityJson(daegu);
		List<JSONObject> gyeongbuk1 = cityJson(gyeongbuk);
		List<JSONObject> gyeongnam1 = cityJson(gyeongnam);
		List<JSONObject> jeollanam1 = cityJson(jeollanam);
		List<JSONObject> gwangju1 = cityJson(gwangju);
		List<JSONObject> jeollabuk1 = cityJson(jeollabuk);
		List<JSONObject> jeju1 = cityJson(jeju);

		// list 순서로 넘겨주기 위해 list 를 만들어(index) 저장
		areaCodeList.add(seoul1);
		areaCodeList.add(gyeonggi1);
		areaCodeList.add(incheon1);
		areaCodeList.add(gangwon1);
		areaCodeList.add(chungnam1);
		areaCodeList.add(daejeon1);
		areaCodeList.add(chungbuk1);
		areaCodeList.add(busan1);
		areaCodeList.add(ulsan1);
		areaCodeList.add(daegu1);
		areaCodeList.add(gyeongbuk1);
		areaCodeList.add(gyeongnam1);
		areaCodeList.add(jeollanam1);
		areaCodeList.add(gwangju1);
		areaCodeList.add(jeollabuk1);
		areaCodeList.add(jeju1);

		return areaCodeList;

	};

	// 알파벳 순으로 지역 나누기.
	public AreaCode[] cityList(List<AreaCode> areaCode) {
		List<AreaCode> group = new ArrayList<>();

		for (AreaCode ac : areaCode)
			group.add(ac);

		int size = 0;
		AreaCode[] cityList = new AreaCode[group.size()];

		for (AreaCode ac : group) {
			cityList[size++] = ac;
		}

		return cityList;
	}

	// 도시 리스트를 제이슨 타입 리스트로 바꾸기.
	public List<JSONObject> cityJson(List<Map<String, String>> list) {

		JSONArray jrr = new JSONArray();

		List<JSONObject> jsonList = new ArrayList();

		for (Map m : list) {
			JSONObject json = new JSONObject(m);
			jrr.add(m);

			// jsonList.add(json);
		}

		return jrr;
	}

	// 도시 리스트를 제이슨 타입 리스트로 바꾸기.
	public List<JSONObject> cityJson1(List<Map<String, Object>> list) {

		JSONArray jrr = new JSONArray();

		for (Map m : list) {
			JSONObject json = new JSONObject(m);
			jrr.add(m);

		}
		return jrr;
	}

}
