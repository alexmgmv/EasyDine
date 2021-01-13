<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Make a Reservation</title>
    </head>
    <body>
        <form:form action="${pageContext.request.contextPath}/customer/addReservation" method="post" modelAttribute="reservation">
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
            <form:hidden path="departure" />
            Number of People: <form:input type="number" path="numberOfPeople" min="1" max="200" required="required" />
            <br>
            <label for="choice">Menu Choice: </label>
            <form:select id="choice" path="menuChoice" items="${restaurantMenu}" itemLabel="menuItem.title" itemValue="id" />
            <br>
            <label for="paymentMethod">Payment method: </label>
            <form:select id="paymentMethod" path="paymentMethod">
                <form:option value="app credits" />
                <form:option value="cash" />
                <form:option value="credit card" />
            </form:select>
            <br>
            Comments: <form:input path="comments" />
            <br>
            <input type="submit" value="submit"/>
        </form:form>
    </body>
</html>
