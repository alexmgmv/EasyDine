<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Customer Home Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            .textArea {
                background-color: white;
                min-height: 100%;
                min-height: 100vh;
            }
        </style>
    </head>

    <body>
        <jsp:include page="navCustomer.jsp" />

        <div class="text-center p-2">
            <c:if test="${successMsg != null}" >
                <h1 class="text-success">${successMsg}</h1>
            </c:if>

            <c:if test="${failMsg != null}" >
                <h1 class="text-danger">${failMsg}</h1>
            </c:if>
        </div>

        <main class="container">
            <section class="jumbotron textArea text-center mt-5">
                <ul class="mx-auto">
                    <li class=" p-1 mt-5">
                        Click <a href="${pageContext.request.contextPath}/customer/info">here</a> to manage your account.
                    </li>
                    <li class=" p-1 mt-5">
                        Click <a href="${pageContext.request.contextPath}/customer/restaurants">here</a> to browse restaurants.
                    </li>
                    <li class=" p-1 mt-5">
                        Click <a href="${pageContext.request.contextPath}/customer/search">here</a> to search for restaurants using filters.
                    </li>
                    <li class=" p-1 mt-5">
                        Click <a href="${pageContext.request.contextPath}/customer/reservations">here</a> to view your reservation history.
                    </li>
                    <li class=" p-1 mt-5">
                        Click <a href="${pageContext.request.contextPath}/customer/reviews">here</a> to view your review history.
                    </li>
                </ul>
            </section>
        </main>                
    </body>

</html>
