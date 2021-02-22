<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

<script>
let DoWriteForm__submited = false;
function writeFormCheck(){
	if(DoWriteForm__submited){
		alert("처리중입니다.");
		return false;
		}
		
		if (writeForm.title.value == "") {
			alert("제목을 입력해 주세요.");
			return false;
		} else if (writeForm.body.value == "") {
			alert("내용을 입력해 주세요.");
			return false;
		}
		
		DoWriteForm__submited = true;
		return true;
		
}
</script>

<div class="min-h-screen bg-gray-200 flex items-center justify-center">
<div class="flex container mx-auto flex-col bg-white p-2">
<div class="flex justify-center mb-2"><span>글쓰기</span></div>
<form action="doWrite" name="writeForm" class="" method="POST" onsubmit="return writeFormCheck();">
<input type="hidden" name="memberId" value="${loginedMemberId }">
<input type="hidden" name="boardId" value="1">
<div class="flex mb-2 items-center"><div class="w-28">제목</div><input type="text" name="title" placeholder="제목"></div>
<div class="flex mb-2 items-center"><div class="w-28">내용</div><input type="text" name="body" placeholder="내용"></div>
<div class="flex mb-2 items-center justify-center"><button>제출</button></div>
</form>
</div>
</div>

</body>

</html>