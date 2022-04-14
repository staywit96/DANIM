package DANIM.Project.Mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import DANIM.Project.Dto.FreeDTO;
import DANIM.Project.Paging.Criteria;

@Mapper
@Repository("freeMapper")
public interface FreeMapper {
	public int insertBoard(FreeDTO params);

	public FreeDTO selectBoardDetail(Long FB_UQ);

	public int updateBoard(FreeDTO params);

	public int deleteBoard(Long FB_UQ);

	public List<Map<String, Object>> selectBoardList(Criteria cri);
	
	public int boardListCnt() ;
	
	public Long selectfree();
	
	public int updateView(Long FB_UQ);
}
