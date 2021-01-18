<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en"> 
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Restaurant Menu</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>

    <body>
        <jsp:include page="navManager.jsp" />

        <main class="container">
            <h3 class="text-center mt-3">Restaurant Menu</h3>
            <div class="table-responsive mt-3">
                <table class="table table-striped table-hover">
                    <thead class="thead-dark">
                        <tr class="text-center">
                            <th>Menu Item</th>
                            <th>Description</th>
                            <th>Price &euro;</th>
                            <th colspan="2">
                                <a href="${pageContext.request.contextPath}/manager/addMenu?id=${restaurant.id}" class="btn btn-primary">Add Item</a>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${menuItems}" var="menuItem">
                            <tr class="text-center">
                                <td>${menuItem.menuItem.title}</td>
                                <td>${menuItem.description}</td>
                                <td class="text-right">${menuItem.price}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/manager/editMenu?id=${menuItem.id}" class="btn btn-primary">edit</a>
                                </td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/manager/deleteMenu?id=${menuItem.id}" class="btn btn-danger">delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </main>
    </body>

</html>
