package DANIM.Project.Service;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DANIM.Project.Mapper.UserMapper;
import DANIM.Project.Vo.UserVO;

@Service
public class UserService {

	@Autowired
	private UserMapper userMapper;

    public List<HashMap<String, Object>> getUsers() throws Exception{		
        return userMapper.selectUsers();
    }
    
	public int userSave(HashMap<String, Object> map) throws Exception{		
		return userMapper.userSave(map);
	}


	public Map<String, Object> getByUserIdAndPassword(HashMap<String, Object> map) throws Exception{	
		return userMapper.getByUserIdAndPassword(map);	
	}
	


	public UserVO findId(UserVO vo) {
		return userMapper.findId(vo);
	}

//	public UserVO findPassword(UserVO vo) {
//		return userMapper.findPassword(vo);
//	}
//
//	public void updatePassword(UserVO vo) {
//		userMapper.updatePassword(vo);
//	}
}
