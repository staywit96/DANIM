package DANIM.Project.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import DANIM.Project.Dto.BoardDTO;

@Mapper
public interface BoardMapper {

	public int insertBoard(BoardDTO params);

	public BoardDTO selectBoardDetail(Long RB_UQ);

	public void updateBoard(BoardDTO params);

	public void deleteBoard(Long RB_UQ);

	public List<BoardDTO> selectBoardList(BoardDTO params);

	public List<BoardDTO> selectSearchList(BoardDTO params);

	public int boardListCnt();

	public List<BoardDTO> listPageSearch(int displayPost, int postNum, String searchType, String keyword);

	public int count();

	public Long select();
	
	public int updateView(Long RB_UQ);
	
	public List<BoardDTO> selectsearch(BoardDTO boarddto);
	
	public String selectUserId(Long RB_UQ);

}