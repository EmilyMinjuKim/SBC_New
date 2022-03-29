package kr.co.soft.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.soft.bean.BoardBean;
import kr.co.soft.bean.ChipBean;
import kr.co.soft.bean.DogBean;
import kr.co.soft.domain.BoardListDTO;
import kr.co.soft.mapper.BoardMapper;

@Repository
public class BoardDao {

	@Autowired
	BoardMapper boardMapper;

	public void addChipInfo(ChipBean chip) {
		boardMapper.addChipInfo(chip);
	};

	public boolean addDogInfo(DogBean dog) {
		return boardMapper.addDogInfo(dog);
	};

	public boolean addBoardContent(BoardBean boardContent) {
		return boardMapper.addBoardContent(boardContent);
	};


	public List<BoardListDTO> getBoardList(RowBounds rowBounds) {
		return boardMapper.getBoardList(rowBounds);
	};

	// 칩 넘버 중복 체크
	public String checkRFID(String chip_num) {
		System.out.println("chip_num: dao - "+chip_num);
		return boardMapper.checkRFID(chip_num);
	};
	
	//게시글 카운트
	public int getContentCnt() {
		return boardMapper.getContentCnt();
	}
	
	
	public void modifyChipInfo(ChipBean chip) {
		boardMapper.modifyChipInfo(chip);
	};

//	public boolean modifyDogInfo(DogBean dog) {
//		return boardMapper.modifyDogInfo(dog);
//	};
//
//	public boolean modifyBoardContent(BoardBean boardContent) {
//		return boardMapper.modifyBoardContent(boardContent);
//	};
	
	
	
//	public void modifyChipInfo(BoardListDTO modifyBean) {
//		boardMapper.modifyChipInfo(modifyBean);
//	};
//
//	public boolean modifyDogInfo(BoardListDTO modifyBean) {
//		return boardMapper.modifyDogInfo(modifyBean);
//	};
//
//	public boolean modifyBoardContent(BoardListDTO modifyBean) {
//		return boardMapper.modifyBoardContent(modifyBean);
//	};
	
	
}
