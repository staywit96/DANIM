package DANIM.Project.Service;

import org.springframework.dao.DataAccessException;

import DANIM.Project.Vo.MapVO;

public interface MapService {
	public int insertProcess(MapVO mapVO) throws DataAccessException;
	public int checkProcess(String placeId) throws DataAccessException;
}
