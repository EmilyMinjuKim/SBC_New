package kr.co.soft.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.soft.bean.LikeBoardBean;
import kr.co.soft.bean.PageBean;
import kr.co.soft.bean.UserBean;
import kr.co.soft.domain.BoardDTO;
import kr.co.soft.domain.BoardListDTO;
import kr.co.soft.domain.BoardSearchDogHandler;
import kr.co.soft.domain.PageHandler;
import kr.co.soft.domain.SearchDogDTO;
import kr.co.soft.mapper.BoardMapper;
import kr.co.soft.mapperVO.AreaCodeMapperValue;
import kr.co.soft.service.BoardService;

@Controller
@RequestMapping("/board")
@SuppressWarnings({ "unchecked", "rawtypes" })
public class BoardController {
	BoardSearchDogHandler searchHandler = new BoardSearchDogHandler();

	@Autowired
	private BoardService boardService;

	@Autowired
	private BoardMapper boardMapper;

	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

	@GetMapping("/userBoard") // 타 회원의 글 갖고오기
	private String userBoard(@RequestParam("user") String user_id, Model m) {

		try {
			List<BoardListDTO> list = boardMapper.getMyWrite(user_id);
			m.addAttribute("list", list);
			m.addAttribute("user", user_id);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "board/userBoard";
	}

	@GetMapping("/myWrite") // 내가 쓴 글 갖고오기
	private String myWrite(Model m) {

		try {
			List<BoardListDTO> list = boardMapper.getMyWrite(loginUserBean.getUser_id());
			m.addAttribute("list", list);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "board/myWriteList";
	}

	// 관심 동물 갖고오기
	@GetMapping("/myAnimal")
	private String myAnimal(Model m) {
		List<Map<String, Object>> list = boardService.getAnimalList(loginUserBean.getUser_id());
		m.addAttribute("list", list);
		return "board/likeAnimalList";
	}

	@ResponseBody // 관심 글 체크
	@GetMapping("/likeCheck/{likeIdx}")
	public String likeCheck(@PathVariable("likeIdx") int likeIdx) {
		System.out.println("들어오는 숫자?" + likeIdx);

		return boardService.likeCheck(likeIdx);
	}

	// 관심글 리스트 갖고오기
	@GetMapping("/myBoard")
	private String myBoard(Model m) {
		List<BoardListDTO> list = boardMapper.getMyBoardList(loginUserBean.getUser_id());
		m.addAttribute("list", list);
		System.out.println("나의 관심 글" + list);
		return "board/likeBoardList";
	}

	@GetMapping("/boardList")
	public String boardList(@RequestParam("board_category") String board_category,
			@RequestParam(value = "page", defaultValue = "1") int page, Model m) {
		try {

			if (board_category.equals("all")) {
				List<BoardListDTO> list = boardService.getBoardList(page);
				boardService.getBoardList(list, boardMapper.getLikeBoardList(loginUserBean.getUser_id()));

				PageBean pageBean = boardService.getContentCnt(page);
				m.addAttribute("list", list);
				m.addAttribute("pageBean", pageBean);// 전체 글의 갯수
				m.addAttribute("page", page);
				m.addAttribute("category", board_category);
			} else {
				List<BoardListDTO> list = boardService.getCategoryList(board_category, page);
				boardService.getBoardList(list, boardMapper.getLikeBoardList(loginUserBean.getUser_id()));
				PageBean pageBean = boardService.getCategoryCnt(board_category, page);
				m.addAttribute("list", list);
				m.addAttribute("board_category", board_category); // 게시판 번호 식별
				m.addAttribute("pageBean", pageBean);// 전체 글의 갯수
				m.addAttribute("page", page);
				m.addAttribute("category", board_category);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return "board/boardList";
	}

	@GetMapping("/modify")
	public String modify(@ModelAttribute("modifyBean") BoardListDTO modifyBean, @RequestParam("b_no") int board_no,
			@RequestParam(value = "page") int page, Model m) {
		// 게시글 하나 가져오기(상세정보)
		BoardListDTO tempContentBean = boardMapper.getContentInfo(board_no);
		modifyBean.setBoard_num(tempContentBean.getBoard_num());
		modifyBean.setUser_id(tempContentBean.getUser_id());
		modifyBean.setWriter_phone(tempContentBean.getWriter_phone());
		modifyBean.setReg_time(tempContentBean.getReg_time());
		modifyBean.setModi_time(tempContentBean.getModi_time());
		modifyBean.setReadcount(tempContentBean.getReadcount());
		modifyBean.setDog_num(tempContentBean.getDog_num());
		modifyBean.setBoard_category(tempContentBean.getBoard_category());

		modifyBean.setBreed(tempContentBean.getBreed());
		modifyBean.setColor(tempContentBean.getColor());
		modifyBean.setSex(tempContentBean.getSex()); // param 값이 그대로 들어간다.
		modifyBean.setAge(tempContentBean.getAge());
		modifyBean.setWeight(tempContentBean.getWeight());
		modifyBean.setCharcteristic(tempContentBean.getCharcteristic());
		modifyBean.setNeutering(tempContentBean.getNeutering());
		modifyBean.setAddress1(tempContentBean.getAddress1());
		modifyBean.setAddress2(tempContentBean.getAddress2());
		modifyBean.setDog_content(tempContentBean.getDog_content());
		modifyBean.setOriginFile(tempContentBean.getOriginFile());
		modifyBean.setDog_img(tempContentBean.getDog_img());
		modifyBean.setHappen_date(tempContentBean.getHappen_date());

		modifyBean.setChip_num(tempContentBean.getChip_num());
		modifyBean.setDog_name(tempContentBean.getDog_name());
		modifyBean.setPhone(tempContentBean.getPhone());

		if (tempContentBean.getChip_num() == null) {
			m.addAttribute("chipExit", 0);
			System.out.println(tempContentBean.getChip_num() + "없을때 값");
		}

		else {
			m.addAttribute("chipExit", 1);
			System.out.println(tempContentBean.getChip_num() + "있을때 값");
		}

		m.addAttribute("neutering", tempContentBean.getNeutering());
		m.addAttribute("page", page);
		m.addAttribute("b_no", board_no);

		return "board/modify";
	}

	@PostMapping("/modify_pro")
	public String modify_pro(@Valid @ModelAttribute("modifyBean") BoardListDTO modifyBean, BindingResult result,
			@RequestParam(value = "page") int page, @RequestParam(value = "chipExit") int chipExit, Model m) {

		System.out.println("modifyBean - " + modifyBean + "칩 존재 여부??" + chipExit);
		try {
			if (result.hasErrors()) {
				System.out.println("업데이트 에러: " + result);
				return "board/modify";
			}

			boardService.modifyContentInfo(modifyBean, chipExit);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("수정실패");
		}
		m.addAttribute("page", page);

		return "board/modify_success";
	}

	@GetMapping("/delete")
	public String deleteBoard(@RequestParam("b_no") int board_no, @RequestParam("page") int page,
			@RequestParam("chip_num") String chip, Model m) {
		System.out.println("넘어오는 칩의 정보??" + chip);

		try {
			int rowCnt;

			if ("".equals(chip)) {
				rowCnt = boardMapper.deleteBoardContent(board_no);
			} else {
				rowCnt = boardMapper.deleteChip(chip);
				System.out.println(board_no + "보드넘버??");
			}

			m.addAttribute("page", page);
			// boardMapper.deleteBoardContent(board_no, user_id);
			m.addAttribute("msg", "success");
			if (rowCnt == 1) {
				return "redirect:/board/boardList?board_category=all";
			}
		} catch (Exception e) {
			System.out.println("페일인가요?");
			m.addAttribute("msg", "fail");
		}

		return "redirect:/board/boardList?board_category=all";
	}

	@GetMapping("/read")
	public String read(@RequestParam("b_no") int board_no, @RequestParam(value = "page", defaultValue = "1") int page,
			Model m) {

		try {

			BoardListDTO readContentBean = boardMapper.getContentInfo(board_no);
			boardService.updateReadcount(board_no, readContentBean.getUser_id());
			m.addAttribute("readContent", readContentBean);
			m.addAttribute("b_no", board_no);
			m.addAttribute("page", page);

		} catch (Exception e) {
			// TODO: handle exception
		}

		return "board/read";
	}

	@GetMapping("/write")
	public String write(@ModelAttribute("db") BoardDTO db) {

		return "board/write";
	}

	@ResponseBody // 칩 중복 체크
	@GetMapping("/checkRFID/{chip_num}")
	public String checkRFID(@PathVariable String chip_num) {
		return boardService.checkRFID(chip_num) + "";
	}

	@PostMapping("/write")
	public String write_pro(@Valid @ModelAttribute("db") BoardDTO db, BindingResult result) {

		if (result.hasErrors()) {
			System.out.println(result);

			return "board/write";

		}
		boardService.addContentInfo(db);
		return "redirect:/board/boardList?board_category=all";
	}

	@ResponseBody // 관심동물 등록
	@GetMapping("/addAnimal/{animal_code}")
	public String addAnimal(@PathVariable("animal_code") String animal_code) {
		return boardService.addAnimal(animal_code);

	}

	@GetMapping("/searchDog")
	public String getNoBeanCategories(@ModelAttribute("searchDogDTO") SearchDogDTO db, Model model) {
		List<AreaCodeMapperValue> city_list = searchHandler.cityCategory1(); // 도시 리스트 받기.
		model.addAttribute("city_list", city_list);
		return "board/searchDog";
	}

	public static int INDENT_FACTOR = 10;

	@ResponseBody
	@GetMapping("/searchDog_pro")
	public Map<String, Object> search(@ModelAttribute("searchDogDTO") SearchDogDTO db,
			@RequestParam(value = "pageNo", defaultValue = "1") String pageNo,
			@RequestParam(value = "state", defaultValue = "") String state) throws Exception {

		String bgnde = db.getBgnDate();
		bgnde = bgnde.substring(0, 4) + bgnde.substring(5, 7) + bgnde.substring(8, 10);

		String endde = db.getEndDate();// 검색 끝 날짜
		endde = endde.substring(0, 4) + endde.substring(5, 7) + endde.substring(8, 10);

		System.out.println("Db toString:" + db.toString() + "현재 페이지 넘버:" + pageNo + " state:종류" + state);

		// api 요청 주소
		StringBuilder urlBuilder = new StringBuilder(
				"http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic");
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + db.getServiceKey());
		urlBuilder.append("&" + URLEncoder.encode("bgnde", "UTF-8") + "=" + URLEncoder.encode(bgnde, "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("endde", "UTF-8") + "=" + URLEncoder.encode(endde, "UTF-8"));
		urlBuilder
				.append("&" + URLEncoder.encode("upkind", "UTF-8") + "=" + URLEncoder.encode(db.getUpkind(), "UTF-8"));
		urlBuilder.append(
				"&" + URLEncoder.encode("upr_cd", "UTF-8") + "=" + URLEncoder.encode(db.getAreaCode().trim(), "UTF-8"));// 지역
																														// 코드
		urlBuilder.append(
				"&" + URLEncoder.encode("org_cd", "UTF-8") + "=" + URLEncoder.encode(db.getCityCode().trim(), "UTF-8"));// 시,군
																														// 코드
		urlBuilder.append("&" + URLEncoder.encode("state", "UTF-8") + "=" + URLEncoder.encode(state.trim(), "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(pageNo, "UTF-8"));

		URL url = new URL(urlBuilder.toString());
		System.out.println("url:" + url);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");

		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;

		if (200 <= conn.getResponseCode() && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;

		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}

		rd.close();
		conn.disconnect();

		// System.out.println("xml 형식: "+sb);

		JSONObject xmlJSONObj = XML.toJSONObject(sb.toString());
		String jsonPrettyPrintString = xmlJSONObj.toString(INDENT_FACTOR);
		System.out.println(jsonPrettyPrintString); // json 형식 프린트

		Map<String, Object> resultMap = new HashMap<>();

		try {
			ObjectMapper objectMapper = new ObjectMapper();
			Map<String, Object> map = new HashMap<>();
			map = objectMapper.readValue(jsonPrettyPrintString, new TypeReference<Map<String, Object>>() {
			});

			Map<String, Object> dataResponse = (Map<String, Object>) map.get("response");
			Map<String, Object> body = (Map<String, Object>) dataResponse.get("body");
			// Map<String, Object> items = (Map<String, Object>) body.get("items");

			JSONObject dataResponseJson = new JSONObject(dataResponse);
			JSONObject bodyJson = new JSONObject(body);
			resultMap.put("Result", "0000"); // 올바르게 코드가 실행 되었을 경우,
			resultMap.put("numOfRows", bodyJson.get("numOfRows"));
			resultMap.put("pageNo", bodyJson.get("pageNo"));
			resultMap.put("totalCount", bodyJson.get("totalCount"));

			Map<String, Object> items = null;
			List<JSONObject> itemJList = null;

			if ((int) resultMap.get("totalCount") % 10 == 1) {
				// item 1개 일 때. 단일 map으로 받음.
				items = (Map<String, Object>) body.get("items");
				resultMap.put("data", items);
			} else {
				// items 여러개일때 배열로 받음.
				items = objectMapper.convertValue(body.get("items"), new TypeReference<Map<String, Object>>() {
				});

				List<Map<String, Object>> itemList = objectMapper.convertValue(items.get("item"),
						new TypeReference<List<Map<String, Object>>>() {
						}); // LinkedHashMap 변환 에러 >> object 컨버터로 변환해주기.
				itemJList = searchHandler.cityJson1(itemList);
				resultMap.put("data", itemJList);
			}

			JSONObject itemsJson = new JSONObject(items);

			System.out.println();
			System.out.println();
			System.out.println();

			// 페이징 처리
			int totalCnt = (int) resultMap.get("totalCount"); // 총 갯수
			int nowPage = (int) resultMap.get("pageNo");// 현재 페이지
			int pageSize = (int) resultMap.get("numOfRows");
			PageHandler paging = new PageHandler(totalCnt, nowPage, pageSize);// numOfRows 한 페이지당 게시물 수 10

			resultMap.put("totalPage", paging.getTotalPage());
			resultMap.put("beginPage", paging.getBeginPage());
			resultMap.put("endPage", paging.getEndPage());
			resultMap.put("showPrev", paging.isShowPrev());
			resultMap.put("showNext", paging.isShowNext());
			System.out.println(resultMap.get("beginPage") + "페이지" + "  " + resultMap.get("endPage"));

		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("RestApi 동물 서치 컨트롤러 에러. 값이 없을 가능성");

			resultMap.clear();
			resultMap.put("Result", "0001"); // 예외가 발생 되었을 경우,

		}

		return resultMap;
	}

	@ResponseBody
	@GetMapping("/area1/{areaCode}") // 도시 선택1에 따른 옵션리스트
	public List<JSONObject> cityCategory(@PathVariable("areaCode") int areaCodeIndex) {
		System.out.println("areaCode?" + areaCodeIndex);

		// BoardSearchDogHandler searchHandler = new BoardSearchDogHandler();
		List<JSONObject> areaCodeList = searchHandler.cityCategory2(); // 도시 리스트2 받기.

		// 넘겨받은 인덱스 번호를 비교하여 해당하는 지역 리스트를 넘겨줌.
		if (areaCodeIndex < 8)
			areaCodeList = (List<JSONObject>) areaCodeList.get(areaCodeIndex - 1);
		else if (areaCodeIndex > 8)
			areaCodeList = (List<JSONObject>) areaCodeList.get(areaCodeIndex - 2);

		return areaCodeList;
	}

}
