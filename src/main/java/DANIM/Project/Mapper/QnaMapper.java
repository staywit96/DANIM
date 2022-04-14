package DANIM.Project.Mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import DANIM.Project.Dto.QnaDTO;
import DANIM.Project.Paging.Criteria;

@Mapper
@Repository("qnaMapper")
public interface QnaMapper {
	public int insertBoard(QnaDTO params);

	public QnaDTO selectBoardDetail(Long QNA_Unique_Number);

	public void updateBoard(QnaDTO params);

	public void deleteBoard(Long QNA_Unique_Number);

	public List<Map<String, Object>> selectBoardList(Criteria cri);

	public int boardListCnt() ;
	public Long selectqna();
	
	public int updateView(Long QNA_Unique_Number);
}


