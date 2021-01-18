<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Replace Manager Form</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>

    <body>
        <jsp:include page="navAdmin.jsp" />

        <main class="container">
            <section class="jumbotron text-center mx-auto mt-5 bg-light">
                <h3 class="text-primary">Please choose Manager for Restaurant</h3>
                <form:form action="${pageContext.request.contextPath}/admin/replace" method="post" modelAttribute="restaurant">
                    <div class="p-2 mt-5">
                        <label for="businessTitle"><b>Restaurant title</b></label><br>
                        <form:input path="businessTitle" id="businessTitle" readonly="true" />
                    </div>
                    <div class="p-2 my-2">
                        <label for="manager"><b>Manager</b></label><br>
                        <form:select id="manager" path="manager.id" items="${managers}" itemLabel="username" itemValue="id" />
                        <a href="${pageContext.request.contextPath}/admin/addManager" class="btn btn-primary mx-3">Add</a>
                        <form:hidden path="id" readonly="true" />
                        <form:hidden path="seatCapacity" readonly="true" />
                        <form:hidden path="restaurantType.id" readonly="true" />
                    </div>
                    <div class="col my-5">
                        <input class="btn btn-primary mx-3" type="submit" value="Save"/> 
                        <a href="${pageContext.request.contextPath}/admin/restaurants" class="btn btn-warning mx-3">Cancel</a>
                    </div>
                </form:form>
            </section>
        </main> 
    </body>

</html>
