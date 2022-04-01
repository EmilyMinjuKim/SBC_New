package kr.co.soft.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.soft.bean.NoticeBean;
import kr.co.soft.mapper.NoticeMapper;

@Repository
public class NoticeDao {
	
	@Autowired
	private NoticeMapper noticeMapper;

	public void addNoticeInfo(NoticeBean noticeBean) {
		noticeMapper.addNoticeInfo(noticeBean);
	}
	
	public List<NoticeBean> getMainList(RowBounds rowBounds) {
		return noticeMapper.getMainList(rowBounds);
	}
	
	public List<NoticeBean> getSearchList(String keyword, RowBounds rowBounds){
		return noticeMapper.getSearchList(keyword, rowBounds);
	}
	
	public NoticeBean getNoticeInfo(int notice_idx) {
		return noticeMapper.getNoticeInfo(notice_idx);
	}
	
	public void UpdateNoticeInfo(NoticeBean updateNoticeBean) {
		noticeMapper.UpdateNoticeInfo(updateNoticeBean);
	}
	
	public void DeleteNoticeInfo(int notice_idx) {
		noticeMapper.DeleteNoticeInfo(notice_idx);
	}
	
	public int getNoticeCnt() {
	 	return noticeMapper.getNoticeCnt();
	}
}
