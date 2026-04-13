
package com.kedu.controllers;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kedu.dao.AttachmentDAO;
import com.kedu.dao.BoardDAO;
import com.kedu.dao.FeedBackDAO;
import com.kedu.dao.FeedBack_reactionDAO;
import com.kedu.dao.ReportDAO;
import com.kedu.dto.AttachmentDTO;
import com.kedu.dto.FeedBackDTO;
import com.kedu.dto.FeedBack_reactionDTO;
import com.kedu.dto.ReportDTO;

@Controller
@RequestMapping("/feedback")
public class FeedBackController {

	@Autowired
	public FeedBackDAO dao;

	@Autowired
	public ReportDAO reportdao;

	@Autowired
	public FeedBack_reactionDAO reactiondao;

	@Autowired
	public FeedBackDAO feedbackdao;

	@Autowired
	private BoardDAO bDao;

	@Autowired
	private AttachmentDAO aDao;

	@Autowired
	public Gson gson;

	// 건의사항 작성글 출력
	@RequestMapping("/feedbackHome")
	public String feedbackHome(Model model, HttpSession session, Integer cPage) throws Exception {

		// 홈에서 비회원일 경우, 로그인 페이지로 보냄
		String loginId = (String) session.getAttribute("loginId");

		if (loginId == null) {
			return "redirect:/members/loginUi";
		}

		if (cPage == null) {
			cPage = 1;
		}

		List<FeedBackDTO> list = feedbackdao.list(loginId, cPage * 10 - 9, cPage * 10);
	
		Map<Integer, List<AttachmentDTO>> imageMap = new HashMap<>();
		for(FeedBackDTO dto:list) {
			List<AttachmentDTO> files = aDao.getAttachmentSuggestion(dto.getSuggestion_seq());
			if (files != null && files.size() > 0) { // 데이터가 있을 때만 Map에 추가
		        imageMap.put(dto.getSuggestion_seq(), files);
		    }
		}
		System.out.println(imageMap);
		model.addAttribute("imageMap",imageMap);
		/* List<FeedBackDTO> list = dao.list(); */
		model.addAttribute("list", list);
		int recordTotalCount = dao.getRecordTotalCount();

		model.addAttribute("recordTotalCount", recordTotalCount);

		model.addAttribute("naviCountPerPage", 10);
		model.addAttribute("recordCountPerPage", 10);
		model.addAttribute("currentPage", cPage);
		session.setAttribute("cPage", cPage);
		
		List<FeedBack_reactionDTO> myReaction = reactiondao.selectMyReaction(loginId); // 내 반응 목록 list
		model.addAttribute("myReaction", myReaction);

		return "feedback/feedbackHome";
	}

	@RequestMapping("/feedbackWrite")
	public String feedbackWrite() {
		return "feedback/feedbackWrite";
	}

	// 건의사항 작성 db 입력
	@RequestMapping("/feedbackInsert")
	public String feedbackWrite(FeedBackDTO dto, HttpSession session, MultipartFile[] files) throws Exception {

		// 유효성 검사
		if (dto.getSuggestion_title().trim().equals("")) {
			return "redirect:/feedback/feedbackWrite";	
		}
			
		int nextval = dao.getNextval();
		System.out.println(nextval);
		System.out.println(dto.getSuggestion_seq());
		dto.setSuggestion_seq(nextval);

		String savePath = "c:/files";
		File savePathFile = new File(savePath);
		if (!savePathFile.exists()) {
			savePathFile.mkdir();
		}
		if (files != null) {
			for (MultipartFile file : files) {
				if (file.isEmpty())
					continue;

				String contentType = file.getContentType();
				String fileName = file.getOriginalFilename().toLowerCase();

				boolean isImage = (contentType != null && contentType.startsWith("image/"))
						|| (fileName.endsWith(".jpg") || fileName.endsWith(".png") || fileName.endsWith(".gif")
								|| fileName.endsWith(".webp"));
				if (isImage) {
					String oriName = file.getOriginalFilename();
					String sysName = UUID.randomUUID() + "_" + oriName;
					file.transferTo(new File(savePath + "/" + sysName));
					aDao.insert(new AttachmentDTO(0, "feedback", nextval, oriName, sysName));
				}
			}
		}

		String nickname = (String) session.getAttribute("nickname");
		String dong = (String) session.getAttribute("dong");
		String loginId = (String) session.getAttribute("loginId");

		dto.setMem_nickname(nickname);
		dto.setMem_dong(dong);
		dto.setMem_id(loginId);

		dao.insert(dto);

		return "redirect:/feedback/feedbackHome";
	}

