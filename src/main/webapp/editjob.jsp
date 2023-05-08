<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %>
<%@page import="java.sql.Connection" %>
<%@page import="com.conn.DBConnect" %>
<%@page import="com.dao.JobDAO" %>
<%@page import="com.entity.Job" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Edit a Job</title>
	<style type="text/css">
        td{
            border: 1px solid black;
            border-collapse: collapse;
            padding:24px;
            text-align: center;
        }
		.formdiv{
			padding: 8px;
			border: 1px solid black;
			display: inline-block;
			margin-top: 24px;
		}

		.input{
			height: 20px;
			width: 300px;
			padding: 8px;
		}
	</style>
</head>
<body>
    <jsp:include page="admin-header.jsp"></jsp:include>
    <h2>Job Information</h2>
    <c:if test="${userType!=1}">
        <c:redirect url = "/index.jsp"/>
    </c:if>
	<div class="formdiv">
		<form action="update-job" method="post">
		<%
			int jobId = Integer.parseInt(request.getParameter("id"));
			JobDAO dao = new JobDAO(DBConnect.getConnection());
			Job job = dao.getJobById(jobId);
			pageContext.setAttribute("job", job);
			String[] jobTypes = {"Full-Time","Part-Time","Remote"};
			pageContext.setAttribute("jobTypes", jobTypes);
		%>
			<table>
				<thead>
					<tr>
						<th colspan="2"><h3>Edit a Job</h3></th>
						<c:if test="${not empty success}">
						<p>${success}</p>
						<c:remove var="success"/>
						</c:if>
						
						<c:if test="${not empty error}">
						<p>${error}</p>
						<c:remove var="error"/>
						</c:if>
					</tr>
				</thead>
				<tbody>
					<input type="hidden" id="job_id" class="input" value="${job.jobId}" name="job_id">
					<tr>
                        <td>
                            <label for="job_title">Job Title</label>
                        </td>
                        <td>
                            <input type="text" id="job_title" class="input" value="${job.jobTitle}" name="job_title">
                        </td>
                    </tr>
                    <tr>
						<td>
							<label for="job_type">Job Type ${job.jobType}</label>
						</td>
						
						<td>
							
							<select id="job_type" name="job_type" style="width:300px;padding:8px">
                                <option value="">Select Type</option>
                                <c:forEach items="${jobTypes}" var="jobType">
                                    <option value="${jobType}" <c:if test="${jobType == job.jobType}">selected</c:if>>
                                        ${jobType}
                                    </option>
                                </c:forEach>
                            </select>
						</td>
					</tr>
					
                    <tr>
                        <td>
                            <label for="job_salary">Salary</label>
                        </td>
                        <td>
                        	<input type="text" id="job_salary" class="input" value="${job.jobSalary}" name="job_salary">
                        </td>
                    </tr>
                                      
                    <tr>
                        <td>
                            <label for="job_description">Description</label>
                        </td>
                        <td>
                        	<input type="text" id="job_description" class="input" name="job_description" value="${job.jobDescription}">
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            <label for="job_location">Job Location</label>
                        </td>
                        <td>
                        	<input type="text" id="job_location" class="input" name="job_location" value="${job.jobLocation}">
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            <label for="job_last_date">Last Date To Apply</label>
                        </td>
                        <td>
                        	<input type="date" id="job_last_date" class="input" name="job_last_date" value="${job.jobLastDate}">
                        </td>
                    </tr>
					
					<tr>
						<td colspan="2"><button type="submit">POST</button></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>