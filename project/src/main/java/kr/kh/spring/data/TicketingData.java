package kr.kh.spring.data;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TicketingData {
	private int ti_num;
	private int tl_num;
	private String id;
	private String mo_title;
	private String sc_name;
	private String se_name;
	private Date date;
	private String time;
}
