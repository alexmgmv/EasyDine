<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Account Info</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>

    <body>
        <jsp:include page="navCustomer.jsp" />

        <main class="container">
            <div class="jumbotron mx-auto mt-5 col-8 text-center bg-light">
                <div>
                    <h3 class="text-primary">Please enter your updated information!</h3>
                </div>
                <div class="mt-3">
                    <form:form action="${pageContext.request.contextPath}/customer/info" method="post" modelAttribute="user">
                        <form:hidden path="id" readonly="true" />
                        <form:hidden path="userRole" value="2" readonly="true"/>
                        <div class="row p-2">
                            <div class="col">
                                <label for="username"><b>Username</b></label>
                            </div>
                            <div class="col">
                                <form:input path="username" required="required" placeholder="Your username" name="username" />
                            </div>
                        </div>
                        <div class="row p-2">
                            <div class="col">
                                <label for="password"><b>Password</b></label>
                            </div>
                            <div class="col">
                                <form:password path="password" required="required" placeholder="Your password" name="password" />
                            </div>
                        </div>
                        <div class="row p-2">
                            <div class="col">
                                <label for="firstName"><b>First Name</b></label>
                            </div>
                            <div class="col">
                                <form:input path="firstName" placeholder="Your first name" name="firstName" />
                            </div>
                        </div>
                        <div class="row p-2">
                            <div class="col">
                                <label for="lastName"><b>Last Name</b></label>
                            </div>
                            <div class="col">
                                <form:input path="lastName" placeholder="Your last name" name="lastName" /> 
                            </div>
                        </div>
                        <div class="row p-2">
                            <div class="col">
                                <label for="phone"><b>Phone Number</b></label>
                            </div>
                            <div class="col">
                                <form:input path="phone" placeholder="Your phone number" name="phone" />
                            </div>
                        </div>
                        <div class="row p-2">
                            <div class="col">
                                <label for="mail"><b>E-Mail</b></label>
                            </div>
                            <div class="col">
                                <form:input path="mail" placeholder="Your e-mail" name="mail" />
                            </div>
                        </div>
                        <div class="row p-2">
                            <div class="col">
                                <label for="address"><b>Address</b></label>
                            </div>
                            <div class="col">
                                <form:input path="address" placeholder="Your address" name="address" />
                            </div>
                        </div>
                        <div class="row p-2">
                            <div class="col">
                                <label for="region"><b>Region</b></label><br>
                            </div>
                            <div class="col">
                                <form:input path="region" placeholder="Your region" name="region" />
                            </div>
                        </div>
                        <div class="row p-2">
                            <div class="col">
                                <label for="city"><b>City</b></label>
                            </div>
                            <div class="col">
                                <form:input path="city" placeholder="Your city" name="city" />
                            </div>
                        </div>
                        <div class="row p-2">
                            <div class="col">
                                <label for="credits"><b>App Credits &euro;</b></label>
                            </div>
                            <div class="col">
                                <form:input path="credits" readonly="true" name="credits" />
                            </div>
                        </div>
                        <div class="col my-5">
                            <input class="btn btn-primary mx-3" type="submit" value="Submit"/> 
                            <a href="${pageContext.request.contextPath}/customer" class="btn btn-warning mx-3">Cancel</a>
                        </div>
                    </form:form>
                </div>
                <div class="mt-5">
                    <a href="${pageContext.request.contextPath}/customer/remove?id=${user.id}" class="btn btn-danger mx-3">Delete Account</a>
                </div>  
            </div>            
        </main>
    </body>

</html>
