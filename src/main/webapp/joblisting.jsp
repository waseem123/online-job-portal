<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %>
<%@page import="java.sql.Connection" %>
<%@page import="com.conn.DBConnect" %>
<%@page import="com.dao.JobDAO" %>
<%@page import="com.entity.Job" %>
<%@page import="java.util.List" %>

<html>
    <head>
        <title>All Jobs</title>
        <style type="text/css">
        		table,th,td{
        			border: 1px solid black;
        			border-collapse: collapse;
        			padding:8px;
        			text-align: trainer;
        		}
        		.input{
					height: 20px;
					width: 300px;
					padding: 8px;
				}
        </style>
    </head>

    <body>
        <jsp:include page="header.jsp" ></jsp:include>
        <br>
        <fieldset>
        	<legend>Search Jobs</legend>
        	<form action="getjobs" method="get">
	        	<input type="search" class="input" placeholder="Location" name="location" id="location">
	        	<select name="category" id="category">
	        		<option id="Full Time">Full Time</option>
	        		<option id="Part Time">Part Time</option>
	        		<option id="Remote">Remote</option>
	        	</select>
	        	<input type="submit" value="search">
	        </form>
        </fieldset>
        
        
        <h2>All Jobs</h2>
        <c:if test="${not empty success}">
			<p>${success}</p>
			<c:remove var="success"/>
		</c:if>
		
		<c:if test="${not empty error}">
			<p>${error}</p>
			<c:remove var="error"/>
		</c:if>
       	
       <%
       		JobDAO dao = new JobDAO(DBConnect.getConnection());
       		List<Job> jobList = dao.getAllJobs();
       		pageContext.setAttribute("jobList", jobList);
       		
       	%>
		<c:forEach items="${jobList}" var="job">
	       	<div>
	       		
	       		<h3>${job.jobTitle}</h3>
	       		<p><b>Category</b> - ${job.jobType}</p>
	       		<p><b>Salary</b> - ${job.jobSalary}</p>
	       		<p><b>Location</b> - ${job.jobLocation}</p>
	       		<p><b>Description</b> - ${job.jobDescription}</p>
	       		<p><b>Last Date to Apply</b> - ${job.jobLastDate}</p>
	       		<p>
	       			<form action="apply" method="get">
	       				<input type="hidden" value="${job.jobId}" name="jobId">
	       				<button type="submit">Apply</button>
	       			</form>
	       		</p>
	       	</div>
	       	<hr>
		</c:forEach>
		  
        <p>Total ${jobList.size()} Jobs Found.</p>
    </body>
</html>