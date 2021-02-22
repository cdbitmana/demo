<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.0.3/tailwind.min.css" integrity="sha512-wl80ucxCRpLkfaCnbM88y4AxnutbGk327762eM9E/rRTvY/ZGAHWMZrYUq66VQBYMIYDFpDdJAOGSLyIPHZ2IQ==" crossorigin="anonymous" />
<meta charset="UTF-8">
<title></title>
</head>

<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<!-- 회원가입 폼 체크 -->
<script>
let DoJoinForm__submited = false;

function joinFormCheck() {
		if(DoJoinForm__submited){
			alert("처리중입니다.");
			return false;
		}

		if (joinForm.loginId.value == "") {
			alert("아이디를 입력해 주세요.");
			return false;
		} else if (joinForm.loginPw.value == "") {
			alert("비밀번호를 입력해 주세요.");
			return false;
		} else if (joinForm.name.value == "") {
			alert("이름을 입력해 주세요.");
			return false;
		} else if (joinForm.gender.value == "") {
			alert("성별을 입력해 주세요.");
			return false;
		} else if (joinForm.email.value == "") {
			alert("이메일을 입력해 주세요.");
			return false;
		} else if (joinForm.cellPhoneNo.value == "") {
			alert("전화번호를 입력해 주세요.");
			return false;
		} else if (joinForm.corp.value == "") {
			alert("회사를 입력해 주세요.");
			return false;
		} 
		 joinForm.loginPwReal.value = sha256(joinForm.loginPw.value);
		 joinForm.loginPw.value = "";
		 DoJoinForm__submited = true;
	
		 return true;	
		 }
</script>

<div class="min-h-screen bg-gray-200 flex items-center justify-center">
<div class="container mx-auto flex flex-col bg-white p-2">
<div class="flex justify-center mb-2"><span>로그인</span></div>
<form action="doJoin" name="joinForm" class="" method="POST" onsubmit="return joinFormCheck();">
<input type="hidden" name="loginPwReal">
<div class="flex mb-2 items-center"><div class="w-28">아이디</div><input type="text" name="loginId" placeholder="아이디"></div>
<div class="flex mb-2 items-center"><div class="w-28">비밀번호</div><input type="text" name="loginPw" placeholder="비밀번호"></div>
<div class="flex mb-2 items-center"><div class="w-28">이름</div><input type="text" name="name" placeholder="이름"></div>
<div class="flex mb-2 items-center"><div class="w-28">성별</div><input id="남" type="radio" name="gender" value="남"><label class="ml-1" for="남">남</label><input class="ml-2" id="여" type="radio" name="gender" value="여"><label class="ml-1" for="여">여</label></div>
<div class="flex mb-2 items-center"><div class="w-28">주소</div><input type="text" name="address" placeholder="주소"></div>
<div class="flex mb-2 items-center"><div class="w-28">이메일</div><input type="text" name="email" placeholder="이메일"></div>
<div class="flex mb-2 items-center"><div class="w-28">전화번호</div><input type="text" name="cellPhoneNo" placeholder="전화번호"></div>
<div class="flex mb-2 items-center"><div class="w-28">회사</div><input type="text" name="corp" placeholder="회사"></div>
<div class="flex mb-2 items-center justify-center"><button>제출</button></div>
</form>
</div>
</div>
</body>

</html>