<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Browse Restaurants</title>
    </head>
    <body>
        <p>
            <a href="${pageContext.request.contextPath}/customer/search">Search Restaurants</a>
        </p>
        <table>
            <tr>
                <th>Restaurant</th>
                <th>Food Type</th>
                <th>Region</th>
                <th>City</th>
                <th>Rating</th>
                <th></th>
            </tr>
            <c:forEach items="${restaurants}" var="restaurant">
                <tr>
                    <td>${restaurant.businessTitle}</td>
                    <td>${restaurant.restaurantType.foodCategory}</td>
                    <td>${restaurant.region}</td>
                    <td>${restaurant.city}</td>
                    <td>${restaurant.ratingAverage}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/customer/restaurantDetails?id=${restaurant.id}">View All Info</a>
                    </td>   
                </tr>
            </c:forEach>
        </table>
        <p>
            <a href="${pageContext.request.contextPath}/customer">Back</a>
        </p>  
    </body>
</html>
