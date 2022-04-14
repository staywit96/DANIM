package DANIM.Project.Dto;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FreeDTO {
	private long FB_UQ;
	private String FB_Title;
	private String FB_Contents;
	private String User_ID;
	private String FB_Img;
	private int FB_View;
	private int FB_Comment_Count;
	private int FB_Report;
	private LocalDateTime FB_Date_Created;
}
