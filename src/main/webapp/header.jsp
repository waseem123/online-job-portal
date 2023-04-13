<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Header</title>
    <style type="text/css">

		.formdiv{
			padding: 8px;
			border: 1px solid black;
			display: inline-block;

			margin: auto;
			/*width: 50%;*/
		}
        table,th{
            border: 1px solid black;
            border-collapse: collapse;
            padding:24px;
            text-align: center;
        }
		.input{
			height: 20px;
			width: 300px;
		}
	</style>
</head>
<body>
    <table>
        <tbody>
            <tr>
                <th><a href="/onlinejobportal/addjob.jsp">Add Job</a></th>
                <th><a href="/onlinejobportal/editjob.jsp">Edit Job</a></th>
                <th><a href="/onlinejobportal/viewjob.jsp">View Job</a></th>
                <th><a href="/onlinejobportal/logout">Log Out</a></th>
                <th colspan="5"><u style="text-align:right">Welcome, ${adminName}</u></th>
            </tr>
        </tbody>
    </table>
</body>
</html>