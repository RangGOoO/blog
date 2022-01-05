package dev.mvc.cate;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
		cateno NUMERIC(10) NOT NULL PRIMARY KEY,
		name VARCHAR(50) NOT NULL,
		categrpno NUMERIC(10) NOT NULL,
		registdate DATE NOT NULL,
		contentcnt NUMERIC(10) NOT NULL,
*/

@Getter
@Setter
@ToString
public class CateVO {
	private int cateno;
	private String name;
	private int categrpno;
	private String registdate;
	private int contentcnt;
	
	@Override
	public String toString() {
		return "CateVO [cateno=" + cateno + ", name=" + name + ", categrpno=" + categrpno + ", registdate=" + registdate
				+ ", contentcnt=" + contentcnt + "]";
	}
	public int getCategrpno() {
		return this.categrpno;
	}
	

}
