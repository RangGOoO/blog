package dev.mvc.blog;

import java.io.File;

public class Test {

	public static void main(String[] args) {
		String user_dir = System.getProperty("user.dir");
		System.out.println("user_dir : " + user_dir);
		String path = "";

		if (File.separator.equals("\\")) {
			// System.out.println("Windows 10");
			path = "C:/kd1/deploy/resort_v1sbm3c/contents/storage";

		} else {
			// System.out.println("Linux");
			path = "/home/ubuntu/deploy/resort_v1sbm3c/contents/storage";
		}
		System.out.println(path);
	}

}
