<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Restaurant Form</title>
    </head>
    <body>
        <div align="center">
            <h1>${adminMsg}</h1>
        </div> 
        <br>
        <form:form action="${pageContext.request.contextPath}/admin/addRestaurant" method="post" modelAttribute="restaurant">
            Restaurant title: <form:input path="businessTitle" required="required" />
            <br>
            Address: <form:input path="address" />
            <br>
            Region: <form:input path="region" />
            <br>
            City: <form:input path="city" />
            <br>
            Phone: <form:input path="phone" />
            <br>
            E-Mail: <form:input path="mail" />
            <br>
            Seat Capacity: <form:input type="number" path="seatCapacity" min="1" required="required" />
            <br>
            <label for="restaurantType">Restaurant Type: </label>
            <form:select id="restaurantType" path="restaurantType.id" items="${restaurantTypes}" itemLabel="foodCategory" itemValue="id" />
            <a href="${pageContext.request.contextPath}/admin/addRestaurantType">Add Restaurant Type</a>
            <br>
            <label for="manager">Manager: </label>
            <form:select id="manager" path="manager.id" items="${managers}" itemLabel="username" itemValue="id" />
            <a href="${pageContext.request.contextPath}/admin/addManager">Add Manager</a>
            <br>
            <input type="submit" value="save">
        </form:form>
        <p>
            <a href="${pageContext.request.contextPath}/admin">Back</a>
        </p>  
    </body>
</html>
