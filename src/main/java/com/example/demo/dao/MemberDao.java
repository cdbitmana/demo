package com.example.demo.dao;


import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


import com.example.demo.dto.Member;

@Mapper
public interface MemberDao {

	void doJoin(@Param(value="param") Map<String, Object> param);

	Member getMember(@Param(value="loginedMemberId") int loginedMemberId);

	Member isAdmin(@Param(value="loginedMemberId") int loginedMemberId);

	Member getMemberByLoginId(@Param(value="param")Map<String, Object> param);


	

}
