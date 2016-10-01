<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.vo.BbsVo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language="javascript">
function goWrite(){
	document.location.href="write.jsp";
}
</script>
</head>
<body>
<%	
	List<BbsVo> list = (List)request.getAttribute("list");
	
	//out.println(list.toString());
	for(BbsVo bbsVo : list){
		out.println(bbsVo.getId() + "////" + bbsVo.getName() + "<br>");
	}
%>

<input type="button" value="글쓰기" onclick="javascript:goWrite();">

</body>
</html>