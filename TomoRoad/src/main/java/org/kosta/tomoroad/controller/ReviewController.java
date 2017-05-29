package org.kosta.tomoroad.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.tomoroad.model.service.ReviewService;
import org.kosta.tomoroad.model.vo.MemberVO;
import org.kosta.tomoroad.model.vo.PlaceVO;
import org.kosta.tomoroad.model.vo.ReviewVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewController {
	@Resource(name = "reviewServiceImpl")
	private ReviewService service;

	@RequestMapping("review/showList.do")
	public ModelAndView showList(String page) {
		if (page == null)
			page = "1";
		return new ModelAndView("review/showList.tiles", "reviewList", service.getList(page));
	}

	@RequestMapping("review/showListByMember.do")
	public ModelAndView showListByMember(String page, String id) {
		if (page == null)
			page = "1";
		return new ModelAndView("review/showList.tiles", "reviewMap", service.getListByMember(page,id));
	}

	@RequestMapping("review/showListByPlace.do")
	public ModelAndView showListByPlace(String page, String place) {
		if (page == null)
			page = "1";
		return new ModelAndView("review/showList.tiles", "reviewMap", service.getListByPlace(page,place));
	}

	@RequestMapping(value = "review/register.do", method = RequestMethod.POST)
	public ModelAndView register(ReviewVO vo, int place, HttpServletRequest req) {
		vo.setMember((MemberVO) req.getSession().getAttribute("mvo"));
		vo.setPlace(new PlaceVO(place));
		service.register(vo);
		return new ModelAndView("redirect:review/detail.do?no=" + vo.getNo());
	}

	@RequestMapping(value = "review/update.do", method = RequestMethod.POST)
	public ModelAndView update(ReviewVO vo, int place, HttpServletRequest req) {
		vo.setMember((MemberVO) req.getSession().getAttribute("mvo"));
		vo.setPlace(new PlaceVO(place));
		service.update(vo);
		return new ModelAndView("redirect:review/detail.do?no=" + vo.getNo());
	}

	@RequestMapping("review/detail.do")
	public ModelAndView detail(String no) {
		return new ModelAndView("review/detail.tiles", "rvo", service.getDetail(no));
	}
	
	@RequestMapping("review/delete.do")
	public ModelAndView delete(String no, HttpServletRequest req){
		MemberVO vo = (MemberVO) req.getSession().getAttribute("mvo");
		service.delete(no);
		return new ModelAndView("redirect:review/showListByMember.do?id="+vo.getId());
	}
}
