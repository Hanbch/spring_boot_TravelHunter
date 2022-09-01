package edu.hi.prj.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO{
	private String id;
	private String mpw;
	private String mname;
	private String nick_name;
	private String memail;
	private int mphone;
	private int mbirth;
	private int payment;
	
	private int bid;
	private String btitle;
	private int auth_num;
	

}
