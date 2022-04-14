package DANIM.Project.Service;

import java.util.List;

import DANIM.Project.Dto.BoardDTO;

public interface BoardService {

	public void registerBoard(BoardDTO params);
	
	public void updateBoard(BoardDTO params);

	public BoardDTO getBoardDetail(Long RB_UQ);

	public void deleteBoard(Long RB_UQ);

	public List<BoardDTO> selectBoardList(BoardDTO params);
	
	public List<BoardDTO> getSearchList(BoardDTO params);

	public int boardListCnt();
	
	public List<BoardDTO> listPageSearch(
			  int displayPost, int postNum, String searchType, String keyword) ;
	
	public int count();
	
	public Long select();
	
	public int updateView(Long RB_UQ);
	
	public List<BoardDTO> selectsearch(BoardDTO boarddto);
	
	public String findUserId(Long RB_UQ);
}