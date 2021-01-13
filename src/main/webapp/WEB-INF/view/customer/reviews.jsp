<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Review History</title>
    </head>
    <body>
        <div align="center">
            <h1>${customerMsg}</h1>
        </div> 
        <br>
        <table>
            <tr>
                <th>Restaurant</th>
                <th>Food</th>
                <th>Service</th>
                <th>Value</th>
                <th>Comments</th>
                <th></th>
            </tr>
            <c:forEach items="${reviews}" var="review">
                <tr>
                    <td>${review.restaurant.businessTitle}</td>
                    <td>${review.foodRating}</td>
                    <td>${review.serviceRating}</td>
                    <td>${review.valueRating}</td>
                    <td>${review.comments}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/customer/editReview?id=${review.id}">edit</a>
                        <a href="${pageContext.request.contextPath}/customer/deleteReview?id=${review.id}">delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table> 
        <p>
            <a href="${pageContext.request.contextPath}/customer">Back</a>
        </p>  
    </body>
</html>

