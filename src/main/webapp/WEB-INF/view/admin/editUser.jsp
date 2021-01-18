<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit User Information Form</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>

    <body> 
        <jsp:include page="navAdmin.jsp" />

        <main class="container">
            <section class="jumbotron text-center mx-auto mt-5 bg-light">
                <h3 class="text-primary">Please enter User information</h3>
                <form:form action="${pageContext.request.contextPath}/admin/editUser" method="post" modelAttribute="user">
                    <div class="row p-2 mt-5">
                        <div class="col">
                            <label for="username"><b>Username</b></label><br>
                            <form:input path="username" required="required" placeholder="username" id="username" />
                        </div>
                        <div class="col">
                            <label for="password"><b>Password</b></label><br>
                            <form:password path="password" required="required" placeholder="password" id="password" />
                        </div>
                    </div>
                    <div class="row p-2">
                        <div class="col">
                            <label for="firstName"><b>First Name</b></label><br>
                            <form:input path="firstName" placeholder="first name" id="firstName" />
                        </div>
                        <div class="col">
                            <label for="lastName"><b>Last Name</b></label><br>
                            <form:input path="lastName" placeholder="last name" id="lastName" /> 
                        </div>
                    </div>
                    <div class="row p-2">
                        <div class="col">
                            <label for="phone"><b>Phone Number</b></label><br>
                            <form:input path="phone" placeholder="phone number" id="phone" />
                        </div>
                        <div class="col">
                            <label for="mail"><b>E-Mail</b></label><br>
                            <form:input path="mail" placeholder="e-mail" id="mail" />
                        </div>
                    </div>
                    <div class="row p-2">
                        <div class="col">
                            <label for="region"><b>Region</b></label><br>
                            <form:input path="region" placeholder="region" id="region" />
                        </div>
                        <div class="col">
                            <label for="city"><b>City</b></label><br>
                            <form:input path="city" placeholder="city" id="city" />
                        </div>
                    </div>
                    <div class="row p-2">
                        <div class="col">
                            <label for="address"><b>Address</b></label><br>
                            <form:input path="address" placeholder="address" id="address" />
                        </div>
                        <div class="col">
                            <form:hidden path="id" readonly="true" />
                            <form:hidden path="userRole" readonly="true" />
                            <form:hidden path="credits" readonly="true" /><br>
                            <input class="btn btn-primary mx-3" type="submit" value="Save"/> 
                            <a href="${pageContext.request.contextPath}/admin/users" class="btn btn-warning mx-3">Cancel</a>
                        </div>
                    </div>
                </form:form>
            </section>
        </main> 
    </body>

</html>
