package com.entity;

public class Application {
	private int applicationId;
	private int jobId;
	private String jobTitle;
	private String jobType;
	private int jobSalary;
	private String jobDescription;
	private String jobLocation;
	private String jobLastDate;
	
	public Application() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public Application(int applicationId, int jobId, String jobTitle, String jobType, int jobSalary,
			String jobDescription, String jobLocation, String jobLastDate) {
		super();
		this.applicationId = applicationId;
		this.jobId = jobId;
		this.jobTitle = jobTitle;
		this.jobType = jobType;
		this.jobSalary = jobSalary;
		this.jobDescription = jobDescription;
		this.jobLocation = jobLocation;
		this.jobLastDate = jobLastDate;
	}


	public int getApplicationId() {
		return applicationId;
	}


	public void setApplicationId(int applicationId) {
		this.applicationId = applicationId;
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

	public String getJobDescription() {
		return jobDescription;
	}

	public void setJobDescription(String jobDescription) {
		this.jobDescription = jobDescription;
	}

	public String getJobLocation() {
		return jobLocation;
	}

	public void setJobLocation(String jobLocation) {
		this.jobLocation = jobLocation;
	}
}
