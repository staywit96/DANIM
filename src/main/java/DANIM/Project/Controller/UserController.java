package DANIM.Project.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import DANIM.Project.Service.UserService;
import DANIM.Project.Vo.UserVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/pages/")
public class UserController {
	
	@Autowired
	private UserService userService;
	   
    public UserController(UserService userService){
        this.userService = userService;
    }
	
	
	@GetMapping("/Login")
	public String login() {		
		return "pages/Login";
	}

	@GetMapping("/SignUp")
	public String signForm() {		
		return "pages/SignUp";
	}
	
	@GetMapping("/Sign/FindId")
	public String FindIds() {		
		return "pages/Sign/FindId";
	}
	
	
	// 아이디 찾기 실행 
	@RequestMapping(value="findId", method=RequestMethod.POST)
	public String findIdAction(UserVO vo, Model model) {
		UserVO user = userService.findId(vo);
		
		if(user == null) { /* 값 있는 것으로만*/
			model.addAttribute("check", 1);
		} else { 
			model.addAttribute("check", 0);
			model.addAttribute("userId", user.getUserId());
		}
		
		return "pages/Sign/FindId";
	}
	
//	@RequestMapping(value = "/findid")
//	public String findId() {		
//		return "pages/Sign/FindId";
//	}
	
	
	/* 비밀번호 찾기 */
//	@RequestMapping(value="find_password", method=RequestMethod.POST)
//	public String findPasswordAction(UserVO vo, Model model) {
//		UserVO user = userService.findPassword(vo);
//		
//		if(user == null) { 
//			model.addAttribute("check", 1);
//		} else { 
//			model.addAttribute("check", 0);
//			model.addAttribute("updateid", user.getUserId());
//		}
//		
//		return "Sign/findPassword";
//	}
//   
//	@RequestMapping(value="update_password", method=RequestMethod.POST)
//	public String updatePasswordAction(@RequestParam(value="updateid", defaultValue="", required=false) String id,
//										UserVO vo) {
//		vo.setId(userId);
//		System.out.println(vo);
//		userService.updatePassword(vo);
//		return "member/findPasswordConfirm";
//	}
//	
//    // 비밀번호 바꾸기할 경우 성공 페이지 이동
//	@RequestMapping(value="check_password_view")
//	public String checkPasswordForModify(HttpSession session, Model model) {
//		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
//		
//		if(loginUser == null) {
//			return "Sign/Login";
//		} else {
//			return "mypage/checkformodify";
//		}
//	}
	
	
	
	/* 비밀번호 페이지 이동*/
	@GetMapping("/Sign/FindPw")
	public String findPw() {		
		return "pages/Sign/FindPw";
	}
	
	
	//회원가입
	@PostMapping("/SignUp")
	@ResponseBody
	public String sign(@RequestParam HashMap<String, Object> map) {	
		String msg="Duplicate";
		try {
			userService.userSave(map);			
			msg= "ok";
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}		
		
		return msg;
	}
    
	
	
	//로그인
	@PostMapping("/Login")
	@ResponseBody
	public String login(@RequestParam HashMap<String, Object> map, HttpSession session) {	
		String msg="login fail";
		try {
			Map<String, Object> result=userService.getByUserIdAndPassword(map);		
			System.out.println("반환값 :" +result.toString());
			session.setAttribute("LOGIN_ID", result.get("userId"));
			session.setAttribute("LOGIN_NAME", result.get("name"));
			session.setAttribute("PHONE", result.get("phone"));
			session.setAttribute("MAIL", result.get("mail"));
			session.setAttribute("NICKNAME", result.get("nickname"));
			msg= "로그인에 성공하셨습니다.";
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}		
		
		return msg;
	}
    
	
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	//정보 조회 회원 목록 http://localhost:8090/pages/users
    @ResponseBody
    @GetMapping("/MyPage/users")
    public List<HashMap<String, Object>> getUsers() throws Exception{    	
        return userService.getUsers();
    }


}