	@ResponseBody
	@RequestMapping("/like") // 좋아요
	public String like(@RequestParam("suggestion_seq") Integer suggestion_seq, HttpSession session) throws Exception {

		String loginId = (String) session.getAttribute("loginId");

		if (loginId == null) {
			return "login";
		}

		String reaction = reactiondao.selectReaction(loginId, suggestion_seq);

		// 처음 누름
		if (reaction == null) {
			reactiondao.insert(loginId, suggestion_seq, "LIKE");
			feedbackdao.plusLike(suggestion_seq);
			return "liked";
		}

		// 좋아요 누름 -> 취소
		else if ("LIKE".equals(reaction)) {
//			reactiondao.delete(loginId, suggestion_seq);
//			feedbackdao.minusLike(suggestion_seq);
			return "alreadyLiked";
		}

		// 싫어요 -> 좋아요 변경
		else if ("UNLIKE".equals(reaction)) {
			reactiondao.update(loginId, suggestion_seq, "LIKE");
			feedbackdao.minusUnlike(suggestion_seq);
			feedbackdao.plusLike(suggestion_seq);
			return "change";
		}
		return "fail";
	}

	@ResponseBody
	@RequestMapping("/unlike")
	public String unlike(@RequestParam("suggestion_seq") Integer suggestion_seq, HttpSession session) throws Exception {

		String loginId = (String) session.getAttribute("loginId");

		if (loginId == null) {
			return "login";
		}

		String reaction = reactiondao.selectReaction(loginId, suggestion_seq);

		// 처음 누름
		if (reaction == null) {
			reactiondao.insert(loginId, suggestion_seq, "UNLIKE");
			feedbackdao.plusUnLike(suggestion_seq);
			return "unliked";
		}

		// 싫어요 누름 -> 취소
		else if ("UNLIKE".equals(reaction)) {
//			reactiondao.delete(loginId, suggestion_seq);
//			feedbackdao.minusUnlike(suggestion_seq);
			return "alreadyLiked";
		}

		// 좋아요 -> 싫어요 변경
		else if ("LIKE".equals(reaction)) {
			reactiondao.update(loginId, suggestion_seq, "UNLIKE");
			feedbackdao.minusLike(suggestion_seq);
			feedbackdao.plusUnLike(suggestion_seq);
			return "change";
		}
		return "fail";
	}

	// 신고
	@ResponseBody
	@RequestMapping("/report/insert")
	public String report(ReportDTO dto, HttpSession session) {

		String loginId = (String) session.getAttribute("loginId");

		dto.setMem_id(loginId);
		reportdao.reportInsert(dto);

		return "success";
	}

	// 게시글 삭제
	@ResponseBody
	@RequestMapping("/delete")
	public String delete(int suggestion_seq, HttpSession session) {

		String loginId = (String) session.getAttribute("loginId");

		FeedBackDTO dto = dao.selectBySeq(suggestion_seq);

		if (dto != null && loginId.equals(dto.getMem_id())) {

			dao.delete(suggestion_seq);
			return "successDel";
		} else {
			return "fail";
		}
	}

	// 게시글 수정
	@ResponseBody
	@RequestMapping("/update")
	public String update(FeedBackDTO dto, HttpSession session,
			@RequestParam(value="deleteFiles", required=false)List<String> deleteFiles,
			MultipartFile[] attachments)throws Exception {

		String loginId = (String) session.getAttribute("loginId");

		FeedBackDTO updateDto = dao.selectBySeq(dto.getSuggestion_seq());
		System.out.println("넘어온 파일 개수: " + (attachments != null ? attachments.length : 0));
		if (!loginId.equals(updateDto.getMem_id())) {
			return "fail";
		}

		dao.udpate(dto);

		String savePath = "c:/files";
        File savePathFile = new File(savePath);
        if (!savePathFile.exists()) {
            savePathFile.mkdir();
        }
		//파일 삭제
		if (deleteFiles != null && !deleteFiles.isEmpty()) {
	        for (String sysName : deleteFiles) {
	            aDao.deleteBySysName(sysName);
	            File target = new File(savePath + "/" + sysName);
	            if(target.exists()) {
	            	target.delete();
	            }
	        }
	    }
		//새 파일 업로드
		if (attachments != null) {
	        for (MultipartFile file : attachments) {
	            if (file.isEmpty()) {
	            	continue;
	            }
	            String contentType = file.getContentType();
				String fileName = file.getOriginalFilename().toLowerCase();

				boolean isImage = (contentType != null && contentType.startsWith("image/"))
						|| (fileName.endsWith(".jpg") || fileName.endsWith(".png") || fileName.endsWith(".gif")
								|| fileName.endsWith(".webp"));
				if (isImage) {
					String oriName = file.getOriginalFilename();
					String sysName = UUID.randomUUID() + "_" + oriName;
					file.transferTo(new File(savePath + "/" + sysName));
					aDao.insert(new AttachmentDTO(0, "feedback", dto.getSuggestion_seq(), oriName, sysName));
				}
	        }
	    }
		
		return "success";
	}
}
