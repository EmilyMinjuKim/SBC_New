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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.soft.bean.ProductBean;
import kr.co.soft.bean.UserBean;
import kr.co.soft.dao.UserDao;
import kr.co.soft.domain.BoardListDTO;
import kr.co.soft.domain.SearchDogDTO;
import kr.co.soft.mapper.BoardMapper;
import kr.co.soft.service.ProductService;

@Controller
public class MainController {
	
	 @Autowired
	 UserDao userDao;

   @Autowired
   BoardMapper boardMapper;
   
   @Autowired
   ProductService productService;
   
   @Resource(name = "loginUserBean")
   private UserBean loginUserBean;


   @GetMapping("/main")
   public String main(@CookieValue(value="user_id", required = false) Cookie cookie, HttpServletRequest request, 
		   				Model m) {
	   
	      //게시글
		  List<BoardListDTO> list = boardMapper.getMainAnimalList();
	      m.addAttribute("list", list);
	      
	      //제품 목록
	      List<ProductBean> productList = productService.getProductList();
	      m.addAttribute("productList", productList);
	      
	  //로그인 쿠키
	     if (cookie == null) {
	         System.out.println("테스트1");
	         return "main";
	      }

	   String user_id = cookie.getValue();
	      
	      UserBean loginUserBean2 = userDao.getLoginUserInfoByUser_id(user_id);
	      
	      if (loginUserBean2 == null) {
	         return "main";
	      }
	      
	      if (loginUserBean2.getEnabled() == 0) {
	         return "main";
	      }
	      
	      System.out.println("쿠기 체크" + loginUserBean2.getUser_id());
	      
	      loginUserBean.setUser_id(loginUserBean2.getUser_id());
	      loginUserBean.setAuthority(loginUserBean2.getAuthority());
	      loginUserBean.setEnabled(loginUserBean2.getEnabled());
	      loginUserBean.setUserLogin(true);
	      
	      m.addAttribute("loginUserBean", loginUserBean);
	      
	      HttpSession session = request.getSession(true);
	      session.setAttribute("loginUserBean", loginUserBean);
	      session.setMaxInactiveInterval(3600 * 60);

      return "main";
   }

   public static int INDENT_FACTOR = 6;

   @ResponseBody
   @GetMapping("/searchDog_pro")
   public Map<String, Object> search(@ModelAttribute("searchDogDTO") SearchDogDTO db) throws Exception {

      // api 요청 주소
      StringBuilder urlBuilder = new StringBuilder(
            " http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic");
      urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + db.getServiceKey());
      urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=6");
      urlBuilder.append("&" + URLEncoder.encode("upkind", "UTF-8") + "=417000");

      URL url = new URL(urlBuilder.toString());

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

      JSONObject xmlJSONObj = XML.toJSONObject(sb.toString());
      String jsonPrettyPrintString = xmlJSONObj.toString(INDENT_FACTOR);

      Map<String, Object> resultMap = new HashMap<>();

      try {
         ObjectMapper objectMapper = new ObjectMapper();
         Map<String, Object> map = new HashMap<>();
         map = objectMapper.readValue(jsonPrettyPrintString, new TypeReference<Map<String, Object>>() {
         });

         Map<String, Object> dataResponse = (Map<String, Object>) map.get("response");
         Map<String, Object> body = (Map<String, Object>) dataResponse.get("body");

         JSONObject dataResponseJson = new JSONObject(dataResponse);
         JSONObject bodyJson = new JSONObject(body);

         Map<String, Object> items = null;

         // items 여러개일때 배열로 받음.
         items = objectMapper.convertValue(body.get("items"), new TypeReference<Map<String, Object>>() {
         });

         List<Map<String, Object>> itemList = objectMapper.convertValue(items.get("item"),
               new TypeReference<List<Map<String, Object>>>() {
               });
         resultMap.put("data", itemList);

         // JSONObject itemsJson = new JSONObject(items);

      } catch (Exception e) {
         e.printStackTrace();
         System.err.println("RestApi 동물 서치 컨트롤러 에러. 값이 없을 가능성");

         resultMap.clear();
         // resultMap.put("Result", "0001"); // 예외가 발생 되었을 경우,

      }

      return resultMap;
   }

}