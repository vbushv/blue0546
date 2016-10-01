<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    <!-- java.sql.* 안에 모든것이 다 들어있음 import 해주면 됨 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 모델1 방식중에서도 제일 구식적인 방법!!
	request.setCharacterEncoding("UTF-8");

	Class.forName("com.mysql.jdbc.Driver");// mysql //oracle mssql는 이거랑 또 달라요
	
	String url = "jdbc:mysql://my5507.gabiadb.com:3306/bkigenius";
	String id = "dooga";
	String pass = "blue0546!@#$";
	
	try{	
		Connection conn = DriverManager.getConnection(url,id,pass); //conn 인스턴스 생성... -> DB연결해줌
		
		String sql = "INSERT INTO bbs(id,name) VALUES(?,?)"; // sql 문 만듬
		PreparedStatement pstmt = conn.prepareStatement(sql); // PreparedStatement 인스턴스 생성.. 이건 쿼리문을 실행시켜줌

		pstmt.setString(1, request.getParameter("id"));
		pstmt.setString(2, request.getParameter("name"));
		
		pstmt.execute(); // 최종 실행!!
		pstmt.close(); // 닫아줌
		conn.close(); // 닫아줌
	}catch(SQLException e){ // 예외처리
		out.println(e.toString());
	}
			
	response.sendRedirect("list.jsp");
%>
</body>
</html>