<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Write a Review</title>
    </head>
    <body>
        <form:form action="${pageContext.request.contextPath}/customer/addReview" method="post" modelAttribute="review">
            <form:hidden path="customer.id" readonly="true" />
            <form:hidden path="restaurant.id" readonly="true" />
            <br>
            Food: <form:input type="number" path="foodRating" min="0" max="100" required="required" />
            <br>
            Service: <form:input type="number" path="serviceRating" min="0" max="100" required="required" />
            <br>
            Value: <form:input type="number" path="valueRating" min="0" max="100" required="required" />
            <br>
            Comments: <form:input path="comments" />
            <br>
            <input type="submit" value="submit"/>
        </form:form>
    </body>
</html>
