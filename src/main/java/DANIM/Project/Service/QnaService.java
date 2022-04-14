package DANIM.Project.Service;

import java.util.List;
import java.util.Map;

import DANIM.Project.Dto.QnaDTO;
import DANIM.Project.Paging.Criteria;

public interface QnaService {
	public void registerBoard(QnaDTO params);
	
	public void updateBoard(QnaDTO params);

	public QnaDTO getBoardDetail(Long QNA_Unique_Number);

	public void deleteBoard(Long QNA_Unique_Number);

	public List<Map<String, Object>> selectBoardList(Criteria cri);

	public int boardListCnt();
	
	public Long select();
	
	public int updateView(Long QNA_Unique_Number);
}
