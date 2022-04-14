package DANIM.Project.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pages/")
public class MyPageController {
	
	/*test url*/
	@GetMapping("/MyPage/Profile")
	public String profile() {
		return "pages/MyPage/Profile";
	}
	
	@GetMapping("/MyPage/View")
	public String view() {
		return "pages/MyPage/View";
	}
	
	@GetMapping("/MyPage/addplan")
	public String addplan() {
		return "pages/MyPage/addplan";
	}
	
	@GetMapping("/MyPage/delete")
	public String delete() {
		return "pages/MyPage/delete";
	}
	
	@GetMapping("/MyPage/update")
	public String modinfo() {
		return "pages/MyPage/update";
	}
	
	@GetMapping("/MyPage/Write")
	public String Write() {
		return "pages/MyPage/Write";
	}
	
	@GetMapping("/MyPage/admin")
	public String adminpage() {
		return "pages/MyPage/admin";
	}
	
	@GetMapping("/MyPage/boardView")
	public String Bcounting() {
		return "pages/MyPage/boardView";
	}
	
}
