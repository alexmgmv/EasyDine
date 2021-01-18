<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en"> 
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manager Personal Information</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>

    <body> 
        <jsp:include page="navManager.jsp" />

        <div class="text-center p-2">
            <c:if test="${successMsg != null}" >
                <h1 class="text-success">${successMsg}</h1>
            </c:if>

            <c:if test="${failMsg != null}" >
                <h1 class="text-danger">${failMsg}</h1>
            </c:if>
        </div>

        <main class="container">
            <div class="jumbotron mx-auto mt-5 col-8 text-center bg-light">
                <div>
                    <h3 class="text-primary">Please enter your updated information!</h3>
                </div>
                <div class="mt-3">
                    <form:form action="${pageContext.request.contextPath}/manager/info" method="post" modelAttribute="manager">  
                        <form:hidden path="id" readonly="true"/>
                        <form:hidden path="userRole" readonly="true"/>
                        <form:hidden path="credits" readonly="true" />
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
                        <div class="col my-5">
                            <input class="btn btn-primary mx-3" type="submit" value="Submit"/> 
                            <a href="${pageContext.request.contextPath}/manager" class="btn btn-warning mx-3">Cancel</a>
                        </div>
                    </form:form>
                </div>
            </div>            
        </main>
    </body>

</html>
