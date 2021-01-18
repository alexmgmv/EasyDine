<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Users</title>
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
            <h3 class="text-center">App Users</h3>
            <div class="table-responsive mt-3">
                <table class="table table-striped table-hover">
                    <thead class="thead-dark">
                        <tr class="text-center">
                            <th>Username</th>
                            <th>Name</th>
                            <th>Phone</th>
                            <th>E-Mail</th>
                            <th>Region</th>
                            <th>City</th>             
                            <th>Address</th>             
                            <th>Credits</th>             
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${users}" var="user">
                            <tr class="text-center">
                                <td>${user.username}</td>
                                <td>${user.firstName} ${user.lastName}</td>
                                <td>${user.phone}</td>
                                <td>${user.mail}</td>
                                <td>${user.region}</td>
                                <td>${user.city}</td>
                                <td>${user.address}</td>
                                <td class="text-right">${user.credits}</td>                
                                <td>
                                    <a href="${pageContext.request.contextPath}/admin/editUser?id=${user.id}" class="btn btn-primary">edit</a>
                                </td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/admin/deleteUser?id=${user.id}" class="btn btn-danger">remove</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="my-5 text-center">
                <a href="${pageContext.request.contextPath}/admin/cleanup" class="btn btn-danger">Remove All Unattached Managers</a>
            </div>
        </main>
    </body>

</html>
