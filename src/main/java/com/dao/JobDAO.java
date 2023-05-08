package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Application;
import com.entity.Job;

public class JobDAO {
	private Connection conn;
	
	public JobDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addJob(Job job) {
		boolean result = false;
		try {
			String sql = "INSERT INTO tbl_job(job_title,job_type,job_salary,job_description,job_location,job_last_date)VALUES(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, job.getJobTitle());
			ps.setString(2, job.getJobType());
			ps.setInt(3, job.getJobSalary());
			ps.setString(4, job.getjobDescription());
			ps.setString(5, job.getJobLocation());
			ps.setString(6, job.getJobLastDate());
			int i=ps.executeUpdate();
			if(i==1)
				result=true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	public boolean updateJob(Job job) {
		boolean result = false;
		try {
			String sql = "UPDATE tbl_job SET job_title=?,job_type=?,job_salary=?,job_description=?,job_location=?,job_last_date=? WHERE job_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, job.getJobTitle());
			ps.setString(2, job.getJobType());
			ps.setInt(3, job.getJobSalary());
			ps.setString(4, job.getjobDescription());
			ps.setString(5, job.getJobLocation());
			ps.setString(6, job.getJobLastDate());
			ps.setInt(7, job.getJobId());
			int i=ps.executeUpdate();
			if(i==1)
				result=true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	public List<Job> getAllJobs(){
		List<Job> jobList = new ArrayList<Job>();
		try {
			String sql = "SELECT\r\n"
					+ "    job_id,\r\n"
					+ "    job_title,\r\n"
					+ "    job_type,\r\n"
					+ "    job_salary,\r\n"
					+ "    job_description,\r\n"
					+ "    job_location,\r\n"
					+ "    job_last_date\r\n"
					+ "FROM\r\n"
					+ "    tbl_job";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				jobList.add(new Job(rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getInt(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7)));
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return jobList;
	}
	
	public Job getJobById(int id) {
		Job job = null;
		try {
			String sql = "SELECT\r\n"
					+ "    job_id,\r\n"
					+ "    job_title,\r\n"
					+ "    job_type,\r\n"
					+ "    job_salary,\r\n"
					+ "    job_description,\r\n"
					+ "    job_location,\r\n"
					+ "    job_last_date\r\n"
					+ "FROM\r\n"
					+ "    tbl_job\r\n"
					+ "WHERE job_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				job = new Job(rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getInt(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7));
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return job;
	}

	public boolean deleteJob(int jobId) {
		// TODO Auto-generated method stub
		boolean result = false;
		try {
			String sql = "DELETE FROM tbl_job WHERE job_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, jobId);
			int i=ps.executeUpdate();
			if(i==1)
				result=true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

	public List<Job> getJobsByLocationAndCategory(String location, String category) {
		// TODO Auto-generated method stub
		List<Job> jobList = new ArrayList<Job>();
		try {
			String sql = "SELECT\r\n"
					+ "    job_id,\r\n"
					+ "    job_title,\r\n"
					+ "    job_type,\r\n"
					+ "    job_salary,\r\n"
					+ "    job_description,\r\n"
					+ "    job_location,\r\n"
					+ "    job_last_date\r\n"
					+ "FROM\r\n"
					+ "    tbl_job"
					+ " WHERE job_location=? AND job_type=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, location);
			ps.setString(2, category);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				jobList.add(new Job(rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getInt(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7)));
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return jobList;
	}

	public boolean apply(int jobId, int userId) {
		// TODO Auto-generated method stub
		boolean result = false;
		try {
			String sql = "INSERT INTO tbl_applications(job_id,user_id)VALUES(?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, jobId);
			ps.setInt(2,userId);
			int i=ps.executeUpdate();
			if(i==1)
				result=true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

	public List<Application> getApplications(int userId) {
		// TODO Auto-generated method stub
		List<Application> applications = new ArrayList<Application>();
		
		try {
			String sql = "SELECT \r\n"
					+ "		   b.application_id,\r\n"
					+ "		   a.job_id, \r\n"
					+ "		   a.job_title,\r\n"
					+ "	    a.job_type,\r\n"
					+ "	    a.job_salary,\r\n"
					+ "	    a.job_description,\r\n"
					+ "	    a.job_location,\r\n"
					+ "	    a.job_last_date\r\n"
					+ "	FROM tbl_job as a\r\n"
					+ "	JOIN tbl_applications as b\r\n"
					+ "	on a.job_id=b.job_id\r\n"
					+ "	WHERE b.user_id=?;";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Application application = new Application(
						rs.getInt(1),
						rs.getInt(2),
						rs.getString(3),
						rs.getString(4),
						rs.getInt(5),
						rs.getString(6),
						rs.getString(7),
						rs.getString(8));
				applications.add(application);
			}
			System.out.println(applications.get(0).getJobDescription());
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return applications;
		
	}
}
