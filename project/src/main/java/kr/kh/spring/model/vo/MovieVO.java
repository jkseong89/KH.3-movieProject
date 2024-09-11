package kr.kh.spring.model.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MovieVO {

	private int mo_num;
	private String mo_title;
	private String mo_content;
	private int mo_time;
	private String mo_age;
	private Date mo_date;
	private String mo_genre;
	private String mo_image;
}
