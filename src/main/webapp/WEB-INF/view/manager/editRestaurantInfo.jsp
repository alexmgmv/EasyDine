<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en"> 
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Restaurant Edit Form</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>

    <body>
        <jsp:include page="navManager.jsp" />

        <div class="jumbotron mx-auto mt-5 col-8 text-center bg-light">
            <h3 class="text-primary">Please enter restaurant information!</h3>
            <div class="mt-3">
                <form:form action="${pageContext.request.contextPath}/manager/editRestaurantInfo" method="post" modelAttribute="restaurant">
                    <form:hidden id="manager" path="manager" readonly="true"/>
                    <form:hidden id="id" path="id" readonly="true"/>
                    <form:hidden id="ratingAverage" path="ratingAverage" readonly="true"/>
                    <div class="p-1 my-1">
                        <label for="businessTitle"><b>Restaurant title</b></label><br>
                        <form:input path="businessTitle" required="required" id="businessTitle" placeholder="Restaurant title" />
                    </div>
                    <div class="p-1 my-1">
                        <label for="restaurantType"><b>Food Category</b></label><br>
                        <form:select id="restaurantType" path="restaurantType.id" required="required" >
                            <form:option value="" label="--- Select ---"/>
                            <form:options items="${restaurantTypes}" itemLabel="foodCategory" itemValue="id" />
                        </form:select>
                    </div>
                    <div class="p-1 my-1">
                        <label for="address"><b>Address</b></label><br>
                        <form:input path="address" id="address" placeholder="Address" />
                    </div>
                    <div class="p-1 my-1">
                        <label for="region"><b>Region</b></label><br>
                        <form:input path="region" id="region" placeholder="Region" />
                    </div>
                    <div class="p-1 my-1">
                        <label for="city"><b>City</b></label><br>
                        <form:input path="city" id="city" placeholder="City" />
                    </div>
                    <div class="p-1 my-1">
                        <label for="phone"><b>Phone</b></label><br>
                        <form:input path="phone" id="phone" placeholder="Phone" />
                    </div>
                    <div class="p-1 my-1">
                        <label for="mail"><b>E-Mail</b></label><br>
                        <form:input path="mail" id="mail" placeholder="E-Mail" />
                    </div>
                    <div class="p-1 my-1">
                        <label for="seatCapacity"><b>Seat Capacity</b></label><br>
                        <form:input type="number" path="seatCapacity" min="1" required="required" id="seatCapacity" />
                    </div>
                    <div class="col my-5">
                        <input class="btn btn-primary mx-3" type="submit" value="Save"/> 
                        <a href="${pageContext.request.contextPath}/manager" class="btn btn-warning mx-3">Cancel</a>
                    </div>
                </form:form>
            </div>
        </div>
    </body>

</html>