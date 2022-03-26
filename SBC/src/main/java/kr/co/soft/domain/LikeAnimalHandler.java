package kr.co.soft.domain;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;


public class LikeAnimalHandler {

	public Map<String, Object> getAnimalInfo(String animal_code) {
		String url = "https://www.animal.go.kr/front/awtis/protection/protectionDtl.do?desertionNo=" + animal_code;
		Document doc = null;// Jsoup 에서 얻어온 HTML 전체 문서(DOM->Document Object Model)

		try {
			doc = Jsoup.connect(url).get();
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<AnimalDto> list = new ArrayList<>();

		Elements element = doc.select("tbody");
		String title = element.select("tr").text();
		//
		String imgFile = doc.select("img").first().attr("src").trim();
		String imgsrc = "https://www.animal.go.kr/front/fileMng/imageView.do?"
				+ imgFile.substring(imgFile.indexOf("?") + 1);

		List content = new ArrayList();
		for (Element el : element.select("td")) {
			content.add(el.text());
		}

		int size = content.size();

		for (int j = 0; j < size; j++) {
			list.add(new AnimalDto(j + "", content.get(j)));
		}
		System.out.println("content??" + content);
		list.add(new AnimalDto("img", imgsrc));

		Map<String, Object> info = list.stream()
				.collect(Collectors.toMap(AnimalDto::getTitle, AnimalDto::getInfo, (p1, p2) -> p1));
		info.put("animal_code", animal_code);
		// JSONObject json = new JSONObject(info);
		return info;
	}

}
