package kr.co.soft.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import kr.co.soft.bean.NoticeBean;
import kr.co.soft.bean.PageNoticeBean;
import kr.co.soft.dao.NoticeDao;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class NoticeService {

	@Autowired
	private NoticeDao noticeDao;
	
	//글 번호 10개씩
	@Value("${page.listcnt}")
	private int page_listcnt;
		
	//버튼 10개씩 
	@Value("${page.paginationcnt}")
	private int paginationcnt;
	
	@Value("${path.upload}") // 파일 업로드 위치
	private String path_upload;
	

	public void addNoticeInfo(NoticeBean noticeBean) {
		noticeDao.addNoticeInfo(noticeBean);
	}

	public List<NoticeBean> getMainList(NoticeBean noticeBean, int page) {
		
		//start 글번호 (0,10,20)
		
		int start=(page-1)*page_listcnt;
		RowBounds rowBounds=new RowBounds(start, page_listcnt); //10개씩 끊어줌
		
		return noticeDao.getMainList(noticeBean, rowBounds);
	}

	public NoticeBean getNoticeInfo(int notice_idx) {
		return noticeDao.getNoticeInfo(notice_idx);
	}

	public void UpdateNoticeInfo(NoticeBean updateNoticeBean) {
		noticeDao.UpdateNoticeInfo(updateNoticeBean);
	}

	public void DeleteNoticeInfo(int notice_idx) {
		noticeDao.DeleteNoticeInfo(notice_idx);
	}
	
	public PageNoticeBean getNoticeCnt(int currentPage) {
		
		//전체글의 갯수
		int current_cnt=noticeDao.getNoticeCnt();
				
		PageNoticeBean pageBean=new PageNoticeBean(current_cnt, currentPage, page_listcnt, paginationcnt);
				
		return pageBean;
	}
}
