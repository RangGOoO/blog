package dev.mvc.contents;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ContentVO {
	private int contentno;
	private int adminno;
	private int cateno;
	private String title;
	private String content;
	private int recomcnt;
	private int clickcnt;
	private int replycnt;
	private String passwd;
	private String word;
	private String rdate;
	private String file1 = "";
	private String file1saved = ""; // 파일 이름 중복을 피하기 위한 컬럼
	private String thumb1 = "";
	private long size1;
	private MultipartFile file1MF;
}
