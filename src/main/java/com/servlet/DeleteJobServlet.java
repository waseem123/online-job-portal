/**
 * 
 */
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

/**
 * @author Waseem
 *
 */

@WebServlet("/delete")
public class DeleteJobServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		int jobId = Integer.parseInt(req.getParameter("id"));
		int userType = Integer.parseInt(session.getAttribute("userType")+"");
		if(userType!=1) {
			resp.sendRedirect("index.jsp");
		}
		JobDAO jobDAO = new JobDAO(DBConnect.getConnection());
		if(jobDAO.deleteJob(jobId)) {
			session.setAttribute("success", "SUCCESSFULLY DELETED THE JOB");
			resp.sendRedirect("alljobs.jsp");
//			System.out.println("SUCCESSFULLY ADDED THE JOB");
		}else {
			session.setAttribute("error", "ERROR IN DELETING THE JOB");
			resp.sendRedirect("alljobs.jsp");
//			System.out.println("FAILURE TO ADD THE JOB");
		}
	}

}
