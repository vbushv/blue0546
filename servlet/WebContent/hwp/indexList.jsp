<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	
	String url = "jdbc:mysql://my5507.gabiadb.com/bkigenius";
	String id = "dooga";
	String pass = "blue0546!@#$";
	
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
			out.println("��ȣ "+ no +" ====> ����1 "+name1+ " /����2 "+name2+" /����3 "+name3+" /�ǰ� "+name4+"<br>");
		}
		rs.close();
		stmt.close();
		conn.close();
	}catch(SQLException e){
		out.println(e.toString());
	}
%>