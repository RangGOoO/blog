package dev.mvc.categrp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
categrpno                         NUMBER(7)     NOT NULL    PRIMARY KEY,
catename                          VARCHAR2(50)     NOT NULL,
seq                               NUMBER(7)    DEFAULT 0     NOT NULL,
cdate                                 DATE     NOT NULL 
*/

@Getter
@Setter
@ToString
public class CategrpVO {
	private int categrpno;
	private String catename;
	private int seq;
	private String cdate;
}
