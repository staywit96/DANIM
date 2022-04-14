package DANIM.Project.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import DANIM.Project.Dto.BoardDTO;
import DANIM.Project.Mapper.BoardMapper;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = false)
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardMapper;

	@Transactional
	public void registerBoard(BoardDTO params) {
		boardMapper.insertBoard(params);
	}

	@Override
	public BoardDTO getBoardDetail(Long RB_UQ) {
		return boardMapper.selectBoardDetail(RB_UQ);
	}

	@Transactional
	public void updateBoard(BoardDTO params) {
		boardMapper.updateBoard(params);
	}

	@Transactional
	public void deleteBoard(Long RB_UQ) {
		boardMapper.deleteBoard(RB_UQ);
	}

	public int boardListCnt() {
		return boardMapper.boardListCnt();
	}

	public List<BoardDTO> selectBoardList(BoardDTO params) {
		List<BoardDTO> list = boardMapper.selectBoardList(params);
		for (int i = 0; i < list.size(); i++) {
			BoardDTO dto = list.get(i);
			System.out.println("User_ID: " + dto.getUser_ID() + "RB_Contents: " + dto.getRB_Contents());

		}
		return boardMapper.selectBoardList(params);
	}

	@Override
	public List<BoardDTO> getSearchList(BoardDTO params) {
		return boardMapper.selectSearchList(params);
	}

	@Override
	public List<BoardDTO> listPageSearch(int displayPost, int postNum, String searchType, String keyword) {
		return boardMapper.listPageSearch(displayPost, postNum, searchType, keyword);
	}

	@Override
	public int count() {
		return boardMapper.count();
	}

	@Override
	public Long select() {
		return boardMapper.select();
	}
	
	public int updateView(Long RB_UQ) {
		return boardMapper.updateView(RB_UQ);
	}

	public List<BoardDTO>selectsearch(BoardDTO boarddto){
		return boardMapper.selectsearch(boarddto);
	}
	
	public String findUserId(Long RB_UQ) {
        return boardMapper.selectUserId(RB_UQ);
    }
}