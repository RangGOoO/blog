package dev.mvc.contents;

import java.io.File;

public class Paging {
	/** 페이지당 출력할 레코드 갯수 */
	public static int RECORD_PER_PAGE = 5;

	/** 블럭당 페이지 수, 하나의 블럭은 1개 이상의 페이지로 구성됨 */
	public static int PAGE_PER_BLOCK = 5;

	public static synchronized String getUploadDir() {
		String path = "";
		if (File.separator.equals("\\")) {
			// System.out.println("Windows 10");
			path = "C:/kd1/deploy/blog/contents/storage/";
		} else {
			// System.out.println("Linux");
			path = "/home/ubuntu/deploy/blog/contents/storage/";
		}

		return path;
	}
}
