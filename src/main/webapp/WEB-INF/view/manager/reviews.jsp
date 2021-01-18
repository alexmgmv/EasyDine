<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en"> 
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Restaurant Reviews</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>

    <body>  
        <jsp:include page="navManager.jsp" />

        <main class="container">
            <div class="jumbotron mx-auto mt-5 bg-light">
                <h3 class="text-primary">Restaurant Reviews</h3>
                <c:forEach items="${reviews}" var="review">
                    <div>
                        <hr>
                        <div class="row text-center">
                            <div class="col my-auto">
                                <h4>${review.customer.username}</h4>
                            </div>
                            <div class="col">
                                <div class="row">
                                    <div class="col">
                                        <label for="foodRating"><b>Food</b></label><br>
                                        <label for="serviceRating"><b>Service</b></label><br>
                                        <label for="valueRating"><b>Value</b></label><br>
                                    </div>
                                    <div class="col">
                                        <span id="foodRating">${review.foodRating}</span><br>
                                        <span id="serviceRating">${review.serviceRating}</span><br>
                                        <span id="valueRating">${review.valueRating}</span><br>   
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="my-3">
                            ${review.comments}
                        </div>
                    </div>
                </c:forEach>
            </div>
        </main> 
    </body>

</html>
