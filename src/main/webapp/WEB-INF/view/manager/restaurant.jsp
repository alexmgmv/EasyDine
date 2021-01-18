<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en"> 
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Restaurant Information</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>

    <body>
        <jsp:include page="navManager.jsp" />

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
                <h3 class="text-primary text-center">Manage Restaurant</h3>
                <c:forEach items="${restaurants}" var="restaurant">
                    <div>
                        <hr>
                        <div class="row my-auto mx-auto text-center">
                            <div class="col my-auto">
                                <div>
                                    <h4>${restaurant.businessTitle}</h4>
                                    <h5>${restaurant.restaurantType.foodCategory}</h5>
                                </div>
                                <div class="mt-4">
                                    <a href="${pageContext.request.contextPath}/manager/reservations?id=${restaurant.id}" class="btn btn-success mx-3">Reservations</a>
                                </div>
                                <div class="mt-3">
                                    <a href="${pageContext.request.contextPath}/manager/reviews?id=${restaurant.id}" class="btn btn-success mx-3">Reviews</a>
                                </div>    
                            </div>
                            <div class="col my-auto">
                                <div class="py-2">
                                    <label for="address"><b>Address: </b></label> &nbsp;
                                    <span id="address">${restaurant.address}, ${restaurant.city}, ${restaurant.region}</span>
                                </div>
                                <div class="py-2">
                                    <label for="mail"><b>Mail: </b></label> &nbsp;
                                    <span id="mail">${restaurant.mail}</span> 
                                </div>
                                <div class="py-2">
                                    <label for="phone"><b>Phone: </b></label> &nbsp;
                                    <span id="phone">${restaurant.phone}</span>
                                </div>
                                <div class="py-2">
                                    <label for="ratingAverage"><b>Rating: </b></label> <span id="ratingAverage">${restaurant.ratingAverage}</span> <br>
                                    <label for="seatCapacity"><b>Seats: </b></label> <span id="seatCapacity">${restaurant.seatCapacity}</span> 
                                </div>
                            </div>
                            <div class="col my-auto">
                                <div class="mt-3">
                                    <a href="${pageContext.request.contextPath}/manager/menu?id=${restaurant.id}" class="btn btn-primary mx-3">Menu</a>
                                </div>
                                <div class="mt-3">
                                    <a href="${pageContext.request.contextPath}/manager/editRestaurantInfo?id=${restaurant.id}" class="btn btn-primary mx-3">Edit Info</a>
                                </div>
                                <div class="mt-3">
                                    <a href="${pageContext.request.contextPath}/manager/workingHours?id=${restaurant.id}" class="btn btn-primary mx-3">Hours</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </main>
    </body>

</html>
