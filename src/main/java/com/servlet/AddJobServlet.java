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
import com.entity.Job;

@WebServlet("/post-job")
public class AddJobServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		int userType = Integer.parseInt(session.getAttribute("userType")+"");
		if(userType!=1) {
			resp.sendRedirect("index.jsp");
		}
		String jobTitle = req.getParameter("job_title");
		String jobType = req.getParameter("job_type");
		int jobSalary = Integer.parseInt(req.getParameter("job_salary"));
		String jobDescription = req.getParameter("job_description");
		String jobLocation = req.getParameter("job_location");
		String jobLastDate = req.getParameter("job_last_date");
		
		Job job = new Job(jobTitle,jobType,jobSalary,jobDescription,jobLocation,jobLastDate);
		JobDAO jobDAO = new JobDAO(DBConnect.getConnection());
		if(jobDAO.addJob(job)) {
			session.setAttribute("success", "SUCCESSFULLY POSTED THE JOB");
			resp.sendRedirect("addjob.jsp");
//			System.out.println("SUCCESSFULLY ADDED THE JOB");
		}else {
			session.setAttribute("error", "ERROR IN POSTING THE JOB");
			resp.sendRedirect("addjob.jsp");
//			System.out.println("FAILURE TO ADD THE JOB");
		}
	}

}
