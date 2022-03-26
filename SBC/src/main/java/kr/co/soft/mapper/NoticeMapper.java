package kr.co.soft.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import kr.co.soft.bean.NoticeBean;

public interface NoticeMapper {

	/*
	 * @SelectKey(statement = "select notice_seq.nextval from dual", keyProperty =
	 * "notice_idx", before = true, resultType = int.class)
	 */
	
	//Write 뷰
	@Insert("insert into notice(notice_idx, notice_writer, notice_subject, notice_text, "
			+ "notice_file,	 notice_date) values(notice_seq.nextval, #{notice_writer}, "
			+ "#{notice_subject}, #{notice_text, jdbcType=VARCHAR}, #{notice_file}, sysdate)")
	void addNoticeInfo(NoticeBean noticeBean);
	
	//Main 뷰
	@Select("select notice_idx, notice_writer, notice_subject, notice_text, notice_file, "
			+ "notice_date from notice order by notice_idx desc")
	List<NoticeBean> getMainList(NoticeBean noticeBean, RowBounds rowBounds);
	
	//Read 뷰
	@Select("select notice_writer, notice_subject, notice_text, notice_file from notice "
			+ "where notice_idx=#{notice_idx}")
	NoticeBean getNoticeInfo(int notice_idx);
	
	//Update 뷰
	@Update("update notice set notice_subject=#{notice_subject}, notice_text=#{notice_text}, "
			+ "notice_file=#{notice_file, jdbcType=VARCHAR} where notice_idx=#{notice_idx}")
	void UpdateNoticeInfo(NoticeBean updateNoticeBean);
	
	//Delete 뷰
	@Delete("delete from notice where notice_idx=#{notice_idx}")
	void DeleteNoticeInfo(int notice_idx);

	//Page 뷰
	@Select("select count(*) from notice")
	int getNoticeCnt();
}
