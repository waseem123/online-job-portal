package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnect;
import com.dao.JobDAO;
import com.entity.Application;
import com.entity.Job;

@WebServlet("/get-applications")
public class ApplicationServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		
		
		JobDAO jobDAO = new JobDAO(DBConnect.getConnection());
		int userId = Integer.parseInt(session.getAttribute("userId")+"");
		System.out.println(userId);
		List<Application> applications= jobDAO.getApplications(userId);
		
		if(applications.size()>0) {
			session.setAttribute("success", "SUCCESSFULLY FETCHED THE JOB APPLICATIONS");
			session.setAttribute("jobs", applications);
			session.setAttribute("size", applications.size());
			resp.sendRedirect("applied-jobs.jsp");
		}else {
			session.setAttribute("error", "ERROR");
			session.setAttribute("size", applications.size());
			resp.sendRedirect("applied-jobs.jsp");
		}
	}
	
}
