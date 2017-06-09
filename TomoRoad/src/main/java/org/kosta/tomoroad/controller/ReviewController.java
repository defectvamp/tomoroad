package org.kosta.tomoroad.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.tomoroad.model.service.ReviewService;
import org.kosta.tomoroad.model.vo.MemberVO;
import org.kosta.tomoroad.model.vo.PlaceVO;
import org.kosta.tomoroad.model.vo.ReviewCommentVO;
import org.kosta.tomoroad.model.vo.ReviewUploadVO;
import org.kosta.tomoroad.model.vo.ReviewVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewController {
	@Resource(name = "reviewServiceImpl")
	private ReviewService service;

	@RequestMapping("review/noauth_showList.do")
	public ModelAndView showList(String page) {
		if (page == null)
			page = "1";
		return new ModelAndView("review/showList.tiles", "reviewList", service.getList(page));
	}

	@RequestMapping("review/noauth_showListByMember.do")
	public ModelAndView showListByMember(String page, String id) {
		if (page == null)
			page = "1";
		return new ModelAndView("review/showList.tiles", "reviewMap", service.getListByMember(page,id));
	}

	@RequestMapping("review/noauth_showListByPlace.do")
	public ModelAndView showListByPlace(String page, String place) {
		if (page == null)
			page = "1";
		return new ModelAndView("review/showList.tiles", "reviewMap", service.getListByPlace(page,place));
	}
	
	@RequestMapping(value = "review/register.do", method = RequestMethod.POST)
	public ModelAndView register(ReviewUploadVO ruvo, HttpServletRequest req) {
		System.out.println(ruvo);
		ReviewVO vo = new ReviewVO();
		vo.setTitle(ruvo.getTitle());
		vo.setContent(ruvo.getContent());
		vo.setStar(ruvo.getStar());
		MemberVO mvo = (MemberVO) req.getSession().getAttribute("mvo");
		System.out.println(mvo);
		vo.setMember(mvo);
		vo.setPlace(new PlaceVO(ruvo.getPlaceNo()));
		service.register(vo);
		List<MultipartFile> files = ruvo.getFiles();
		String uploadPath = req.getSession().getServletContext().getRealPath("/resources/upload/");
		ArrayList<String> nameList = new ArrayList<String>();
		for (int i = 0; i < files.size(); i++) {
			String fileName = files.get(i).getOriginalFilename();
			if (fileName.equals("") == false) {
				try {
					files.get(i).transferTo(new File(uploadPath + "review"+vo.getNo()+"_"+i));
					nameList.add("review"+vo.getNo()+"_"+i);
					System.out.println("업로드 완료 " + fileName);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}
		return new ModelAndView("redirect:noauth_detail.do?no=" + vo.getNo());
	}
	
	@RequestMapping("review/register_form.do")
	public ModelAndView registerForm() {
		return new ModelAndView("review/register_form.tiles", "placeList", service.getPlaceList());
	}
	
	@RequestMapping("review/update_form.do")
	public ModelAndView updateForm(String no){
		System.out.println("updateForm no="+no);
		System.out.println("rvo="+service.getDetail(no));
		return new ModelAndView("review/update_form.tiles", "dvo", service.getUpdateDetail(no));
	}

	@RequestMapping(value = "review/update.do", method = RequestMethod.POST)
	public ModelAndView update(List<MultipartFile> files, ReviewVO vo, int placeNo, HttpServletRequest req) {
		vo.setMember((MemberVO) req.getSession().getAttribute("mvo"));
		vo.setPlace(new PlaceVO(placeNo));
		service.update(vo);
		String uploadPath = req.getSession().getServletContext().getRealPath("/resources/upload/");
		ArrayList<String> nameList = new ArrayList<String>();
		for (int i = 0; i < files.size(); i++) {
			String fileName = files.get(i).getOriginalFilename();
			if (fileName.equals("") == false) {
				try {
					files.get(i).transferTo(new File(uploadPath + "review"+vo.getNo()+"_"+i));
					nameList.add("review"+vo.getNo()+"_"+i);
					System.out.println("업로드 완료 " + fileName);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}
		return new ModelAndView("redirect:noauth_detail.do?no=" + vo.getNo());
	}

	@RequestMapping("review/noauth_detail.do")
	public ModelAndView detail(String no, HttpServletRequest req) {
		MemberVO mvo = (MemberVO) req.getSession().getAttribute("mvo");
		Map<String, Object> dvo;
		if(mvo!=null)
			dvo = service.getDetail(no, mvo.getId());
		else
			dvo = service.getDetail(no);
		return new ModelAndView("review/detail.tiles", "dvo", dvo);
	}
	
	@RequestMapping("review/noauth_detailHit.do")
	public ModelAndView detailHit(String no){
		service.getDetailHit(no);
		return new ModelAndView("redirect:noauth_detail.do?no="+no);
	}
	
	@RequestMapping("review/delete.do")
	public ModelAndView delete(String no, HttpServletRequest req){
		MemberVO vo = (MemberVO) req.getSession().getAttribute("mvo");
		service.delete(no);
		return new ModelAndView("redirect:review/showListByMember.do?id="+vo.getId());
	}
	
	@RequestMapping("review/recommend")
	public String recommend(String id,int no){
		service.recommend(id, no);
		return "redirect:noauth_detail.do?no="+no;
	}
	
	@RequestMapping("review/getKeyword.do")
	@ResponseBody
	//검색창에 입력한 단어가 들어가는 키워드를 가져옴
	public ArrayList<String> getKeyword(String keyword,String reviewFilter){
		System.out.println("keyword:"+keyword);
		System.out.println("컨트롤러에서의 reviewFilter:"+reviewFilter);
		List<ReviewVO> searchResultList=service.getKeyword(keyword,reviewFilter);
		System.out.println("리뷰 키워드 갖고온다 : "+searchResultList);
		
		ArrayList<String> keywordList=new ArrayList<String>();
		
		if(reviewFilter.equals("제목만")){
			for(int i=0;i<searchResultList.size();i++){
				keywordList.add(searchResultList.get(i).getTitle());
			}
		}else{
			for(int i=0;i<searchResultList.size();i++){
				keywordList.add(searchResultList.get(i).getContent()); //제목이나 내용에 키워드가 있을 경우 자동완성 목록을 어떻게 띄워줄 것인가
			}
		}
		return keywordList;
	}
	
	@RequestMapping("review/writeComment.do")
	public ModelAndView writeComment(ReviewCommentVO vo,HttpServletRequest req, int reviewNo){
		vo.setMember((MemberVO)req.getSession().getAttribute("mvo"));
		service.writeComment(vo,reviewNo);
		return new ModelAndView("redirect:noauth_detail.do?no="+reviewNo);
		
	}
}
