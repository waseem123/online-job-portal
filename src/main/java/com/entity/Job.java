package com.entity;

public class Job {
	private int jobId;
	private String jobTitle;
	private String jobType;
	private int jobSalary;
	private String job_description;
	private String job_location;
	private String jobLastDate;
	
	public Job() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public Job(String jobTitle, String jobType, int jobSalary, String job_description, String job_location,
			String jobLastDate) {
		super();
		this.jobTitle = jobTitle;
		this.jobType = jobType;
		this.jobSalary = jobSalary;
		this.job_description = job_description;
		this.job_location = job_location;
		this.jobLastDate = jobLastDate;
	}


	public Job(int jobId, String jobTitle, String jobType, int jobSalary, String job_description,
			String job_location, String jobLastDate) {
		super();
		this.jobId = jobId;
		this.jobTitle = jobTitle;
		this.jobType = jobType;
		this.jobSalary = jobSalary;
		this.job_description = job_description;
		this.job_location = job_location;
		this.jobLastDate = jobLastDate;
	}


	public int getJobId() {
		return jobId;
	}

	public void setJobId(int jobId) {
		this.jobId = jobId;
	}

	public String getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	public int getJobSalary() {
		return jobSalary;
	}

	public void setJobSalary(int jobSalary) {
		this.jobSalary = jobSalary;
	}

	public String getJobLastDate() {
		return jobLastDate;
	}

	public void setJobLastDate(String jobLastDate) {
		this.jobLastDate = jobLastDate;
	}

	public String getjobDescription() {
		return job_description;
	}


	public void setjobDescription(String job_description) {
		this.job_description = job_description;
	}


	public String getJobLocation() {
		return job_location;
	}


	public void setJobLocation(String job_location) {
		this.job_location = job_location;
	}


	@Override
	public String toString() {
		return "Job [jobId=" + jobId + ", jobTitle=" + jobTitle + ", jobType=" + jobType + ", jobSalary=" + jobSalary
				+ ", job_description=" + job_description + ", job_location=" + job_location + ", jobLastDate="
				+ jobLastDate + "]";
	}


	

	
	
}
