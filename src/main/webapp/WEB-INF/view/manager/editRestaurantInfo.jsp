<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Restaurant Edit Form</title>
    </head>
    <body> 
        <form:form action="${pageContext.request.contextPath}/manager/editRestaurantInfo" method="post" modelAttribute="restaurant">   
            <form:hidden id="manager" path="manager" readonly="true"/>
            <form:hidden id="id" path="id" readonly="true"/>
            <br>
            Restaurant Title: <form:input path="businessTitle"/>
            <br>
            <label for="restaurantType">Food Category: </label>
            <form:select id="restaurantType" path="restaurantType.id" items="${restaurantTypes}" itemLabel="foodCategory" itemValue="id"/>
            <br>
            Address: <form:input path="address"/>
            <br>
            Region: <form:input path="region"/>
            <br>
            City: <form:input path="city"/>
            <br>  
            Phone: <form:input path="phone"/>
            <br>
            E-Mail: <form:input path="mail"/>
            <br>
            Seat Capacity: <form:input path="seatCapacity"/>
            <br>
            <form:hidden id="ratingAverage" path="ratingAverage" readonly="true"/>
            <br>
            <input type="submit" value="edit">
        </form:form>
        <p>
            <a href="${pageContext.request.contextPath}/manager">Back</a>
        </p>  
    </body>
</html>