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
import com.entity.Job;

@WebServlet("/getjobs")
public class SearchJobsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		String location =req.getParameter("location");
		String category =req.getParameter("category");
		
		JobDAO jobDAO = new JobDAO(DBConnect.getConnection());
		List<Job> jobs= jobDAO.getJobsByLocationAndCategory(location,category);
		session.setAttribute("success", "SUCCESSFULLY FETCHED THE JOBS");
		session.setAttribute("jobs", jobs);
		for(int i=0;i<jobs.size();i++) {
			System.out.println(jobs.get(i).getJobTitle());
		}
		resp.sendRedirect("viewjob.jsp");
	}

}
