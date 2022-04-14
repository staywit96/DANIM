package DANIM.Project.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import DANIM.Project.Dao.MapDAO;
import DANIM.Project.Vo.MapVO;

@Service("mapService")
@Transactional(propagation = Propagation.REQUIRED)
public class MapServiceImpl implements MapService{
	
	@Autowired
	private MapDAO mapDAO;
	
	public MapServiceImpl(){
		
	}

	@Override
	public int insertProcess(MapVO map) throws DataAccessException {
		return mapDAO.insertMap(map);
	}

	@Override
	public int checkProcess(String placeId) throws DataAccessException {
		return mapDAO.checkMap(placeId);
	}
}
