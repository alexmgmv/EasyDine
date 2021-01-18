<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en"> 
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Restaurant Working Hours</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>

    <body>
        <jsp:include page="navManager.jsp" />

        <main class="container">
            <div class="jumbotron mx-auto mt-5 col-md-6 text-center bg-light">
                <h3 class="text-primary">Edit Restaurant Woking Hours </h3>
                <div class="my-5">
                    <form:form action="${pageContext.request.contextPath}/manager/workingHours" method="post" modelAttribute="hours">  
                        <form:hidden id="id" path="restaurantId" readonly="true"/>
                        <div class="p-2 my-2">
                            <label for="monday"><b>Monday</b></label>
                            <div class="row px-auto">
                                <div class="col">
                                    <form:input type="Time" path="mondayOpen" id="monday" />
                                </div>
                                <div class="col-1"> to </div>
                                <div class="col">
                                    <form:input type="Time" path="mondayClose" id="monday" />
                                </div>
                            </div>
                        </div>
                        <div class="p-2 my-2">
                            <label for="tuesday"><b>Tuesday</b></label>
                            <div class="row px-auto">
                                <div class="col">
                                    <form:input type="Time" path="tuesdayOpen" id="tuesday" />
                                </div>
                                <div class="col-1"> to </div>
                                <div class="col">
                                    <form:input type="Time" path="tuesdayClose" id="tuesday" />
                                </div>
                            </div>
                        </div>
                        <div class="p-2 my-2">
                            <label for="wednesday"><b>Wednesday</b></label>
                            <div class="row px-auto">
                                <div class="col">
                                    <form:input type="Time" path="wednesdayOpen" id="wednesday" />
                                </div>
                                <div class="col-1"> to </div>
                                <div class="col">
                                    <form:input type="Time" path="wednesdayClose" id="wednesday" />
                                </div>
                            </div>
                        </div>
                        <div class="p-2 my-2">
                            <label for="thursday"><b>Thursday</b></label>
                            <div class="row px-auto">
                                <div class="col">
                                    <form:input type="Time" path="thursdayOpen" id="thursday" />
                                </div>
                                <div class="col-1"> to </div>
                                <div class="col">
                                    <form:input type="Time" path="thursdayClose" id="thursday" />
                                </div>
                            </div>
                        </div>
                        <div class="p-2 my-2">
                            <label for="friday"><b>Friday</b></label>
                            <div class="row px-auto">
                                <div class="col">
                                    <form:input type="Time" path="fridayOpen" id="friday" />
                                </div>
                                <div class="col-1"> to </div>
                                <div class="col">
                                    <form:input type="Time" path="fridayClose" id="friday" />
                                </div>
                            </div>
                        </div>
                        <div class="p-2 my-2">
                            <label for="saturday"><b>Saturday</b></label>
                            <div class="row px-auto">
                                <div class="col">
                                    <form:input type="Time" path="saturdayOpen" id="saturday" />
                                </div>
                                <div class="col-1"> to </div>
                                <div class="col">
                                    <form:input type="Time" path="saturdayClose" id="saturday" />
                                </div>
                            </div>
                        </div>
                        <div class="p-2 my-2">
                            <label for="sunday"><b>Sunday</b></label>
                            <div class="row px-auto">
                                <div class="col">
                                    <form:input type="Time" path="sundayOpen" id="sunday" />
                                </div>
                                <div class="col-1"> to </div>
                                <div class="col">
                                    <form:input type="Time" path="sundayClose" id="sunday" />
                                </div>
                            </div>
                        </div>
                        <div class="col my-5">
                            <input class="btn btn-primary mx-3" type="submit" value="Save"/> 
                            <a href="${pageContext.request.contextPath}/manager" class="btn btn-warning mx-3">Cancel</a>
                        </div>
                    </form:form>
                </div>
            </div>
        </main>
    </body>

</html>
