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
public class BoardVO{
   private int id;
   private String member_id;
   private int place_num;
   private int board_type_num;
   private String btitle;
   private String bcontent;
   private Timestamp bdate;
   private double bgrade;
   private int bview;
   private int rnum;
   private int realrow;
   
   private int reply;
   private int count;
   private int likecount;
   
  
   
}