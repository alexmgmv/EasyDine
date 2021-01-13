<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Restaurant Reservations</title>
    </head>
    <body>
        <table>
            <tr>
                <th>Customer</th>
                <th>Date</th>
                <th>Arrival</th>
                <th>Departure</th>
                <th>Seats</th>
                <th>Payment</th>
                <th>Comments</th>
                <th>Order</th>
                <th></th>
            </tr>
            <c:forEach items="${reservations}" var="reservation">
                <tr>
                    <td>${reservation.customer.firstName} ${reservation.customer.lastName}</td>
                    <td>${reservation.arrivalDate}</td>
                    <td>${reservation.arrival}</td>
                    <td>${reservation.departure}</td>
                    <td>${reservation.numberOfPeople}</td>
                    <td>${reservation.paymentMethod}</td>
                    <td>${reservation.comments}</td>
                    <td>${reservation.menuChoice.menuItem.title}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/manager/editReservation?id=${reservation.id}">edit</a>
                        <a href="${pageContext.request.contextPath}/manager/deleteReservation?id=${reservation.id}">delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <p>
            <a href="${pageContext.request.contextPath}/manager/addReservation?id=${restaurant.id}">Add Reservation</a>
        </p>  
        <p>
            <a href="${pageContext.request.contextPath}/manager">Back</a>
        </p>  
    </body>
</html>

