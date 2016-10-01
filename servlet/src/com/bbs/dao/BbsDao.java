package com.bbs.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.common.Dbconn;
import com.vo.BbsVo;

public class BbsDao { 

	private Dbconn dbconn = new Dbconn();
	
	public void bbsWriteAction(BbsVo bbsVo){
		try {
			Class.forName("com.mysql.jdbc.Driver"); 
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		} 

		try{	
			Connection conn = DriverManager.getConnection(dbconn.getUrl(),dbconn.getId(),dbconn.getPass()); //conn 인스턴스 생성... -> DB연결해줌
			
			String sql = "INSERT INTO bbs(id,name) VALUES(?,?)"; // sql 문 만듬
			PreparedStatement pstmt = conn.prepareStatement(sql); // PreparedStatement 인스턴스 생성.. 이건 쿼리문을 실행시켜줌

			pstmt.setString(1, bbsVo.getId());
			pstmt.setString(2, bbsVo.getName());
			
			pstmt.execute(); // 최종 실행!!
			pstmt.close(); // 닫아줌
			conn.close(); // 닫아줌
		}catch(SQLException e){ // 예외처리
			System.out.println(e.toString());
		}
	}
	
	public List<BbsVo> bbsList(){
	
		List<BbsVo> list = new ArrayList<BbsVo>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try{	
		
			Connection conn = DriverManager.getConnection(dbconn.getUrl(),dbconn.getId(),dbconn.getPass());
			Statement stmt = conn.createStatement();
			ResultSet rs; //ResultSet 이건 쿼리문으로 가져온 데이터를 여기다가 보관
		
			String sql = "SELECT sn, id, name FROM bbs";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) { //rs.next()는 rs에 담겨진 데이터들이 배열로 담겨져있거든요 배열안에 있는 객체들을 하나씩 실행해준다는 의미
				BbsVo bbsVo = new BbsVo(); // 객체 초기화 while 반복문이 돌때마다 초기화
				bbsVo.setId(rs.getString("id")); // id값을 객체에 넣어줌
				bbsVo.setName(rs.getString("name")); // name를 객체에 넣어줌
				list.add(bbsVo); // 객체를 list에 넣어줌
				// 최종적으로 list 가 모든 값을 다 들고있겠죠? add는 list의 함수라고 생각하시면 되요
			}
			
			rs.close();
			stmt.close();
			conn.close();
		}catch(SQLException e){
			System.out.println(e.toString());
		} 
		
		return list;	
	}
	
}
