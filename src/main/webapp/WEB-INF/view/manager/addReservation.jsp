<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Reservation</title>
    </head>
    <body>
        <form:form action="${pageContext.request.contextPath}/manager/addReservation" method="post" modelAttribute="reservation">
            <form:hidden path="customer.id" readonly="true" />
            <form:hidden path="restaurant.id" readonly="true" />
            <form:hidden path="restaurant.seatCapacity" readonly="true" />
            <br>
            <label for="arrivalDate">Date: </label>
            <form:input id="arrivalDate" type="date" path="arrivalDate" />
            <br>
            <label for="arrival">Arrival: </label>
            <form:input id="arrival" type="time" path="arrival" />
            <br>
            <label for="departure">Departure: </label>
            <form:input id="departure" type="time" path="departure" />
            <br>
            Number of People: <form:input type="number" path="numberOfPeople" min="1" max="20" />
            <br>
            <label for="choice">Menu Choice: </label>
            <form:select id="choice" path="menuChoice" items="${restaurantMenuItems}" itemLabel="menuItem.title" itemValue="id" />
            <br>
            Payment method: <form:input path="paymentMethod" value="cash" readonly="true" />
            <br>
            Comments: <form:input path="comments" />
            <br>
            <input type="submit" value="save"/>
        </form:form>
    </body>
</html>
