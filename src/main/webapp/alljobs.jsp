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
                    width: 300px;
                    height: 40px;
                }
        </style>
    </head>

    <body>
        <jsp:include page="admin-header.jsp" ></jsp:include>
        <c:if test="${userType!=1}">
	        <c:redirect url = "/index.jsp"/>
	    </c:if>
        <h2>All Jobs</h2>
        <c:if test="${not empty success}">
			<p>${success}</p>
			<c:remove var="success"/>
		</c:if>
		
		<c:if test="${not empty error}">
			<p>${error}</p>
			<c:remove var="error"/>
		</c:if>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Job Title</th>
                    <th>Category</th>
                    <th>Salary</th>
                    <th>Location</th>
                    <th>Description</th>
                    <th>Last Date To Apply</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            
            	<%
            		JobDAO dao = new JobDAO(DBConnect.getConnection());
            		List<Job> jobList = dao.getAllJobs();
            		pageContext.setAttribute("jobList", jobList);
            		
            	%>
                 <c:forEach items="${jobList}" var="job">
                <tr>
                    <td>${job.jobId}</td>
                    <td>${job.jobTitle}</td>
                    <td>${job.jobType}</td>
                    <td>${job.jobSalary}</td>
                    <td>${job.jobLocation}</td>
                    <td>${job.jobDescription}</td>
                    <td>${job.jobLastDate}</td>
                    <td>
                        <a href="editjob.jsp?id=${job.jobId}"><button>Edit</button></a>
                        <a href="delete?id=${job.jobId}"><button>Delete</button></a>
<%--                         <a href="details/${job.jobId}"><button>View</button></a>
 --%>                    </td>
                </tr>
                </c:forEach>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="8">Total <%=jobList.size()%> Jobs Found.</td>
                </tr>
            </tfoot>
        </table>
    </body>
</html>