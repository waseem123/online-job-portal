<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Add Job</title>
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
    <jsp:include page="header.jsp"></jsp:include>
    <h2>Job Information</h2>
    <c:if test="${error==true || success==true}">
        ${message}
    </c:if>
	<div class="formdiv">
		<form action="add" method="POST">
			<table>
				<thead>
					<tr>
						<th colspan="2"><h3>Add new Job</h3></th>
					</tr>
				</thead>
				<tbody>
					<tr>
                        <td>
                            <label for="job_title">Job Title</label>
                        </td>
                        <td>
                            <input type="text" id="job_title" class="input" name="job_title">
                        </td>
                    </tr>
                    <tr>
						<td>
							<label for="job_type">Job Type</label>
						</td>
						<td>
							<input type="text" id="job_type" class="input" name="job_type">
						</td>
					</tr>
					
                    <tr>
                        <td>
                            <label for="job_salary">Salary</label>
                        </td>
                        <td>
                        	<input type="text" id="job_salary" class="input" name="job_salary">
                        </td>
                    </tr>
					<tr>
						<td>
							<label for="job_category">Select Category</label>
						</td>
						<td>
							<select id="job_category" name="job_category" class="input">
                                <option value="">Select Trainer</option>
                                <c:forEach items="${trainers}" var="trainer">
                                    <option value="${trainer.trainerId}">${trainer.trainerName}</option>
                                </c:forEach>
                            </select>
						</td>
					</tr>
					<tr>
						<td colspan="2"><button type="submit">Submit</button></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>