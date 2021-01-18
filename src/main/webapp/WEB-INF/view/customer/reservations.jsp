<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reservation History</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>

    <body>
        <jsp:include page="navCustomer.jsp" />

        <div class="text-center p-2">
            <c:if test="${successMsg != null}" >
                <h1 class="text-success">${successMsg}</h1>
            </c:if>

            <c:if test="${failMsg != null}" >
                <h1 class="text-danger">${failMsg}</h1>
            </c:if>
        </div>

        <main class="container">
            <div class="jumbotron mx-auto mt-5 bg-light">
                <h3 class="text-primary text-center">Your Reservations</h3>
                <c:forEach items="${reservations}" var="reservation">
                    <div>
                        <hr>
                        <div class="row text-center">
                            <div class="col">
                                <div class="mt-3">
                                    <h4>${reservation.restaurant.businessTitle}</h4>
                                </div>
                                <div class="mt-3">
                                    <h5>${reservation.arrivalDate}</h5>
                                </div>
                                <div class="mt-3">
                                    <h5>${reservation.arrival} - ${reservation.departure}</h5>
                                </div>
                            </div>
                            <div class="col">
                                <div class="my-2">
                                    <b>Table for </b> &nbsp; ${reservation.numberOfPeople}
                                </div>
                                <div class="my-2">
                                    <b>Chosen Menu</b><br>
                                    ${reservation.menuChoice.menuItem.title}                        
                                </div>
                                <div class="my-2">
                                    <b>Payment</b><br>
                                    ${reservation.paymentMethod}
                                </div>
                            </div>
                            <div class="col my-auto">
                                <div class="my-4">
                                    <a href="${pageContext.request.contextPath}/customer/cancel?id=${reservation.id}" class="btn btn-danger">cancel</a>
                                </div>
                                <div class="my-4">
                                    <a href="${pageContext.request.contextPath}/customer/addReview?id=${reservation.restaurant.id}" class="btn btn-primary">review</a>
                                </div>
                            </div>
                        </div>
                        <div>
                            <b>Comments: </b> ${reservation.comments}           
                        </div>   
                    </div>
                </c:forEach>  
            </div>
        </main>  
    </body>

</html>

