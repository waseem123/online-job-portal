package com.conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	private static Connection conn = null;
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/db_jobportal","root","Simplilearn"); 
		}catch(Exception ex) {
			System.out.println("SQL EXCEPTOIN - "+ex.getMessage());
		}
		return conn;
		
	}
}
