package kr.kh.spring.model.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date mo_date;
	private String mo_genre;
	private String mo_image;
	
	public MovieVO(String mo_image, String mo_title, String mo_content, int mo_time, String mo_age, Date mo_date, String mo_genre) {
		this.mo_image = mo_image;
		this.mo_title = mo_title;
		this.mo_content = mo_content;
		this.mo_time = mo_time;
		this.mo_age = mo_age;
		this.mo_date = mo_date;
		this.mo_genre = mo_genre;
	}
	
	
}



