package kr.kh.spring.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class TicketingVO {
	int ti_num;
	int ti_adult;
	int ti_teenager;
	int ti_total;
	String ti_me_id;
	int ti_sd_num;
}
