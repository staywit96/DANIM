package DANIM.Project.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import DANIM.Project.Service.MapService;
import DANIM.Project.Service.ReviewService;
import DANIM.Project.Vo.MapVO;
import DANIM.Project.Vo.ReviewVO;

@Controller
public class MapController {
	
	@Autowired
	private MapService mapService;
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	private ModelAndView main1(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value = "/map.do", method = RequestMethod.GET)
	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	//검색한 정보를 데이터베이스에 저장
	@RequestMapping(value="/datamap.do", method = RequestMethod.POST)
	@ResponseBody
	public int dataMap(MapVO mapVO) {

		if(mapService.checkProcess(mapVO.getId())==1) {
			return -1;
		}
		
		return mapService.insertProcess(mapVO);
	}
	
	//리뷰 목록 가져옴
	@RequestMapping(value="/getReviews.do", method = RequestMethod.POST)
	public @ResponseBody List<ReviewVO> getReviews(@RequestParam String placeID, HttpServletRequest request, Model model) throws Exception {
		List<ReviewVO> listReviews= reviewService.listReviews(placeID);
		
		return listReviews;
	}
	
	@RequestMapping(value="/writeReview.do",method = RequestMethod.POST)
    public @ResponseBody int writeReview(@RequestParam String placeID,@RequestParam float rating,@RequestParam String review,HttpServletRequest request) throws Exception{

        //현재 session에 저장된 아이디 가져오기 
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("LOGIN_ID");

        ReviewVO reviewVO = new ReviewVO();
        reviewVO.setId(userId);
        reviewVO.setPlaceID(placeID);

        //해당 장소에 대한 리뷰 존재 여부 확인 
        if(reviewService.isExistReview(reviewVO)==1) return -1;

        int reviewID = reviewService.getReviewId();
        reviewVO.setReviewID(reviewID);
        reviewVO.setRating(rating);
        reviewVO.setReview(review);

        return reviewService.addReview(reviewVO);
    }
	
	@RequestMapping(value="/delReview.do", method = RequestMethod.POST)
	public @ResponseBody int delReview(@RequestParam int reviewID) throws Exception {
		
		return reviewService.delReview(reviewID);
	}
	
	@RequestMapping(value="/modReview.do", method = RequestMethod.POST)
	public @ResponseBody int modReview(@RequestParam int reviewID,@RequestParam float rating,@RequestParam String review) throws Exception {
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setReviewID(reviewID);
		reviewVO.setRating(rating);
		reviewVO.setReview(review);
		return reviewService.modReview(reviewVO);
	}
	
	@RequestMapping(value="/avgRatings.do", method = RequestMethod.POST)
	public @ResponseBody float avgRatings(@RequestParam String placeID,Model model) throws Exception {
		return reviewService.getRatingAvg(placeID);
	}
	
}
