<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %>
<%@page import="java.sql.Connection" %>
<%@page import="com.conn.DBConnect" %>
<%
	Connection conn = DBConnect.getConnection();
/* 	out.println(conn);*/

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Welcome To Job Portal</title>
	<style type="text/css">
	    body{
	        font-family:"calibri"
	    }
	    table{
	    	width:100%;
	    }
		table,th,td{
            border: 1px solid black;
            border-collapse: collapse;
            padding:24px;
            text-align: center;
            
        }
        .formdiv{
            padding: 8px;
            margin-top: 24px;
            width:50%;
            text-align: center;
        }

		.input{
			height: 20px;
			width: 300px;
		}
	</style>
</head>
<body>
    <h2 class="formdiv" style="border:1px solid black">Welcome To Online Job Portal</h2>
	<div class="formdiv" style="border:1px solid black">
			<table>
				<thead>
					<tr>
						<th colspan="2">
						    <h3>Developed By</h3>
						    <h3>Waseem Attar</h3>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
						    <b><a href="admin-login.jsp">MANAGE JOBS</a></b>
						</td>
						
						<td>
							<b><a href="user-login.jsp">SEARCH JOBS</a></b>
						</td>
					</tr>
				</tbody>
			</table>
	</div>
</body>
</html>