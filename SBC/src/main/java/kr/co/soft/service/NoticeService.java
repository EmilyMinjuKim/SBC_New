package kr.co.soft.service;

import java.io.File;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.soft.bean.NoticeBean;
import kr.co.soft.bean.PageNoticeBean;
import kr.co.soft.dao.NoticeDao;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class NoticeService {
	
	@Value("${path.upload}") // 파일 업로드 위치
	private String path_upload;
	
	//글 번호 10개씩
	@Value("${page.listcnt}")
	private int page_listcnt;
	
	//버튼 10개씩 
	@Value("${page.paginationcnt}")
	private int paginationcnt;

	@Autowired
	private NoticeDao noticeDao;
	
	// 파일 중복을 피하기 위한 메소드
	private String saveUploadFile(MultipartFile upload_file) {

		// 현재시간과 오리지널 파일네임
//		String file_name = System.currentTimeMillis()+"_"+upload_file.getOriginalFilename();
//		String file_name = System.currentTimeMillis() + "_" + upload_file.getName();
		String file_name = System.currentTimeMillis() + "_" + 
				FilenameUtils.getBaseName(upload_file.getOriginalFilename()) + "."+
					FilenameUtils.getExtension(upload_file.getOriginalFilename());

		try {
			// 경로와 파일네임
			upload_file.transferTo(new File(path_upload + "/" + file_name));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return file_name;
	}
	
	public void addNoticeInfo(NoticeBean noticeBean) {
		
		MultipartFile upload_file = noticeBean.getUpload_file();

		if (upload_file.getSize() > 0) {
			String file_name = saveUploadFile(upload_file);
			System.out.println(file_name);
			
			//오라클에 저장될 파일 이름으로 활용하는 코드
			noticeBean.setNotice_file(file_name);
		
		}
		
		noticeDao.addNoticeInfo(noticeBean);
	}

	public List<NoticeBean> getMainList(int page) {
		
		//start 글번호 (0,10,20)
		
		int start=(page-1)*page_listcnt;
		RowBounds rowBounds=new RowBounds(start, page_listcnt); //10개씩 끊어줌
		
		return noticeDao.getMainList(rowBounds);
	}
	
	public List<NoticeBean> getSearchList(String keyword, int page){
		
		//start 글번호 (0,10,20)
		
		int start=(page-1)*page_listcnt;
		RowBounds rowBounds=new RowBounds(start, page_listcnt); //10개씩 끊어줌
		
		return noticeDao.getSearchList(keyword, rowBounds);
	}

	public NoticeBean getNoticeInfo(int notice_idx) {
		return noticeDao.getNoticeInfo(notice_idx);
	}

	public void UpdateNoticeInfo(NoticeBean updateNoticeBean) {
		
		MultipartFile upload_file=updateNoticeBean.getUpload_file();
		
		if (upload_file.getSize() > 0) { //upload_file에 해당 파일이 있다면
			String file_name = saveUploadFile(upload_file);
			updateNoticeBean.setNotice_file(file_name);
			
		}
		
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
