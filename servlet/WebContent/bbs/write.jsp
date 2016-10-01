<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
글쓰기 폼
<form name="frm" method="post" action="/bbs/BBS"><!-- post는 파라미터 값들을 숨겨서 보냄(보안) -->
id<input type="text" name="id"><br><!-- id파라미터값을 보내겠다 -->
이름<input type="text" name="name"><br><!-- name파라미터값 보내겠따 -->
<input type="submit" value="입력"><!-- submit 는 여기 있는 폼의 input 값들을 모두 전송하는 역할 -->
</form>
</body>
</html>