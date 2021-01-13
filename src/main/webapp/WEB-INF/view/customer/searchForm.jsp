<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Restaurants</title>
    </head>

    <body>
        <h3>Search Restaurants</h3>
        <form:form action="${pageContext.request.contextPath}/customer/searchResults" method="get" modelAttribute="restaurant">         
            Restaurant title: <form:input type="text" path="businessTitle" />
            <br>
            <label for="region">Region: </label>
            <form:select id="region" path="region" >
                <form:option value="" label="--- Select ---"/>
                <form:options items="${regions}" />
            </form:select>
            <br>
            <label for="city">City: </label>
            <form:select id="city" path="city" >
                <form:option value="" label="--- Select ---"/>
                <form:options items="${cities}" />
            </form:select>
            <br>
            <label for="restaurantType">Food Category: </label>
            <form:select id="restaurantType" path="restaurantType.foodCategory" >
                <form:option value="" label="--- Select ---"/>
                <form:options items="${restaurantTypes}" itemLabel="foodCategory" itemValue="foodCategory" />
            </form:select>
            <br>
            <label for="rating">Minimum Restaurant Rating: </label>
            <form:input id="rating" type="number" path="ratingAverage" min="0" max="100" step="0.1" />
            <br>
            <input type="submit" value="submit"/>
        </form:form>
    </body>
</html>



