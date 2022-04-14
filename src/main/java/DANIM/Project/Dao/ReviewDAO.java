package DANIM.Project.Dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import DANIM.Project.Vo.ReviewVO;

@Mapper
@Repository("reviewDAO")
public interface ReviewDAO {
	//모든 한줄평 리스트로 가져오기
	public List<ReviewVO> selectAllReviewList(String placeID) throws DataAccessException;
	
	//한줄평 추가
	public int insertReview(ReviewVO reviewVO) throws DataAccessException;
	
	//한줄평 삭제
	public int deleteReview(int reviewID) throws DataAccessException;
	
	//한줄평 수정
	public int updateReview(ReviewVO reviewVO) throws DataAccessException; 
	
	//장소 추천 상태 변경
	public int updateLikesState() throws DataAccessException;

	//한줄평 존재 여부 확인
	public int existsReview(ReviewVO reviewVO) throws DataAccessException;

	//장소 평점 평균 구하기
	public float avgRatings(String placeID) throws DataAccessException;
	
	//reviewID값(max+1) 설정하기 위해 reviewID속성의 max값 가져옴
	public int maxReviewNum() throws DataAccessException;

	
	
	
}
