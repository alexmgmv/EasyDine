<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Home Page</title>
    </head>
    <body>
        <div align="center">
            <h1>${customerMsg}</h1>
        </div> 
        <p>
            <a href="${pageContext.request.contextPath}/customer/info">Edit Personal Info</a>
        </p>
        <p>
            <a href="${pageContext.request.contextPath}/customer/restaurants">View & Search Restaurants</a>
        </p>
        <p>
            <a href="${pageContext.request.contextPath}/customer/reservations">Reservations</a>
        </p>
        <p>
            <a href="${pageContext.request.contextPath}/customer/reviews">Reviews</a>
        </p>
        <p>
            <a href="${pageContext.request.contextPath}/">Home</a>
        </p>  
    </body>
</html>
