package edu.hi.prj.vo;

import java.sql.Timestamp;

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
public class BookingInfoVO {
	private int place_num;
	private int room_num;
	private String pname;
	private String rname;
	private int price;
}
