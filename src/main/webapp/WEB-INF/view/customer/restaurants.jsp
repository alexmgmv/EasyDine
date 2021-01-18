<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Browse Restaurants</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>

    <body>
        <jsp:include page="navCustomer.jsp" />

        <main class="container">
            <div class="jumbotron mx-auto mt-5 bg-light">
                <div class="row">
                    <h2 class="col text-primary text-center">Browse Restaurants</h2>
                    <div class="col text-right">
                        <a href="${pageContext.request.contextPath}/customer/search" class="btn btn-primary mx-3">Filter Results</a>
                    </div>
                </div>
                <c:forEach items="${restaurants}" var="restaurant">
                    <hr>
                    <div class="row">
                        <div class="col my-auto text-center">
                            <h3>${restaurant.businessTitle}</h3>
                            <h5>${restaurant.restaurantType.foodCategory} restaurant</h5>
                            <h5>${restaurant.region}, ${restaurant.city}</h5>
                        </div>
                        <div class="col my-auto text-center">
                            <h5>Rating: ${restaurant.ratingAverage}&nbsp;%</h5>
                            <div class="mt-3">
                                <a href="${pageContext.request.contextPath}/customer/restaurantDetails?id=${restaurant.id}" class="btn btn-primary mx-3">View</a>
                            </div>          
                        </div>
                    </div>
                </c:forEach>
            </div>
        </main>
    </body>

</html>
