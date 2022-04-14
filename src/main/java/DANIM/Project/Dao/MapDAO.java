package DANIM.Project.Dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import DANIM.Project.Vo.MapVO;

@Mapper
@Repository("mapDAO")
public interface MapDAO {
	public int checkMap(String placeId) throws DataAccessException;
	public int insertMap(MapVO mapVO) throws DataAccessException;	
}
