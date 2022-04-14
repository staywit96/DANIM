package DANIM.Project.Mapper;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import DANIM.Project.Vo.UserVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface UserMapper {
	
    List<HashMap<String, Object>> selectUsers() throws Exception;

	int userSave(HashMap<String, Object> map) throws Exception;

	Map<String, Object> getByUserIdAndPassword(HashMap<String, Object> map) throws Exception;
	

	UserVO findId(UserVO vo);
	
//	UserVO findPassword(UserVO vo);
//	
//	void updatePassword(UserVO vo);
//	
	
	
}
