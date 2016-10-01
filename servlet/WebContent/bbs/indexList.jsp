<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	
	String url = "jdbc:mysql://localhost:3306/bush0630";
	String id = "bush0630";
	String pass = "bush0630!";
	
	try{	

		Connection conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();

		String sqlList = "SELECT * from sample2 order by no DESC";
		ResultSet rs = stmt.executeQuery(sqlList);
				
		rs = stmt.executeQuery(sqlList);
		while(rs.next()) {
			int no = rs.getInt(1);
			String name1 = rs.getString(2);
			String name2 = rs.getString(3);
			String name3 = rs.getString(4);
			String name4 = rs.getString(5);
			out.println("번호 "+ no +" ====> 원고1 "+name1+ " /원고2 "+name2+" /원고3 "+name3+" /피고 "+name4+"<br>");
		}
		rs.close();
		stmt.close();
		conn.close();
	}catch(SQLException e){
		out.println(e.toString());
	}
%>