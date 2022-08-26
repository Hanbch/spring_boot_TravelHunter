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
public class BookingVO{
	private int num;
	private int member_num;
	private int room_num;
	private int place_num;
	private String startdate;
	private String enddate;
	private String cname;
	private int cphone;
}
