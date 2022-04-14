package DANIM.Project.Service;

import java.util.List;

import DANIM.Project.Vo.ReviewVO;

public interface ReviewService {
	public List<ReviewVO> listReviews(String placeID) throws Exception;	
	public int addReview(ReviewVO reviewVO) throws Exception;
	public int delReview(int reviewID) throws Exception;
	public int modReview(ReviewVO reviewVO) throws Exception;
	public int changeLikesState() throws Exception;
	public int isExistReview(ReviewVO reviewVO) throws Exception;
	public float getRatingAvg(String placeID) throws Exception;
	public int getReviewId() throws Exception;
}
