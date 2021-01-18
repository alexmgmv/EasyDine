<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Restaurant Info</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>

    <body>
        <jsp:include page="navCustomer.jsp" />

        <main class="container">
            <div class="jumbotron mx-auto mt-5 bg-light">
                <div>
                    <h1 class="text-center">${restaurant.businessTitle}</h1>
                    <div class="row mx-auto my-3 text-center">
                        <div class="col">
                            <h4>${restaurant.restaurantType.foodCategory} restaurant</h4> 
                        </div>
                        <div class="col my-auto">
                            <a href="${pageContext.request.contextPath}/customer/addReservation?id=${restaurant.id}" class="btn btn-primary">Reserve Table</a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col text-center my-auto">
                        <div class="my-auto">
                            <h3>Location</h3>
                            ${restaurant.address}, ${restaurant.region}, ${restaurant.city}
                        </div>
                        <br><hr><br>
                        <div class="my-auto">
                            <h3>Contact</h3>
                            ${restaurant.phone}<br>${restaurant.mail}
                        </div>
                    </div>
                    <hr>
                    <div class="col">
                        <h3 class="text-center">Working Hours</h3>
                        <div>
                            <div class="row">
                                <div class="col text-left"><label for="Monday">Monday</label></div>
                                <div class="col text-center" id="Monday">${restaurant.workingHours.mondayOpen} - ${restaurant.workingHours.mondayClose}</div>
                            </div>
                            <div class="row">
                                <div class="col text-left"><label for="Tuesday">Tuesday</label></div>
                                <div class="col text-center" id="Tuesday">${restaurant.workingHours.tuesdayOpen} - ${restaurant.workingHours.tuesdayClose}</div>
                            </div>
                            <div class="row">
                                <div class="col text-left"><label for="Wednesday">Wednesday</label></div>
                                <div class="col text-center" id="Wednesday">${restaurant.workingHours.wednesdayOpen} - ${restaurant.workingHours.wednesdayClose}</div>
                            </div>
                            <div class="row">
                                <div class="col text-left"><label for="Thursday">Thursday</label></div>
                                <div class="col text-center" id="Thursday">${restaurant.workingHours.thursdayOpen} - ${restaurant.workingHours.thursdayClose}</div>
                            </div>
                            <div class="row">
                                <div class="col text-left"><label for="Friday">Friday</label></div>
                                <div class="col text-center" id="Friday">${restaurant.workingHours.fridayOpen} - ${restaurant.workingHours.fridayClose}</div>
                            </div>
                            <div class="row">
                                <div class="col text-left"><label for="Saturday">Saturday</label></div>
                                <div class="col text-center" id="Saturday">${restaurant.workingHours.saturdayOpen} - ${restaurant.workingHours.saturdayClose}</div>
                            </div>
                            <div class="row">
                                <div class="col text-left"><label for="Sunday">Sunday</label></div>
                                <div class="col text-center" id="Sunday">${restaurant.workingHours.sundayOpen} - ${restaurant.workingHours.sundayClose}</div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
                <div>
                    <h3 class="text-center">Menu</h3>
                    <c:forEach items="${restaurant.restaurantMenus}" var="menu">
                        <div class="row p-2 mt-2">
                            <div class="col text-left">
                                ${menu.menuItem.title}:
                            </div>
                            <div class="col text-center">
                                ${menu.description}
                            </div>
                            <div class="col text-right">
                                ${menu.price}&euro;
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <hr>
                <div>
                    <h3 class="text-center">Reviews</h3>
                    <h4 class="text-left">Average Rating: ${restaurant.ratingAverage}&nbsp;%</h4>
                    <c:forEach items="${restaurant.reviews}" var="review">
                        <div class="p-2 mt-3">
                            <div class="row">
                                <div class="col">
                                    ${review.customer.username}
                                </div>
                                <div class="col text-right">
                                    <h5>Food: ${review.foodRating}&nbsp;%&nbsp; Service: ${review.serviceRating}&nbsp;%&nbsp; Value: ${review.valueRating}&nbsp;%</h5>                                        
                                </div>
                            </div>
                            ${review.comments}
                        </div>
                    </c:forEach>
                </div>
            </div>
        </main>

    </body>

</html>