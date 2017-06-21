package org.kosta.tomoroad.controller;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.tomoroad.model.service.BurnService;
import org.kosta.tomoroad.model.service.ManagerService;
import org.kosta.tomoroad.model.service.MemberService;
import org.kosta.tomoroad.model.vo.ManagerVO;
import org.kosta.tomoroad.model.vo.MemberVO;
import org.kosta.tomoroad.model.vo.PlaceVO;
import org.kosta.tomoroad.model.vo.StationVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ManagerController {
	
	@Resource(name = "managerServiceImpl")
	private ManagerService managerService;
	
	@Resource(name = "memberServiceImpl")
	private MemberService memberService;
	
	@Resource(name = "burnServiceImpl")
	private BurnService burnService;
	
	@RequestMapping(method = RequestMethod.POST, value = "noauth_managerLogin.do")
	public String managerLogin(ManagerVO managerVO, HttpServletRequest request, HttpSession session,Model model) {
		ManagerVO vo = managerService.managerLogin(managerVO);
		if (vo == null)
			return "member/noauth_login_fail";
		else {
			session.setAttribute("manager", vo);
		return "redirect:getMemberList.do";
	}
}

	@RequestMapping("getMemberList.do")
	public String getMemberList(Model model){
		model.addAttribute("list", managerService.getMemberList());
		model.addAttribute("station", managerService.getStationNameListManager());
		model.addAttribute("placeList", managerService.getPlaceList());
		return "manager/manager.tiles";
	}
	
	@RequestMapping("updateMemberByManagerForm.do")
	public ModelAndView updateMemberByManagerForm(String id) {
		MemberVO vo =managerService.getIdFromMember(id);
		return new ModelAndView("manager/manager_member_form.tiles","mmvo",vo);
	}
	@RequestMapping("updateMemberByManager.do")
	public ModelAndView updateMemberByManager(MemberVO vo) {
		managerService.updateMemberByManager(vo);
		return new ModelAndView("redirect:getMemberList.do");
	}
	
	@RequestMapping("deleteMemberByManager.do")
	public String deleteMemberByManager(String id) {
		/*System.out.println(id);*/
		managerService.deleteMemberByManager(id);
		return "redirect:manager/manager_delete_result.do";
	}
	  
	@RequestMapping("getStationListManager.do")
	public String getStationListManager(String name,Model model){
		model.addAttribute("station", managerService.getStationListManager(name));
		//System.out.println(managerService.getStationListManager(name));
		return "manager/manager_station_form.tiles";
	}
	
	@RequestMapping("getStationNameListManager.do")
	public String getStationNameListManager(Model model){
		model.addAttribute("station", managerService.getStationNameListManager());
		//System.out.println(managerService.getStationNameListManager());
		return "manager/manager.tiles";
	}

	@RequestMapping(value = "updateStation.do", method = RequestMethod.POST)
	public ModelAndView updateStation(MultipartFile uploadfile,StationVO vo) {
		if(uploadfile.getOriginalFilename().isEmpty()){
			StationVO svo = managerService.getStationListManager(vo.getName());
			vo.setImg(svo.getImg());
			System.out.println(vo);
		}else{
			String fileName = uploadfile.getOriginalFilename();
			String m = fileName.substring(fileName.lastIndexOf("."), fileName.lastIndexOf(".")+4);
			String uploadPath = "C:\\Users\\Administrator\\git\\TOMOROAD\\TomoRoad\\src\\main\\webapp\\resources\\images\\symbol\\";
			File file = new File(uploadPath+vo.getName()+m);
			try {
				uploadfile.transferTo(file);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			vo.setImg(vo.getName()+m);
		}
		managerService.updateStation(vo);
		return new ModelAndView("redirect:getMemberList.do");
	}
	@RequestMapping("updatePlaceManagerForm.do")
	public String updatePlaceManagerForm(int no, Model model) {
		model.addAttribute("station",managerService.getStationNameListManager());
		model.addAttribute("place",managerService.getNoFromPlace(no));
		return "manager/manager_place_form.tiles";
	}
	@RequestMapping("updatePlaceMember.do")
	public ModelAndView updatePlaceMember(PlaceVO vo) {
		managerService.updatePlaceMember(vo);
		return new ModelAndView("redirect:getMemberList.do");
	}
	@RequestMapping("insertPlaceManagerForm.do")
	public String insertPlaceManagerForm(Model model) {
		model.addAttribute("station",managerService.getStationNameListManager());
		return "manager/manager_register_place_form.tiles";
	}
	@RequestMapping("insertPlaceManager.do")
	public ModelAndView insertPlaceManager(PlaceVO vo) {
		managerService.insertPlaceManager(vo);
		return new ModelAndView("redirect:getMemberList.do");
	}
	@RequestMapping("deletePlaceManager.do")
	public String deletePlaceManager(int no) {
		managerService.deletePlaceManager(no);
		return "redirect:manager/manager_delete_result.do";
	}
	
}