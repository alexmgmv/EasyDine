<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reservation History</title>
    </head>
    <body>
        <div align="center">
            <h1>${customerMsg}</h1>
        </div> 
        <br>
        <table>
            <tr>
                <th>Restaurant</th>
                <th>Date</th>
                <th>Arrival</th>
                <th>Departure</th>
                <th>Seats</th>
                <th>Order</th>
                <th>Payment</th>
                <th>Comments</th>
                <th></th>
            </tr>
            <c:forEach items="${reservations}" var="reservation">
                <tr>
                    <td>${reservation.restaurant.businessTitle}</td>
                    <td>${reservation.arrivalDate}</td>
                    <td>${reservation.arrival}</td>
                    <td>${reservation.departure}</td>
                    <td>${reservation.numberOfPeople}</td>
                    <td>${reservation.menuChoice}</td>
                    <td>${reservation.paymentMethod}</td>
                    <td>${reservation.comments}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/customer/addReview?id=${reservation.restaurant.id}">review</a><br>
                        <a href="${pageContext.request.contextPath}/customer/cancel?id=${reservation.id}">cancel Reservation</a>
                    </td>
                </tr>
            </c:forEach>
        </table> 
        <p>
            <a href="${pageContext.request.contextPath}/customer">Back</a>
        </p>  
    </body>
</html>

