package com.example.demo.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.MemberDao;
import com.example.demo.dto.Member;

@Service
public class MemberService {
	@Autowired
	private MemberDao memberDao;

	public void doJoin(Map<String, Object> param) {
		memberDao.doJoin(param);
	}

	public Member getMember(int loginedMemberId) {
		return memberDao.getMember(loginedMemberId);
	}

	public boolean isAdmin(int loginedMemberId) {
		Member member = null;
		member = memberDao.isAdmin(loginedMemberId); 
		
		if(member.getAuthLevel() == 1) {
			return true;
		}
		return false;
	}

	public Member getMemberByLoginId(Map<String, Object> param) {
		return memberDao.getMemberByLoginId(param);
	}

	

}
