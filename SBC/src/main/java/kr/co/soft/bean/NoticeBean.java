package kr.co.soft.bean;

import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@ToString
@Getter
@Setter
public class NoticeBean {
	
	private int notice_idx;
	
	@NotBlank
	private String notice_writer;
	
	@NotBlank
	private String notice_subject;
	
	@NotBlank
	private String notice_text;
	
	
	private String notice_file;
	
	private String notice_date;
	
	private MultipartFile upload_file;
	
	
	
	
}
