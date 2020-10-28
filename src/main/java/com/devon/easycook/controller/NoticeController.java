package com.devon.easycook.controller;

import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.devon.easycook.domain.NoticeDTO;
import com.devon.easycook.repository.NoticeDAO;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@GetMapping("/faq")
	public String faq() {
		return "notice/faq";
	}
	
	public String pageNum = "";
	public String sentence = "";
	public String category = "";
	public String remoteId = "";

	public ModelAndView mv = new ModelAndView();
	
	@Autowired
	NoticeDAO dbPro;

	@ModelAttribute
	public void headProcess(HttpServletRequest request, HttpServletResponse res) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		remoteId = request.getRemoteAddr();
		// pageNum이 넘어와야 pageNum이 바뀜
		if (request.getParameter("pageNum") != null) {
			session.setAttribute("pageNum", request.getParameter("pageNum"));
		}
		
		// category가 넘어와야 세션이 변경됨
		if (request.getParameter("category") != null) {
			session.setAttribute("category", request.getParameter("category"));
			session.setAttribute("sentence", request.getParameter("sentence"));
			session.setAttribute("pageNum", "1");
		}
		category = (String) session.getAttribute("category");
		sentence = (String) session.getAttribute("sentence");
		pageNum = (String) session.getAttribute("pageNum");

		if (pageNum == null)
			pageNum = "1";
	}
	
	

	@RequestMapping("/writeUploadForm")
	public String writeUploadForm(NoticeDTO article, Model m) throws Exception {
		// TODO Auto-generated method stub

		m.addAttribute("noticeNo", article.getNoticeNo());
		m.addAttribute("noticeRef", article.getNoticeRef());
		m.addAttribute("noticeRe_step", article.getNoticeRe_step());
		m.addAttribute("noticeRe_level", article.getNoticeRe_level());

		return "notice/writeUploadForm";
	}

	@RequestMapping("/writeUploadPro")
	public String writeUploadPro(MultipartHttpServletRequest multipart, NoticeDTO article) throws Exception {

		MultipartFile multi = multipart.getFile("uploadfile");
		String filename = multi.getOriginalFilename();

		if (filename != null && !filename.equals("")) {
			String uploadPath = multipart.getRealPath("/") + "/uploadFile";
			FileCopyUtils.copy(multi.getInputStream(),
					new FileOutputStream(uploadPath + "/" + multi.getOriginalFilename()));
			article.setNoticeFilename(filename);

		} else {
			article.setNoticeFilename("");

		}
		
		System.out.println(article);

		dbPro.insertArticle(article);

		return "redirect:list";
	}

	@RequestMapping("/list")
	public ModelAndView list() throws Exception {

		int pageSize = 10;


		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		List articleList = null;

		count = dbPro.getArticleCount(category, sentence);
		if (count > 0) {
			articleList = dbPro.getArticles(startRow, endRow,category, sentence);
		}
		number = count - (currentPage - 1) * pageSize;

		int bottomLine = 3;
		int pageCount = 0;
		int startPage = 0;
		int endPage = 0;

		if (count > 0) {
			pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
			endPage = startPage + bottomLine - 1;

			if (endPage > pageCount)
				endPage = pageCount;
		}
		mv.clear();

		mv.addObject("currentPage", currentPage);
		mv.addObject("startRow", startRow);
		mv.addObject("endRow", endRow);
		mv.addObject("count", count);
		mv.addObject("number", number);
		mv.addObject("articleList", articleList);
		mv.addObject("pageSize", pageSize);

		mv.addObject("bottomLine", bottomLine);
		mv.addObject("pageCount", pageCount);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.setViewName("notice/list");

		return mv;
	}

	@RequestMapping("/content/{noticeNo}")
	public String content(@PathVariable("noticeNo") int noticeNo, Model m) throws Exception {

		NoticeDTO article = dbPro.getArticle(noticeNo, true);
		System.out.println("========article"+article);

		m.addAttribute("article", article);
		m.addAttribute("noticeRef", article.getNoticeRef());
		m.addAttribute("noticeRe_step", article.getNoticeRe_step());
		m.addAttribute("noticeRe_level", article.getNoticeRe_level());

		return "notice/content";
	}

	@RequestMapping("/deleteForm/{noticeNo}")
	public String deleteForm(@PathVariable("noticeNo") int noticeNo, Model m) throws Exception {
		// TODO Auto-generated method stub

		m.addAttribute("noticeNo", noticeNo);

		return "notice/deleteForm";
	}

	@RequestMapping("/deletePro")
	public String deletePro(int noticeNo, String noticePasswd, Model m) throws Exception {

		// TODO Auto-generated method stub

		int check = dbPro.deleteArticle(noticeNo, noticePasswd);
		m.addAttribute("check", check);
		return "notice/deletePro";
	}

	@RequestMapping("/updateForm/{noticeNo}")
	public String updateForm(@PathVariable("noticeNo") int noticeNo, Model m) throws Exception {
		// TODO Auto-generated method stub

		NoticeDTO article = dbPro.getArticle(noticeNo, false);
		m.addAttribute("article", article);

		return "notice/updateForm";
	}

	@RequestMapping("/updatePro")
	public ModelAndView updatePro(MultipartHttpServletRequest multipart, NoticeDTO article) throws Exception {
		MultipartFile multi = multipart.getFile("uploadfile");
		String noticeFilename = multi.getOriginalFilename();

		if (noticeFilename != null && !noticeFilename.equals("")) {
			String uploadPath = multipart.getRealPath("/") + "/uploadFile";
			FileCopyUtils.copy(multi.getInputStream(),
					new FileOutputStream(uploadPath + "/" + multi.getOriginalFilename()));
			article.setNoticeFilename(noticeFilename);

		} else {
			article.setNoticeFilename("");
		}

		System.out.println(article);

		int check = dbPro.updateArticle(article);
		mv.clear();
		mv.addObject("check", check);
		mv.setViewName("notice/updatePro");
		return mv;
	}
	
}
