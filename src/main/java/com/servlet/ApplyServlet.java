package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnect;
import com.dao.JobDAO;

@WebServlet("/apply")
public class ApplyServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		int userType = Integer.parseInt(session.getAttribute("userType")+"");

		int jobId = Integer.parseInt(req.getParameter("jobId"));
		int userId = Integer.parseInt(session.getAttribute("userId")+"");
		JobDAO jobDAO = new JobDAO(DBConnect.getConnection());
		
		if(jobDAO.apply(jobId,userId)) {
			session.setAttribute("success", "SUCCESSFULLY APPLIED FOR THE JOB");
			resp.sendRedirect("viewjob.jsp");
		}
	}
	
}
