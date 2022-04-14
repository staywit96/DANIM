package DANIM.Project.Dto;

import java.time.LocalDateTime;

import lombok.Setter;

import lombok.Getter;

@Getter
@Setter
public class BoardDTO extends CommonDTO {
	private Long RB_UQ;
	private String RB_Title;
	private String RB_Contents;
	private String User_ID;
	private String RB_Img;
	private int RB_View;
	private int RB_Count;
	private int RB_Report;
	private LocalDateTime RB_Created;
	
	private String type;
	private String keyword;
	
	private String searchName;
	private String searchValue;
	
}
