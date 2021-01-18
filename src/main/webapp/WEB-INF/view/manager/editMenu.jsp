<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en"> 
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Menu Edit Form</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>

    <body> 
        <jsp:include page="navManager.jsp" />

        <main class="container">
            <div class="jumbotron mx-auto mt-5 col-8 text-center bg-light">
                <h3 class="text-primary">Add Menu Item!</h3>
                <div class="mt-3">
                    <form:form action="${pageContext.request.contextPath}/manager/editMenu" method="post" modelAttribute="menu">
                        <form:hidden path="restaurant.id" readonly="true" />
                        <form:hidden path="id" readonly="true" />
                        <form:hidden path="menuItem.id" readonly="true" />
                        <div class="p-1 my-2">
                            <label for="menuItem"><b>Menu Item</b></label><br>
                            <form:select id="menuItem" path="menuItem.id" >
                                <form:option value="" label="--------- Select ---------" />
                                <form:options items="${allMenuItems}" itemLabel="title" itemValue="id" />
                            </form:select>
                        </div>
                        <div class="p-1 my-2">
                            <label for="description"><b>Description</b></label>
                            <form:input path="description" id="description" />
                        </div>
                        <div class="p-1 my-2">
                            <label for="price"><b>Price</b></label>
                            <form:input type="number" path="price" min="0.0" step="0.1" id="price"/>
                        </div>
                        <div class="my-5">
                            <input class="btn btn-primary mx-3" type="submit" value="Submit"/> 
                            <a href="${pageContext.request.contextPath}/manager" class="btn btn-warning mx-3">Cancel</a>
                        </div>
                    </form:form>   
                </div>    
            </div>
        </main>
    </body>

</html>