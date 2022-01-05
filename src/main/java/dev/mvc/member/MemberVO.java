package dev.mvc.member;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberVO {
	private int MEMBERNO;
	private String id;
	private String passwd;
	private String name;
	private String phone_num;
	private String address;
	private String address2;
	private String join_date;
	private int grade;
}
