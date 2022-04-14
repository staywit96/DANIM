package DANIM.Project.Vo;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;

@Data
public class UserVO {
	private String id;
	private String userId;
	private String password1;
	private String mail;
	private String name;
	private String nickname;
	private String phone;
	private Date joindate;
}
