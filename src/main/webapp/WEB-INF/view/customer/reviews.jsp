<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Review History</title>
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
                <h3 class="text-primary text-center">Your Reviews</h3>
                <c:forEach items="${reviews}" var="review">
                    <div>
                        <hr>
                        <div class="row text-center">
                            <div class="col my-auto">
                                <h4>${review.restaurant.businessTitle}</h4>
                            </div>
                            <div class="col my-auto">
                                <div>
                                    <label for="foodRating"><b>Food</b></label> &nbsp;
                                    <span id="foodRating">${review.foodRating}</span>
                                </div>
                                <div>
                                    <label for="serviceRating"><b>Service</b></label> &nbsp;
                                    <span id="serviceRating">${review.serviceRating}</span>
                                </div>
                                <div>
                                    <label for="valueRating"><b>Value</b></label> &nbsp;
                                    <span id="valueRating">${review.valueRating}</span> 
                                </div>
                            </div>
                            <div class="col my-auto">
                                <div class="my-3">
                                    <a href="${pageContext.request.contextPath}/customer/editReview?id=${review.id}" class="btn btn-primary">edit</a>
                                </div >
                                <div class="my-3">
                                    <a href="${pageContext.request.contextPath}/customer/deleteReview?id=${review.id}" class="btn btn-danger">delete</a>
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

