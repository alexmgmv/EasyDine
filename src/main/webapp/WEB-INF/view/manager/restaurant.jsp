<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Restaurant Information</title>
    </head>
    <body>
        <div align="center">
            <h1>${managerMsg}</h1>
        </div> 
        <br>
        <table>
            <tr>
                <th>Business Title</th>
                <th>Restaurant Type</th>
                <th>Address</th>
                <th>Region</th>
                <th>City</th>
                <th>Phone</th>
                <th>Mail</th>
                <th>Seat Capacity</th>
                <th>Rating</th>
                <th></th>
            </tr>
            <c:forEach items="${restaurants}" var="restaurant">
                <tr>
                    <td>${restaurant.businessTitle}</td>
                    <td>${restaurant.restaurantType.foodCategory}</td>
                    <td>${restaurant.address}</td>
                    <td>${restaurant.region}</td>
                    <td>${restaurant.city}</td>
                    <td>${restaurant.phone}</td>
                    <td>${restaurant.mail}</td>
                    <td>${restaurant.seatCapacity}</td>
                    <td>${restaurant.ratingAverage}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/manager/editRestaurantInfo?id=${restaurant.id}">Edit Info</a>
                        <a href="${pageContext.request.contextPath}/manager/reviews?id=${restaurant.id}">Reviews</a>
                        <a href="${pageContext.request.contextPath}/manager/reservations?id=${restaurant.id}">Reservations</a>
                        <a href="${pageContext.request.contextPath}/manager/menu?id=${restaurant.id}">Menu</a>
                        <a href="${pageContext.request.contextPath}/manager/workingHours?id=${restaurant.id}">Working Hours</a>
                    </td>   
                </tr>
            </c:forEach>
        </table>
        <p>
            <a href="${pageContext.request.contextPath}/manager">Back</a>
        </p>  
    </body>
</html>
