<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Restaurants & Managers</title>
    </head>
    <body>
        <div align="center">
            <h1>${adminMsg}</h1>
        </div> 
        <br>
        <table>
            <tr>
                <th>Restaurant</th>
                <th>City</th>
                <th>Phone</th>
                <th>E-Mail</th>
                <th>Manager</th>
                <th></th>
            </tr>
            <c:forEach items="${restaurants}" var="restaurant">
                <tr>
                    <td>${restaurant.businessTitle}</td>
                    <td>${restaurant.city}</td>
                    <td>${restaurant.phone}</td>
                    <td>${restaurant.mail}</td>
                    <td>${restaurant.manager.username}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/replace?id=${restaurant.id}">replace Manager</a><br>
                        <a href="${pageContext.request.contextPath}/admin/delete?id=${restaurant.id}">remove Restaurant</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <p>
            <a href="${pageContext.request.contextPath}/admin/addRestaurant">Add Restaurant</a>
        </p>  
        <p>
            <a href="${pageContext.request.contextPath}/">Home</a>
        </p>  
    </body>
</html>
