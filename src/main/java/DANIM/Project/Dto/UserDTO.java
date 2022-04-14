//package DANIM.Project.Dto;
//
//import org.mybatis.spring.SqlSessionTemplate;
//import org.springframework.beans.factory.annotation.Autowired;
//
//import DANIM.Project.Mapper.UserVO;
//
//public class UserDTO {
//
//	@Autowired
//	private SqlSessionTemplate mybatis;
//
//	
//
//	public UserVO findId(UserVO vo) {
//		System.out.println("==> Mybatis로 findId() 기능 처리");
//		return mybatis.selectOne("UserDAO.findId", vo);
//	}
//
//	public UserVO findPassword(UserVO vo) {
//		System.out.println("==> Mybatis로 findPassword() 기능 처리");
//		return mybatis.selectOne("UserDAO.findPassword", vo);
//	}
//
//	public void updatePassword(UserVO vo) {
//		System.out.println("==> Mybatis로 updatePassword() 기능 처리");
//		mybatis.update("UserDAO.updatePassword", vo);
//	}
//}
