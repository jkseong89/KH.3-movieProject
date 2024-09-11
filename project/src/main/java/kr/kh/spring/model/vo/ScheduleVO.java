package kr.kh.spring.model.vo;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ScheduleVO {
	int sd_num;
	String sd_time;
	Date sd_date;
	int sd_earyly;
	int sd_mo_num;
	int sd_sc_num;
}
