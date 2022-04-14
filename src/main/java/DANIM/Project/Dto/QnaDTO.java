package DANIM.Project.Dto;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class QnaDTO {
	private long QNA_Unique_Number;
	private String QNA_Title;
	private String QNA_Contents;
	private String User_ID;
	private String QNA_Img;
	private int QNA_Comment_Count;
	private int QNA_Report;
	private LocalDateTime QNA_Date_Created;
}
