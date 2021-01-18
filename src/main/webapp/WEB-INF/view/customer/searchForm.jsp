<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Search Restaurants</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>

    <body>
        <jsp:include page="navCustomer.jsp" />

        <main class="container">
            <div class="jumbotron mx-auto mt-5 col-8 text-center bg-light">
                <h3 class="text-primary">Search Restaurants</h3>
                <h5>Use one or more fields to narrow results.</h5>
                <div class="mt-3">
                    <form:form action="${pageContext.request.contextPath}/customer/searchResults" method="get" modelAttribute="restaurant">   
                        <div>
                            <hr>
                            <label for="businessTitle">Restaurant name</label><br>
                            <form:input type="text" path="businessTitle" name="businessTitle" placeholder="Restaurant name" />
                            <hr>
                        </div>
                        <div>
                            <label for="region">Region</label><br>
                            <form:select id="region" path="region" >
                                <form:option value="" label="--- Select ---"/>
                                <form:options items="${regions}" />
                            </form:select>
                            <hr>
                        </div>
                        <div>
                            <label for="city">City</label><br>
                            <form:select id="city" path="city" >
                                <form:option value="" label="--- Select ---"/>
                                <form:options items="${cities}" />
                            </form:select>
                            <hr>
                        </div>
                        <div>
                            <label for="restaurantType">Food Category</label><br>
                            <form:select id="restaurantType" path="restaurantType.foodCategory" >
                                <form:option value="" label="--- Select ---"/>
                                <form:options items="${restaurantTypes}" itemLabel="foodCategory" itemValue="foodCategory" />
                            </form:select>
                            <hr>
                        </div>
                        <div>
                            <label for="rating">Minimum Restaurant Rating</label><br>
                            <form:input id="rating" type="number" path="ratingAverage" min="0" max="100" step="0.1" />
                            <hr>
                        </div>
                        <div class="col my-5">
                            <input class="btn btn-primary mx-3" type="submit" value="Submit"/> 
                            <a href="${pageContext.request.contextPath}/customer" class="btn btn-warning mx-3">Cancel</a>
                        </div>
                    </form:form>
                </div>
            </div>
        </main>    
    </body>

</html>



