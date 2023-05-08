package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnect;
import com.dao.UserDAO;
import com.entity.User;

@WebServlet("/user-login")
public class UserLogin extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		String userName=req.getParameter("user_email");
		String password = req.getParameter("user_password");
		UserDAO userDAO = new UserDAO(DBConnect.getConnection());
		User user = userDAO.getUser(userName, password);
		if(user!=null) {
			session.setAttribute("userId", user.getUserId());
			session.setAttribute("userType",2);
			session.setAttribute("userName", user.getUserName());
			resp.sendRedirect("joblisting.jsp");
		}else {
			resp.sendRedirect("index.jsp");
		}
	}
}
