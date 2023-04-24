package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDAO {
	private Connection conn;
	
	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public User getUser(String userName, String password) {
		System.out.println(userName+password);
		User user = null;
		try {
			String sql = "SELECT\r\n"
					+ "    user_id,\r\n"
					+ "    user_name\r\n"
					+ "FROM\r\n"
					+ "    tbl_user\r\n"
					+ "WHERE user_email = ? AND user_password = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, userName);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				user = new User();
				user.setUserId(rs.getInt(1));
				user.setUserName(rs.getString(2));
			}
			System.out.println(user.getUserName());
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return user;
	}

	public boolean createUser(String userName, String userEmail, String userPassword) {
		// TODO Auto-generated method stub
		boolean result = false;
		try {
			String sql = "INSERT INTO tbl_user(user_name,user_email,user_password)VALUES(?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, userName);
			ps.setString(2, userEmail);
			ps.setString(3, userPassword);
			int i=ps.executeUpdate();
			if(i==1)
				result=true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

	public User getAdmin(String userName, String password) {
		// TODO Auto-generated method stub
		System.out.println(userName+password);
		User user = null;
		try {
			String sql = "SELECT\r\n"
					+ "    admin_id,\r\n"
					+ "    admin_name\r\n"
					+ "FROM\r\n"
					+ "    tbl_admin\r\n"
					+ "WHERE admin_email = ? AND admin_password = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, userName);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				user = new User();
				user.setUserId(rs.getInt(1));
				user.setUserName(rs.getString(2));
			}
			System.out.println(user.getUserName());
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return user;
	}
	
	
}
