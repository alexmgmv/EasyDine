<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en"> 
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register Form</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>

    <body>
        <main class="container">
            <section class="jumbotron text-center mx-auto mt-5 bg-light">
                <h3 class="text-primary">Please input your information</h3>
                <form:form action="${pageContext.request.contextPath}/signup" method="post" modelAttribute="customer">
                    <div class="row p-2 mt-5">
                        <div class="col">
                            <label for="username"><b>Username</b></label><br>
                            <form:input path="username" required="required" placeholder="username" name="username" />
                        </div>
                        <div class="col">
                            <label for="password"><b>Password</b></label><br>
                            <form:password path="password" required="required" placeholder="password" name="password" />
                        </div>
                    </div>
                    <div class="row p-2">
                        <div class="col">
                            <label for="firstName"><b>First Name</b></label><br>
                            <form:input path="firstName" placeholder="your first name" name="firstName" />
                        </div>
                        <div class="col">
                            <label for="lastName"><b>Last Name</b></label><br>
                            <form:input path="lastName" placeholder="your last name" name="lastName" /> 
                        </div>
                    </div>
                    <div class="row p-2">
                        <div class="col">
                            <label for="phone"><b>Phone Number</b></label><br>
                            <form:input path="phone" placeholder="your phone number" name="phone" />
                        </div>
                        <div class="col">
                            <label for="mail"><b>E-Mail</b></label><br>
                            <form:input path="mail" placeholder="your e-mail" name="mail" />
                        </div>
                    </div>
                    <div class="row p-2">
                        <div class="col">
                            <label for="region"><b>Region</b></label><br>
                            <form:input path="region" placeholder="your region" name="region" />
                        </div>
                        <div class="col">
                            <label for="city"><b>City</b></label><br>
                            <form:input path="city" placeholder="your city" name="city" />
                        </div>
                    </div>
                    <div class="row p-2">
                        <div class="col">
                            <label for="address"><b>Address</b></label><br>
                            <form:input path="address" placeholder="your address" name="address" />
                        </div>
                        <div class="col">
                            <form:hidden path="userRole.id" value="2" readonly="true" /><br>
                            <input class="btn btn-primary mx-3" type="submit" value="Submit"/> 
                            <a href="${pageContext.request.contextPath}/loginPage" class="btn btn-warning mx-3">Cancel</a>
                        </div>
                    </div>
                </form:form>
            </section>
        </main>     
    </body>

</html>
