package DANIM.Project.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import DANIM.Project.Dto.FreeDTO;
import DANIM.Project.Mapper.FreeMapper;
import DANIM.Project.Paging.Criteria;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = false)
public class FreeServiceImpl implements FreeService{
	@Autowired
	private FreeMapper freeMapper;

	@Override
	public void registerBoard(FreeDTO params) {
		freeMapper.insertBoard(params);
	}

	@Override
	public FreeDTO getBoardDetail(Long FB_UQ) {
		return freeMapper.selectBoardDetail(FB_UQ);
	}

	@Transactional
	public void updateBoard(FreeDTO params) {
		freeMapper.updateBoard(params);
	}

	@Transactional
	public void deleteBoard(Long FB_UQ) {
		freeMapper.deleteBoard(FB_UQ);
	}
	
	public int boardListCnt() {
		return freeMapper.boardListCnt();
	}

	public List<Map<String, Object>> selectBoardList(Criteria cri) {
		return freeMapper.selectBoardList(cri);
	}
	
	@Override
	public Long selectfree() {
		return freeMapper.selectfree();
	}
	
	public int updateView(Long FB_UQ) {
		return freeMapper.updateView(FB_UQ);
	}
}
