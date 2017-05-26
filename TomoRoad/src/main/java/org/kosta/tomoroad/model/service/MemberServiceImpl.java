package org.kosta.tomoroad.model.service;

import javax.annotation.Resource;

import org.kosta.tomoroad.model.dao.MemberDAO;
import org.kosta.tomoroad.model.vo.MemberVO;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	@Resource(name="memberDAOImpl")
	private MemberDAO memberDAO;
	@Override
	public MemberVO findMemberById(String id) {		
		return memberDAO.findMemberById(id);
	}
	@Override
	public MemberVO login(MemberVO memberVO){
		return memberDAO.login(memberVO);
	}
	@Override
	public void registerMember(MemberVO vo) {
		memberDAO.registerMember(vo);
	}
	@Override
	public int idcheck(String id) {		
		return memberDAO.idcheck(id);
	}
}
