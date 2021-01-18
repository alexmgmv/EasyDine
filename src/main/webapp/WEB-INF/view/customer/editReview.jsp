<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit Review</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>

    <body>
        <jsp:include page="navCustomer.jsp" />

        <main class="container">
            <div class="jumbotron mx-auto mt-5 col-8 text-center bg-light">
                <h3 class="text-primary">Review Restaurant</h3>
                <div class="mt-3">
                    <form:form action="${pageContext.request.contextPath}/customer/editReview" method="post" modelAttribute="review">
                        <form:hidden path="id" readonly="true" />
                        <form:hidden path="customer.id" readonly="true" />
                        <form:hidden path="restaurant.id" readonly="true" />
                        <div class="p-1 my-2">
                            <label for="foodRating"><b>Food</b></label><br>
                            <form:input type="number" path="foodRating" min="0" max="100" required="required" id="foodRating" />
                        </div>
                        <div class="p-1 my-2">
                            <label for="serviceRating"><b>Service</b></label><br>
                            <form:input type="number" path="serviceRating" min="0" max="100" required="required" id="serviceRating" />
                        </div>
                        <div class="p-1 my-2">
                            <label for="valueRating"><b>Value for Money</b></label><br>
                            <form:input type="number" path="valueRating" min="0" max="100" required="required" id="valueRating" />
                        </div>
                    </div>
                    <div class="p-1 my-2">
                        <label for="comments"><b>Comments</b></label><br>
                        <form:input path="comments" id="comments" />
                    </div>
                    <div class="col my-5">
                        <input class="btn btn-primary mx-3" type="submit" value="Submit"/> 
                        <a href="${pageContext.request.contextPath}/customer" class="btn btn-warning mx-3">Cancel</a>
                    </div>
                </form:form>   
            </div>
        </main>   
    </body>

</html>
