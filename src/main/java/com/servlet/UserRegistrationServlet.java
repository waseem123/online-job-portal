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

@WebServlet("/registration")
public class UserRegistrationServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		String userName=req.getParameter("user_name");
		String userEmail=req.getParameter("user_email");
		String userPassword = req.getParameter("user_password");
		UserDAO userDAO = new UserDAO(DBConnect.getConnection());
		
		if(userDAO.createUser(userName,userEmail,userPassword)) {
			session.setAttribute("success", "REGISTRATION SUCCESSFULL");
			resp.sendRedirect("user-login.jsp");
		}else {
			session.setAttribute("error", "REGISTRATION FAILED");
			resp.sendRedirect("user-registration.jsp");
		}
	}
}
