<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Restaurants</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>

    <body>
        <jsp:include page="navAdmin.jsp" />

        <div class="text-center p-2">
            <c:if test="${successMsg != null}" >
                <h1 class="text-success">${successMsg}</h1>
            </c:if>

            <c:if test="${failMsg != null}" >
                <h1 class="text-danger">${failMsg}</h1>
            </c:if>
        </div>

        <main class="container">
            <h3 class="text-center">Restaurants</h3>
            <div class="table-responsive mt-3">
                <table class="table table-striped table-hover">
                    <thead class="thead-dark">
                        <tr class="text-center">
                            <th>Restaurant</th>
                            <th>City</th>
                            <th>Phone</th>
                            <th>E-Mail</th>
                            <th>Manager</th>
                            <th colspan="2">
                                <a href="${pageContext.request.contextPath}/admin/addRestaurant" class="btn btn-primary">Add Restaurant</a>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${restaurants}" var="restaurant">
                            <tr class="text-center">
                                <td>${restaurant.businessTitle}</td>
                                <td>${restaurant.city}</td>
                                <td>${restaurant.phone}</td>
                                <td>${restaurant.mail}</td>
                                <td>${restaurant.manager.username}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/admin/replace?id=${restaurant.id}" class="btn btn-primary">replace Manager</a>
                                </td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/admin/delete?id=${restaurant.id}" class="btn btn-danger">remove</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </main>
    </body>

</html>
