<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Restaurant Reviews</title>
    </head>
    <body>       
        <table>
            <tr>
                <th>Customer</th>
                <th>Food Rating</th>
                <th>Service Rating</th>
                <th>Value Rating</th>
                <th>Comments</th>
            </tr>
            <c:forEach items="${reviews}" var="review">
                <tr>
                    <td>${review.customer.username}</td>
                    <td>${review.foodRating}</td>
                    <td>${review.serviceRating}</td>
                    <td>${review.valueRating}</td>
                    <td>${review.comments}</td>
                </tr>
            </c:forEach>
        </table>
        <p>
            <a href="${pageContext.request.contextPath}/manager">Back</a>
        </p>  
    </body>
</html>
