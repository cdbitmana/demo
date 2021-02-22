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

<!-- 로그인 폼 체크 -->
<script>
let DoLoginForm__submited = false;
function loginFormCheck(){
	if(DoLoginForm__submited){
		alert("처리중입니다.");
		return false;
		}
		
		if (loginForm.loginId.value == "") {
			alert("아이디를 입력해 주세요.");
			return false;
		} else if (loginForm.loginPw.value == "") {
			alert("비밀번호를 입력해 주세요.");
			return false;
		}
		
		 loginForm.loginPwReal.value = sha256(loginForm.loginPw.value);
		
		DoLoginForm__submited = true;
		return true;
		
}
</script>

<div class="min-h-screen bg-gray-200 flex items-center justify-center">
<div class="flex container mx-auto flex-col bg-white p-2">
<div class="flex justify-center mb-2"><span>로그인</span></div>
<form action="doLogin" name="loginForm" class="" method="POST" onsubmit="return loginFormCheck();">
<input type="hidden" name="loginPwReal">
<div class="flex mb-2 items-center"><div class="w-28">아이디</div><input type="text" name="loginId" placeholder="아이디"></div>
<div class="flex mb-2 items-center"><div class="w-28">비밀번호</div><input type="text" name="loginPw" placeholder="비밀번호"></div>
<div class="flex mb-2 items-center justify-center"><button>제출</button></div>
</form>
</div>
</div>
</body>

</html>