package com.kedu.controllers;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kedu.dao.AttachmentDAO;
import com.kedu.dao.BoardDAO;
import com.kedu.dao.PostLikeDAO;
import com.kedu.dao.ReplyDAO;
import com.kedu.dao.VisitLogDAO;
import com.kedu.dto.AttachmentDTO;
import com.kedu.dto.BoardDTO;
import com.kedu.dto.ReplyDTO;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private Gson gson;

	@Autowired
	private BoardDAO dao;
	@Autowired
	private ReplyDAO ReplyDao;
	@Autowired
	private VisitLogDAO vdao;
	@Autowired
	private PostLikeDAO likeDao;
	@Autowired
	private AttachmentDAO aDao;
	
	@RequestMapping("/write")
	   public String write_lifeInfo(HttpSession session) {
	      
	      String loginId = (String)session.getAttribute("loginId");
	      
	      if(loginId == null) {
	         return "redirect:/members/loginUi";
	      }
	      
	      return "board/write";
	   }
	   
	   // 모든 글쓰기
		@RequestMapping("/insert")
	   public String insert(BoardDTO dto,MultipartFile[] files, HttpSession session) throws Exception{
	       
	      
		int nextval = dao.getNextval();
		System.out.println(nextval);
		String post_category = dto.getPost_category();
		String savePath = "c:/files";
		File savePathFile = new File(savePath);
		
		if(!savePathFile.exists()) {
			savePathFile.mkdir();
		}
		
		for(MultipartFile file:files){
			if(!file.isEmpty()) {
				String oriName = file.getOriginalFilename();
				String sysName = UUID.randomUUID() + "_" + oriName;
				file.transferTo(new File(savePath + "/" + sysName));
				aDao.insert(new AttachmentDTO(nextval,post_category,nextval,oriName,sysName));	
			}
		}
		
		String mem_id = (String)session.getAttribute("loginId");
	      String mem_nickname = (String)session.getAttribute("nickname");
	      String mem_dong = (String)session.getAttribute("dong");
	      dao.insert(dto, mem_id, mem_nickname, mem_dong);
	      	      
	      if("lifeInfo".equals(post_category)) {
	         return "redirect:/board/lifeInfo";
	      }else if("talk".equals(post_category)) {
	         return "redirect:/board/talk";
	      }else if("food".equals(post_category)) {
	         return "redirect:/board/food";
	      }else if("beauty".equals(post_category)) {
	         return "redirect:/board/beauty";
	      }
	      
	      return "redirect:/";
	   }
	   
	   // 고민/이야기 게시판 리스트 출력
	   @RequestMapping("/talk")
	   public String concern(String sort, Model model, HttpSession session) throws Exception {
	         
	      // 기본 정렬
	      if(sort == null) {
	         sort = "latest";
	      }
	      List<BoardDTO> list;
	          
	      // 출력을 어떤 종류를 기준으로 할 지 검사
	      if ("like".equals(sort)) {
	         list = dao.list_concern_like();
	      }else {
	         list = dao.list_concern_latest();
	      }
	      
	      // 하트 수 확인 시 loginId를 기준으로 체크해야되서 아이디 값 가져옴.
	       String loginId = (String)session.getAttribute("loginId");
	       
	       LikeStatus(list, loginId); // 하트 수 체크하는 메서드 실행 -> 여기서 set으로 상태(0, 1 ) 담아줌.
	       
	      model.addAttribute("list", list);
	      model.addAttribute("sort",sort);

	      return "board/concern";
	   }
	      
	   //생활정보 jsp에 생활정보 카테고리 list만 출력
	   @RequestMapping("/lifeInfo")
	   public String lifeInfo(String sort, Model model, HttpSession session) throws Exception{
	      
	      // 기본 정렬
	      if(sort == null) {
	         sort = "latest";
	      }
	       List<BoardDTO> list;
	       
	       // 출력을 어떤 종류를 기준으로 할 지 검사
	       if ("like".equals(sort)) {
	           list = dao.list_lifeInfo_like();
	       }else {
	           list = dao.list_lifeInfo_latest();
	       }
	       
	       // 하트 수 확인 시 loginId를 기준으로 체크해야되서 아이디 값 가져옴.
	       String loginId = (String)session.getAttribute("loginId");
	       
	       LikeStatus(list, loginId); // 하트 수 체크하는 메서드 실행 -> 여기서 set으로 상태(0, 1 ) 담아줌.
	       
	       model.addAttribute("lifeInfo", list);
	       model.addAttribute("sort",sort);

	      return "board/life-info";
	   }
	   
	   @RequestMapping("/food")
	   public String food(String sort, Model model, HttpSession session) throws Exception{
	      
	      
	      // 기본 정렬
	      if(sort == null) {
	         sort = "latest";
	      }
	       List<BoardDTO> list;
	       
	       // 출력을 어떤 종류를 기준으로 할 지 검사
	       if ("like".equals(sort)) {
	           list = dao.list_food_like();
	       }else {
	           list = dao.list_food_latest();
	       }
	       
	       // 하트 수 확인 시 loginId를 기준으로 체크해야되서 아이디 값 가져옴.
	       String loginId = (String)session.getAttribute("loginId");
	       
	       LikeStatus(list, loginId); // 하트 수 체크하는 메서드 실행 -> 여기서 set으로 상태(0, 1 ) 담아줌.
	       
	       model.addAttribute("list", list);
	       model.addAttribute("sort",sort);

	      return "board/food";
	   }
	   
	   @RequestMapping("/beauty")
	   public String beauty(String sort, Model model, HttpSession session) throws Exception{
	      
	      
	      // 기본 정렬
	      if(sort == null) {
	         sort = "latest";
	      }
	       List<BoardDTO> list;
	       
	       // 출력을 어떤 종류를 기준으로 할 지 검사
	       if ("like".equals(sort)) {
	           list = dao.list_beauty_like(); // dao에 beauty로 검색하는 것 추가
	       }else {
	           list = dao.list_beauty_latest();
	       }
	       
	       // 하트 수 확인 시 loginId를 기준으로 체크해야되서 아이디 값 가져옴.
	       String loginId = (String)session.getAttribute("loginId");
	       
	       LikeStatus(list, loginId); // 하트 수 체크하는 메서드 실행 -> 여기서 set으로 상태(0, 1 ) 담아줌.
	       
	       model.addAttribute("list", list);
	       model.addAttribute("sort",sort);

	      return "board/beauty";
	   }
	   
	   // 게시물 상세보기
	   @RequestMapping("/postDetail")
	   public String postDetail(Model model, int post_seq, HttpSession session, String category) throws Exception{
	      
	      BoardDTO dto = dao.selectByPost_seq(post_seq);
	      
	      String loginId = (String)session.getAttribute("loginId");
	      
	    //파일리스트 뽑아오기
		    List<AttachmentDTO> aList = aDao.getAttachment(post_seq);
			model.addAttribute("fileList",aList);
			System.out.println(aList.size());
	      
	         if(loginId != null) {
	            String allCategory = dao.getCategoryBySeq(post_seq);
	            vdao.postClickVisit(loginId, allCategory);
	         }
	       
	       LikeStatus(dto, loginId); // 하트 수 체크하는 메서드 실행 -> 여기서 set으로 상태(0, 1 ) 담아줌.
	       model.addAttribute("loginId", loginId);
	       model.addAttribute("dto",dto);
	       
	      session.setAttribute("category", category);
	       return "board/postDetail";
	   }
	
	// 게시글 삭제
	@ResponseBody
	@RequestMapping("/deletePost")
	public String deletePost(int post_seq) {
		dao.deletePost(post_seq);
		
		return "success";
	}
	
	// 게시글 수정
	@ResponseBody
	@RequestMapping("/updatePost")
	public String updatePost(int post_seq, String post_title, String post_contents) {
		dao.updatePost(post_seq, post_title, post_contents);
		
		return "success";
	}
	
	// ajax 댓글 리스트 출력
	@ResponseBody
	@RequestMapping("/replyList")
	public String replyList(int post_seq) {
		List<ReplyDTO> list = ReplyDao.selectByPostSeq(post_seq);
		return  gson.toJson(list);
	}
	
	// board에 list를 출력 시,로그인 한 아이디를 기준으로 하트를 눌러놨는지 체크하는 메서드
	private void LikeStatus(List<BoardDTO> list, String loginId) {
		
		if(loginId != null && list != null) { // 로그인 아이디랑 리스트가 null이 아니면 
			for(BoardDTO dto : list) { // for문 돌면서 list에서 
				int check = likeDao.likeCheck(dto.getPost_seq(), loginId); // 로그인 아이디를 기준으로 하트를 눌렀는지 체크하고,
				dto.setPost_like_check(check); // check의 값이 1 또는 0으로 나온 값을 dto에 set으로 기록.
			}
		}
		
	};
	
	// postDetail 페이지,로그인 한 아이디를 기준으로 하트를 눌러놨는지 체크하는 메서드
	private void LikeStatus(BoardDTO dto, String loginId) {
		
		if(loginId != null && dto != null) { // 로그인 아이디랑 리스트가 null이 아니면 
				int check = likeDao.likeCheck(dto.getPost_seq(), loginId); // 로그인 아이디를 기준으로 하트를 눌렀는지 체크하고,
				dto.setPost_like_check(check); // check의 값이 1 또는 0으로 나온 값을 dto에 set으로 기록.
		}
		
	};
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
	
}
