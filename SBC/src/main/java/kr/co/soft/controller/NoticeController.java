package kr.co.soft.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.soft.bean.NoticeBean;
import kr.co.soft.bean.PageNoticeBean;
import kr.co.soft.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	@GetMapping("/noticemain")
	public String main(NoticeBean noticeBean, @RequestParam(value = "page", defaultValue = "1") int page, 
			Model model) {

		List<NoticeBean> NoticeList = noticeService.getMainList(noticeBean, page);
		
		PageNoticeBean pageBean=noticeService.getNoticeCnt(page);
		
		model.addAttribute("noticeBean", noticeBean);
		model.addAttribute("NoticeList", NoticeList);
		model.addAttribute("pageBean", pageBean); //전체글의 갯수
		model.addAttribute("page", page);
		

		return "notice/main_notice";
	}

	@GetMapping("/indexmain")
	public String index() {

		return "notice/index";
	}

	@GetMapping("/write")
	public String write() {

		return "notice/write_notice";
	}

	@PostMapping("/write_pro")
	public String write_pro(NoticeBean noticeBean) {

		noticeService.addNoticeInfo(noticeBean);

		return "notice/write_success";
	}

	@GetMapping("/read")
	public String read(@RequestParam("notice_idx") int notice_idx,
						@RequestParam(value = "page", defaultValue = "1") int page,
						NoticeBean noticeBean, Model model) {

		NoticeBean readNoticeBean = noticeService.getNoticeInfo(notice_idx);
		
		model.addAttribute("readNoticeBean", readNoticeBean);
		model.addAttribute("page", page);

		return "notice/read_notice";
	}

	@GetMapping("/update")
	public String update(@RequestParam("notice_idx") int notice_idx,
			@RequestParam("page") int page,
			NoticeBean updateNoticeBean, Model model) {

		NoticeBean tempNoticeBean = noticeService.getNoticeInfo(notice_idx);

		updateNoticeBean.setNotice_subject(tempNoticeBean.getNotice_subject());
		updateNoticeBean.setNotice_text(tempNoticeBean.getNotice_text());
		updateNoticeBean.setNotice_file(tempNoticeBean.getNotice_file());
		updateNoticeBean.setNotice_idx(notice_idx);

		model.addAttribute("updateNoticeBean", updateNoticeBean);
		model.addAttribute("page", page);

		return "notice/update_notice";
	}

	@PostMapping("/update_pro")
	public String update_success(NoticeBean updateNoticeBean, @RequestParam("page") int page, Model model) {

		noticeService.UpdateNoticeInfo(updateNoticeBean);

		model.addAttribute("updateNoticeBean", updateNoticeBean);
		model.addAttribute("page", page);

		return "notice/update_success";
	}

	@GetMapping("/delete")
	public String delete(@RequestParam("notice_idx") int notice_idx, Model model) {

		noticeService.DeleteNoticeInfo(notice_idx);

		model.addAttribute("notice_idx", notice_idx);

		return "notice/delete_success";
	}

}
