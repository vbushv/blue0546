package com.common;

public class Dbconn {

	private String url = "jdbc:mysql://my5507.gabiadb.com:3306/bkigenius"; 
	private String id = "dooga";
	private String pass = "blue0546!@#$";

	public String getUrl(){
		return this.url;
	}
	
	public String getId(){
		return this.id;
	}
	
	public String getPass(){
		return this.pass;
	}
	
}
