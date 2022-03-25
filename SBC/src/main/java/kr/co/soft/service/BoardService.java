package kr.co.soft.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.soft.bean.BoardBean;
import kr.co.soft.bean.CareAnimal;
import kr.co.soft.bean.ChipBean;
import kr.co.soft.bean.DogBean;
import kr.co.soft.bean.LikeBoardBean;
import kr.co.soft.bean.PageBean;
import kr.co.soft.bean.UserlistBean;
import kr.co.soft.dao.BoardDao;
import kr.co.soft.domain.BoardDTO;
import kr.co.soft.domain.BoardListDTO;
import kr.co.soft.domain.LikeAnimalHandler;
import kr.co.soft.mapper.BoardMapper;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class BoardService {
	@Autowired
	private BoardDao boardDao;

	@Autowired
	private BoardMapper boardMapper;

	@Value("${path.upload}") // 파일 업로드 위치
	private String path_upload;

	@Value("${page.listcnt}") // 페이징 처리. 글 번호 10 개씩
	private int page_listcnt;

	@Value("${page.paginationcnt}") // 버튼 10 개씩
	private int paginationcnt;

	@Resource(name = "loginUserBean")
	private UserlistBean loginUserBean;

	private CareAnimal likeAnimal;

	private LikeAnimalHandler infoCrawling = new LikeAnimalHandler();

	// 관심글
	public String likeCheck(int idx) {
		String user_id = loginUserBean.getUser_id();
		user_id = "guest2";

		LikeBoardBean like = new LikeBoardBean();
		like.setBoard_num(idx);
		like.setUser_id(user_id);

		try {
			boardMapper.addLikeContent(like);
			return "true";
		} catch (Exception e) {
			boardMapper.deleteLikeContent(like);
			System.out.println("이미 등록 한 글! 좋아요 빼기");
		}
		return "false";
	}

	// 관심동물 추가
	public String addAnimal(String animal_code) {
		likeAnimal = new CareAnimal();
		likeAnimal.setAnimal_code(animal_code);
		likeAnimal.setUser_id("boardTest1");
		System.out.println(likeAnimal);
		try {
			boardMapper.addLikeAnimal(likeAnimal);
			return "true";
		} catch (Exception e) {
			boardMapper.deleteAnimal(likeAnimal);
			System.out.println("관심동물 삭제!");
		}
		return "false";
	}

	// 관심 동물 리스트 갖고오기
	public List<Map<String, Object>> getAnimalList(String user_id) {
		List<CareAnimal> list = boardMapper.getAnimalList(user_id);
		List<Map<String, Object>> animal_data = new ArrayList<>();

		for (CareAnimal animal_code : list) {
			animal_data.add(infoCrawling.getAnimalInfo(animal_code.getAnimal_code()));
		}
		return animal_data;
	}

	// 게시글 리스트 가져오기
	public List<BoardListDTO> getBoardList(int page) {
		// 1 >> 0~9
		// 2 >> 10~19
		// 3 >> 20~29

		// 페이징 start 글번호(0,10,20)
		int start = (page - 1) * page_listcnt;
		RowBounds rowBounds = new RowBounds(start, page_listcnt);

		return boardDao.getBoardList(rowBounds); // 10개씩 끊어줌.
	}

	public PageBean getContentCnt(int currentPage) {

		// 전체 글의 갯수
		int current_cnt = boardDao.getContentCnt();

		PageBean pageBean = new PageBean(current_cnt, currentPage, page_listcnt, paginationcnt);

		return pageBean;
	}

	// 게시글 입력
	void addBoardAllContent(BoardDTO boardInfo) {
		// 글쓴이 확인하고 넣어야함
		// 라이터에다가 loginuserbean 넣기

		boardInfo.getBoard().setUser_id("boardTest1");

		// 중성화 여부 체크
		if (boardInfo.getDog().getNeutering() == null)
			boardInfo.getDog().setNeutering("x");
		else
			boardInfo.getDog().setNeutering("o");

		// 칩셋 유무 체크
		if (!"".equals(boardInfo.getChip().getChip_num().trim())) {
			System.out.println("너 뭔데 들어오고 난리야?!!! " + boardInfo.getChip().getChip_num() + "<<<<");
			boardInfo.getDog().setChip_num(boardInfo.getChip().getChip_num());
			boardDao.addChipInfo(boardInfo.getChip());
		}

		System.out.println("서비스시작");
		if (boardDao.addDogInfo(boardInfo.getDog())) {
			System.out.println("도그 테이블 인서트 성공");
			if (boardDao.addBoardContent(boardInfo.getBoard())) {
				System.out.println("보드 insert 성공");
			} else {
				boardMapper.deleteBoardContent(boardInfo.getDog().getDog_num());
				System.out.println("보드 insert 실패하여 도그 삭제");
			}
		}
		System.out.println("서비스단 END");

	}

	// 칩 넘버 증복 체크
	public boolean checkRFID(String chip_num) {
		// int cn = Integer.parseInt(chip_num);
		if (boardDao.checkRFID(chip_num) == null)
			return true;
		else
			return false;
	}

	// 파일 중복을 피하기 위한 메소드
	private String saveUploadFile(MultipartFile up_file) {
		// 현재 시간
		long curTime = System.currentTimeMillis();
		SimpleDateFormat timeFormat = new SimpleDateFormat("yyyyMMddhhmmss");
		String time = timeFormat.format(new Date(curTime));

		// maven commons-io 추가
		String save_fileName = time + "_" + FilenameUtils.getBaseName(up_file.getOriginalFilename()) + "."
				+ FilenameUtils.getExtension(up_file.getOriginalFilename());

		try {
			// 경로와 파일 이름
			up_file.transferTo(new File(path_upload + "/" + save_fileName));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return save_fileName;
	}

	public void addContentInfo(BoardDTO boardInfo) {
		MultipartFile upload_file = boardInfo.getDog().getOriginFile();

		if (upload_file.getSize() > 0) {
			String file_name = saveUploadFile(upload_file);
			System.out.println("file name : " + file_name);

			// 오라클에 저장 될 파일 이름으로 활용하는 코드
			boardInfo.getDog().setDog_img(file_name);
		}
		// writeContentBean.setContent_writer_idx(loginUserBean.getUser_idx());
		addBoardAllContent(boardInfo);
	}

	public void modifyContentInfo(BoardListDTO modifyBean, int chipExit) {
		MultipartFile upload_file = modifyBean.getOriginFile();
		if (upload_file.getSize() > 0) {
			String file_name = saveUploadFile(upload_file);
			System.out.println("file name : " + file_name);

			// 오라클에 저장 될 파일 이름으로 활용하는 코드
			modifyBean.setDog_img(file_name);
		}
		// writeContentBean.setContent_writer_idx(loginUserBean.getUser_idx());
		modifyContentSet(modifyBean, chipExit);
	}

	// --------------------------------------------------------

	void modifyContentSet(BoardListDTO m, int chipExit) {
		// 글쓴이 확인하고 넣어야함

		// 중성화 여부 체크
		if (m.getNeutering() == null)
			m.setNeutering("x");
		else
			m.setNeutering("o");
		System.out.println("칩셋이 있었는지 없었는지?" + chipExit);

		// 칩셋 유무 체크
		if (!"".equals(m.getChip_num())) {
			ChipBean chip = new ChipBean();
			chip.setChip_num(m.getChip_num());
			chip.setDog_name(m.getDog_name());
			chip.setPhone(m.getPhone());
			// chip테이블 넣기
			if (chipExit == 0) {
				boardDao.addChipInfo(chip);
				System.out.println("없으면 여기");
			} else if (chipExit == 1) {
				System.out.println("있으면 여기");
				boardDao.modifyChipInfo(chip);
			}
		}
		System.out.println("서비스시작");

		DogBean d = new DogBean();
		d.setDog_num(m.getDog_num());
		d.setBreed(m.getBreed());
		d.setColor(m.getColor());
		d.setSex(m.getSex());
		d.setAge(m.getAge());
		d.setWeight(m.getWeight());
		d.setCharcteristic(m.getCharcteristic());
		d.setNeutering(m.getNeutering());
		d.setAddress1(m.getAddress1());
		d.setAddress2(m.getAddress2());
		d.setDog_content(m.getDog_content());
		d.setChip_num(m.getChip_num());
		d.setOriginFile(m.getOriginFile());
		d.setDog_img(m.getDog_img());
		d.setHappen_date(m.getHappen_date());

		BoardBean b = new BoardBean();
		b.setBoard_num(m.getBoard_num());
		b.setUser_id(m.getUser_id());
		b.setWriter_phone(m.getWriter_phone());
		b.setReg_time(m.getReg_time());
		b.setReadcount(m.getReadcount());
		b.setDog_num(m.getDog_num());
		b.setBoard_category(m.getBoard_category());

		System.out.println("여기나와??");

		if (boardDao.modifyDogInfo(d)) {
			System.out.println("도그 테이블 업데이트 성공");
			if (boardDao.modifyBoardContent(b)) {
				System.out.println("보드 업데이트 성공");
			} else {
				// boardMapper.deleteBoardContent(modifyBean.getDog_num());
				System.out.println("보드 업데이트 실패");
			}
		}
		System.out.println("서비스단 END");

	}

}
