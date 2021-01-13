<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Restaurant Menu</title>
    </head>
    <body>
        <table>
            <tr>
                <th>Menu Item</th>
                <th>Description</th>
                <th>Price</th>
                <th></th>
            </tr>
            <c:forEach items="${menuItems}" var="menuItem">
                <tr>
                    <td>${menuItem.menuItem.title}</td>
                    <td>${menuItem.description}</td>
                    <td>${menuItem.price} &euro;</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/manager/editMenu?id=${menuItem.id}">edit</a>
                        <a href="${pageContext.request.contextPath}/manager/deleteMenu?id=${menuItem.id}">delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <p>
            <a href="${pageContext.request.contextPath}/manager/addMenu?id=${restaurant.id}">Add Item</a>
        </p>  
        <p>
            <a href="${pageContext.request.contextPath}/manager">Back</a>
        </p>  
    </body>
</html>
