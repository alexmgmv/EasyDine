<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en"> 
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register Reservation</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>

    <body>
        <jsp:include page="navManager.jsp" />

        <main class="container">
            <div class="jumbotron mx-auto mt-5 col-8 text-center bg-light">
                <h3 class="text-primary">Register Customer Reservation!</h3>
                <div class="mt-3">
                    <form:form action="${pageContext.request.contextPath}/manager/addReservation" method="post" modelAttribute="reservation">
                        <form:hidden path="customer.id" readonly="true" />
                        <form:hidden path="restaurant.id" readonly="true" />
                        <form:hidden path="restaurant.seatCapacity" readonly="true" />
                        <div class="p-1 my-2">
                            <label for="arrivalDate"><b>Date</b></label><br>
                            <form:input id="arrivalDate" type="date" path="arrivalDate" required="required" />
                        </div>
                        <div class="p-1 my-2">
                            <label for="arrival"><b>Arrival</b></label><br>
                            <form:input id="arrival" type="time" path="arrival" max="23:00" required="required" />
                        </div>
                        <div class="p-1 my-2">
                            <label for="departure"><b>Departure</b></label><br>
                            <form:input id="departure" type="time" path="departure" required="required" />
                        </div>
                        <div class="p-1 my-2">
                            <label for="number"><b>Number of People</b></label><br>
                            <form:input type="number" path="numberOfPeople" min="1" max="20" required="required" />
                        </div>
                        <div class="p-1 my-2">
                            <label for="choice"><b>Menu Choice</b></label><br>
                            <form:select id="choice" path="menuChoice" required="required" >
                                <form:option value="" label="--------- Select ---------" />
                                <form:options items="${restaurantMenuItems}" itemLabel="menuItem.title" itemValue="id" />
                            </form:select>
                        </div>
                        <div class="p-1 my-2">
                            <label for="paymentMethod"><b>Payment method</b></label><br>
                            <form:input path="paymentMethod" value="cash" readonly="true" />
                        </div>
                        <div class="p-1 my-2">
                            <label for="comments"><b>Comments</b></label><br>
                            <form:input path="comments" />
                        </div>
                        <div class="my-5">
                            <input class="btn btn-primary mx-3" type="submit" value="Submit"/> 
                            <a href="${pageContext.request.contextPath}/manager" class="btn btn-warning mx-3">Cancel</a>
                        </div>
                    </form:form>
                </div>
            </div>
        </main>
        
        <script src="${pageContext.request.contextPath}/js/today.js"></script>
    </body>

</html>
