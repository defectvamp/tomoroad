package org.kosta.tomoroad.model.service;

import java.util.List;

import org.kosta.tomoroad.model.vo.MemberVO;

public interface MemberService {

	MemberVO findMemberById(String id);

	MemberVO login(MemberVO memberVO);

	void registerMember(MemberVO vo);

	int idcheck(String id);

	void updateMember(MemberVO vo);

	void deleteMember(MemberVO vo);

	MemberVO findIdByPwNameTel(MemberVO memberVO);

	MemberVO findPwByIdNameTel(MemberVO memberVO);
	
	void friend_Request(String senderID,String receiverID);
	
	List<String> friend_RequestList(String receiverID);
	
	void friend_Accept(String senderID,String receiverID);
	
	void friend_Refuse(String senderID,String receiverID);

	List<String> friendList(String id);
	
}
