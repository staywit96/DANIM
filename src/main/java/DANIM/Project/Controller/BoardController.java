package DANIM.Project.Controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import DANIM.Project.Dto.BoardDTO;
import DANIM.Project.Dto.FreeDTO;
import DANIM.Project.Dto.QnaDTO;
import DANIM.Project.Paging.Criteria;
import DANIM.Project.Paging.Page;
import DANIM.Project.Paging.Paging;
import DANIM.Project.Service.BoardService;
import DANIM.Project.Service.FreeService;
import DANIM.Project.Service.QnaService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/board/**")
@RequiredArgsConstructor
@SpringBootApplication(scanBasePackages = { "com.map.service.FreeService" })
public class BoardController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private FreeService freeService;

	@Autowired
	private QnaService qnaService;

	@RequestMapping(value = "/board/write.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String openBoardWrite(@RequestParam(value = "RB_UQ", required = false) Long RB_UQ, Model model) {
		if (RB_UQ == null) {
			model.addAttribute("board", new BoardDTO());
		} else {
			BoardDTO board = boardService.getBoardDetail(RB_UQ);
			if (board == null) {
				return "redirect:/board/list.do";
			}
			model.addAttribute("board", board);
		}
		
		return "/Board/board_write_review";
	}

	@RequestMapping(value = "/board/writef.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String openFreeWrite(@RequestParam(value = "FB_UQ", required = false) Long FB_UQ, Model model) {
		if (FB_UQ == null) {
			model.addAttribute("Free", new FreeDTO());
		} else {
			FreeDTO free = freeService.getBoardDetail(FB_UQ);
			if (free == null) {
				return "redirect:/board/free.do";
			}
			model.addAttribute("free", free);
		}

		return "/Board/board_write_FREE";
	}

	@RequestMapping(value = "/board/writeq.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String openQnaWrite(@RequestParam(value = "QNA_Unique_Number", required = false) Long QNA_Unique_Number,
			Model model) {
		if (QNA_Unique_Number == null) {
			model.addAttribute("Qna", new QnaDTO());
		} else {
			QnaDTO qna = qnaService.getBoardDetail(QNA_Unique_Number);
			if (qna == null) {
				return "redirect:/board/qna.do";
			}
			model.addAttribute("qna", qna);
		}

		return "/Board/board_write_QNA";
	}

	@RequestMapping(value = "/board/register.do", method = { RequestMethod.POST, RequestMethod.GET })
    public String registerBoard(BoardDTO params) {
        boardService.registerBoard(params);

    	Long view = boardService.select();
        return "redirect:/board/view.do"+"?RB_UQ="+view;
    }

	@RequestMapping(value = "/board/registerf.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String registerFree(FreeDTO params) {
		freeService.registerBoard(params);
		
		Long view = freeService.selectfree();
		return "redirect:/board/viewf.do"+"?FB_UQ="+view;
	}

	@RequestMapping(value = "/board/registerq.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String registerQna(QnaDTO params) {
		qnaService.registerBoard(params);
		
		Long view = qnaService.select();
		return "redirect:/board/viewq.do"+"?QNA_Unique_Number="+view;
	}

	@GetMapping(value = "/board/list.do")
	public String openBoardList(BoardDTO params, Model model) {
		// 전체 글 개수
		int boardListCnt = boardService.boardListCnt();

		// 페이징 객체
		Paging paging = new Paging();
		paging.setCri(params);
		paging.setTotalCount(boardListCnt);

		List<BoardDTO> list = boardService.selectBoardList(params);
		for(int i = 0; i < list.size();i++) {
            BoardDTO dto = list.get(i);
            System.out.println("User_ID: "+dto.getUser_ID()+"RB_Contents: "+dto.getRB_Contents());
        }
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

		return "/Board/board_list_review";
	}

	
	@GetMapping(value = "/board/free.do")
	public String openFreeList(Criteria cri, Model model) {
		// 전체 글 개수
		int boardListCnt = freeService.boardListCnt();

		// 페이징 객체
		Paging paging = new Paging();
		paging.setCri(cri);
		paging.setTotalCount(boardListCnt);

		List<Map<String, Object>> list = freeService.selectBoardList(cri);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		return "/Board/board_list_FREE";
	}

	@GetMapping(value = "/board/qna.do")
	public String openQnaList(Criteria cri, Model model) {
		// 전체 글 개수
		int boardListCnt = qnaService.boardListCnt();

		// 페이징 객체
		Paging paging = new Paging();
		paging.setCri(cri);
		paging.setTotalCount(boardListCnt);

		List<Map<String, Object>> list = qnaService.selectBoardList(cri);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		return "/Board/board_list_QNA";
	}

	@GetMapping(value = "/board/view.do")
	public String openBoardDetail(@RequestParam(value = "RB_UQ", required = false) Long RB_UQ, Model model) {

		BoardDTO view = boardService.getBoardDetail(RB_UQ);
		boardService.updateView(RB_UQ);
		
		model.addAttribute("test", view);

		return "/Board/board_view_review";
	}

	@GetMapping(value = "/board/viewf.do")
	public String openFreeDetail(@RequestParam(value = "FB_UQ", required = false) Long FB_UQ, Model model) {
		FreeDTO view = freeService.getBoardDetail(FB_UQ);
		freeService.updateView(FB_UQ);
		model.addAttribute("testa", view);
		return "/Board/board_view_FREE";
	}

	@GetMapping(value = "/board/viewq.do")
	public String openQnaDetail(@RequestParam(value = "QNA_Unique_Number", required = false) Long QNA_Unique_Number,
			Model model) {
		QnaDTO view = qnaService.getBoardDetail(QNA_Unique_Number);
		qnaService.updateView(QNA_Unique_Number);
		model.addAttribute("test", view);
		return "/Board/board_view_QNA";
	}

	@RequestMapping(value = "/board/edit.do", method = { RequestMethod.POST, RequestMethod.GET, RequestMethod.DELETE })
	public String editBoard(@RequestParam(value = "params", required = false) BoardDTO params, Model model) {
		
		return "/Board/board_edit_review";
	}
	
	@RequestMapping(value="/board/rewrite.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String rewrite(@RequestParam(value = "params", required = false) BoardDTO params, Model model) {
		
		boardService.updateBoard(params);
		
		return "redirect:/board/view.do";
	}
	
	
	@RequestMapping(value = "/board/editf.do", method = { RequestMethod.POST, RequestMethod.GET, RequestMethod.DELETE })
	public String editFree() {

		return "/Board/board_edit_FREE";
	}

	
	@RequestMapping(value = "/board/editq.do", method = { RequestMethod.POST, RequestMethod.GET, RequestMethod.DELETE })
	public String editQna() {

		return "/Board/board_edit_QNA";
	}


	@RequestMapping(value = "/board/update.do", method = { RequestMethod.POST, RequestMethod.GET,
			RequestMethod.DELETE })
	public String updateBoard(BoardDTO params) {
		boardService.updateBoard(params);
		return "redirect:/board/view.do";
	}

	@RequestMapping(value = "/board/delete.do", method = { RequestMethod.POST, RequestMethod.GET,
            RequestMethod.DELETE })
    public String deleteBoard(@RequestParam("RB_UQ") Long RB_UQ,HttpSession session) {
        String loginID = (String)session.getAttribute("LOGIN_ID");
        String userID = boardService.findUserId(RB_UQ);

        if(loginID==userID)
            boardService.deleteBoard(RB_UQ);
        else
            System.out.println("삭제 불가");

        return "redirect:/board/list.do";
    }
	
	
	@RequestMapping(value = "/board/deletef.do", method = { RequestMethod.POST, RequestMethod.GET,
			RequestMethod.DELETE })
	public String deleteFree(@RequestParam("FB_UQ") Long FB_UQ) {
		freeService.deleteBoard(FB_UQ);

		return "redirect:/board/free.do";
	}
	
	@RequestMapping(value = "/board/deleteq.do", method = { RequestMethod.POST, RequestMethod.GET,
			RequestMethod.DELETE })
	public String deleteQna(@RequestParam("QNA_Unique_Number") Long QNA_Unique_Number) {
		qnaService.deleteBoard(QNA_Unique_Number);

		return "redirect:/board/qna.do";
	}
	
	@GetMapping(value="/board/getSearchList")
	@ResponseBody
	private List<BoardDTO> getSearchList(@RequestParam("type") String type,	
			@RequestParam("keyword") String keyword, Model model){
		BoardDTO params = new BoardDTO();
		params.setType(type);
		params.setKeyword(keyword);
		
		return boardService.getSearchList(params);
	}
	
	@RequestMapping(value = "/board/listPageSearch", method = RequestMethod.GET)
	public void getListPageSearch(Model model, @RequestParam("num") int num, 
			@RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType,
			   @RequestParam(value = "keyword",required = false, defaultValue = "") String keyword) {

	 
	 Page page = new Page();
	 
	 page.setNum(num);
	 page.setCount(boardService.count());  
	 
	 List<BoardDTO> list = null; 
	 //list = service.listPage(page.getDisplayPost(), page.getPostNum());
	 list = boardService.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
	 
	 model.addAttribute("list", list);
	 model.addAttribute("page", page);
	 model.addAttribute("select", num);
	 
	}
	
	
	
	
}