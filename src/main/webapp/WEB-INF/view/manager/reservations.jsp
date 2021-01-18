<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en"> 
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Restaurant Reservations</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>

    <body>
        <jsp:include page="navManager.jsp" />

        <main class="container">
            <h3 class="text-center mt-3">Reservations</h3>
            <div class="table-responsive mt-3">
                <table class="table table-striped table-hover">
                    <thead class="thead-dark">
                        <tr class="text-center">
                            <th>Customer</th>
                            <th>Date</th>
                            <th>Arrival</th>
                            <th>Departure</th>
                            <th>Seats</th>
                            <th>Order</th>
                            <th>Comments</th>
                            <th>Payment</th>
                            <th colspan="2">
                                <a href="${pageContext.request.contextPath}/manager/addReservation?id=${restaurant.id}" class="btn btn-primary">Add Reservation</a>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${reservations}" var="reservation">
                            <tr class="text-center">
                                <td>${reservation.customer.firstName} ${reservation.customer.lastName}</td>
                                <td>${reservation.arrivalDate}</td>
                                <td>${reservation.arrival}</td>
                                <td>${reservation.departure}</td>
                                <td>${reservation.numberOfPeople}</td>
                                <td>${reservation.menuChoice.menuItem.title}</td>
                                <td>${reservation.comments}</td>
                                <td>${reservation.paymentMethod}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/manager/editReservation?id=${reservation.id}" class="btn btn-primary">edit</a>
                                </td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/manager/deleteReservation?id=${reservation.id}" class="btn btn-danger">delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </main>
    </body>

</html>

