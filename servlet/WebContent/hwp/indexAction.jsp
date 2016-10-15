<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");

	Class.forName("com.mysql.jdbc.Driver");
	
	String url = "jdbc:mysql://my5507.gabiadb.com/bkigenius";
	String id = "dooga";
	String pass = "blue0546!@#$";

	String name1 = request.getParameter("name1");
	String name2 = request.getParameter("name2");
	String name3 = request.getParameter("name3");
	String name4 = request.getParameter("name4");

	try{	
		Connection conn = DriverManager.getConnection(url,id,pass);
		
		String sql = "INSERT INTO sample2(name1,name2,name3,name4) VALUES(?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);


		
		pstmt.setString(1, name1);
		pstmt.setString(2, name2);
		pstmt.setString(3, name3);
		pstmt.setString(4, name4);
		
		pstmt.execute();
		pstmt.close();
		
		conn.close();
	}catch(SQLException e){
		out.println(e.toString());
	}
%>
<script>
location.href="index.jsp";
</script>