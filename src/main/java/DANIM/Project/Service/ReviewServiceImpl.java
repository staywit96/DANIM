package DANIM.Project.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import DANIM.Project.Dao.ReviewDAO;
import DANIM.Project.Vo.ReviewVO;

@Service("reviewService")
@Transactional(propagation = Propagation.REQUIRED)
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	@Override
	public List<ReviewVO> listReviews(String placeID) throws Exception {
		return reviewDAO.selectAllReviewList(placeID);
	}
	
	@Override
	public int addReview(ReviewVO reviewVO) throws Exception {
		return reviewDAO.insertReview(reviewVO);
	}
	
	@Override
	public int delReview(int reviewID) throws Exception {
		return reviewDAO.deleteReview(reviewID);
	}
	
	@Override
	public int modReview(ReviewVO reviewVO) throws Exception {
		return reviewDAO.updateReview(reviewVO);
	}
	
	@Override
	public int changeLikesState() throws Exception {
		
		return reviewDAO.updateLikesState();
	}
	
	@Override
	public int isExistReview(ReviewVO reviewVO) throws Exception {
		
		return reviewDAO.existsReview(reviewVO);
	}
	
	@Override
	public float getRatingAvg(String placeID) throws Exception {
		return reviewDAO.avgRatings(placeID);
	}

	@Override
	public int getReviewId() throws Exception {
		//reviewID값 max + 1로 리턴
		return reviewDAO.maxReviewNum()+1;
	}

}
