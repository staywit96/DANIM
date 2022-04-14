package DANIM.Project.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import DANIM.Project.Dto.QnaDTO;
import DANIM.Project.Mapper.QnaMapper;
import DANIM.Project.Paging.Criteria;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = false)
public class QnaServiceImpl implements QnaService {
	@Autowired
	private QnaMapper qnaMapper;

	@Override
	public void registerBoard(QnaDTO params) {
		qnaMapper.insertBoard(params);
	}

	@Override
	public QnaDTO getBoardDetail(Long QNA_Unique_Number) {
		return qnaMapper.selectBoardDetail(QNA_Unique_Number);
	}

	@Transactional
	public void updateBoard(QnaDTO params) {
		qnaMapper.updateBoard(params);
	}

	@Transactional
	public void deleteBoard(Long QNA_Unique_Number) {
		qnaMapper.deleteBoard(QNA_Unique_Number);
	}

	public int boardListCnt() {
		return qnaMapper.boardListCnt();
	}

	public List<Map<String, Object>> selectBoardList(Criteria cri) {
		return qnaMapper.selectBoardList(cri);
	}
	
	@Override
	public Long select() {
		return qnaMapper.selectqna();
	}
	
	public int updateView(Long QNA_Unique_Number) {
		return qnaMapper.updateView(QNA_Unique_Number);
	}

}
