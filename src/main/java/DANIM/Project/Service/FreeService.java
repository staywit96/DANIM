package DANIM.Project.Service;

import java.util.List;
import java.util.Map;

import DANIM.Project.Dto.FreeDTO;
import DANIM.Project.Paging.Criteria;

public interface FreeService {
	public void registerBoard(FreeDTO params);

	public FreeDTO getBoardDetail(Long FB_UQ);
	
	public void updateBoard(FreeDTO FB_UQ);

	public void deleteBoard(Long FB_UQ);

	public List<Map<String, Object>> selectBoardList(Criteria cri);

	public int boardListCnt();
	
	public Long selectfree();
	
	public int updateView(Long FB_UQ);
}
