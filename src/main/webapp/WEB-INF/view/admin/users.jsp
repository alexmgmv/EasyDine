<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>
    </head>
    <body>
        <div align="center">
            <h1>${adminMsg}</h1>
        </div> 
        <br>
        <table>
            <tr>
                <th>Username</th>
                <th>Password</th>
                <th>Name</th>
                <th>Phone</th>
                <th>E-Mail</th>
                <th>Region</th>
                <th>City</th>             
                <th>Address</th>             
                <th>Credits</th>             
                <th></th>
            </tr>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td>${user.username}</td>
                    <td>${user.password}</td>
                    <td>${user.firstName} ${user.lastName}</td>
                    <td>${user.phone}</td>
                    <td>${user.mail}</td>
                    <td>${user.region}</td>
                    <td>${user.city}</td>
                    <td>${user.address}</td>
                    <td>${user.credits}</td>                
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/editUser?id=${user.id}">edit</a><br>
                        <a href="${pageContext.request.contextPath}/admin/deleteUser?id=${user.id}">remove</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <p>
            <a href="${pageContext.request.contextPath}/admin/cleanup">Remove All Unattached Managers</a>
        </p>
        <p>
            <a href="${pageContext.request.contextPath}/">Home</a>
        </p>  
    </body>
</html>
