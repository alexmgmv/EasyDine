<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Restaurant Info</title>
    </head>
    <body>
        <section>
            <h2>${restaurant.businessTitle}</h2>
            <h4>${restaurant.restaurantType.foodCategory} Restaurant</h4>   
            <p>
                <a href="${pageContext.request.contextPath}/customer/addReservation?id=${restaurant.id}">Reserve Table</a>
            </p>
        </section>
        <hr>
        <section>
            <h4>Location</h4>
            <p>
                ${restaurant.address}, ${restaurant.region}, ${restaurant.city}
            </p>
        </section>
        <hr>
        <section>
            <h4>Contact</h4>
            <p>
                ${restaurant.phone}<br>${restaurant.mail}      
            </p>
        </section>
        <hr>
        <section>
            <h4>Working Hours</h4>
            <p>
                Monday: ${restaurant.workingHours.mondayOpen} to ${restaurant.workingHours.mondayClose} |
                Tuesday: ${restaurant.workingHours.tuesdayOpen} to ${restaurant.workingHours.tuesdayClose} |
                Wednesday: ${restaurant.workingHours.wednesdayOpen} to ${restaurant.workingHours.wednesdayClose} |
                Thursday: ${restaurant.workingHours.thursdayOpen} to ${restaurant.workingHours.thursdayClose} |
                Friday: ${restaurant.workingHours.fridayOpen} to ${restaurant.workingHours.fridayClose} |
                Saturday: ${restaurant.workingHours.saturdayOpen} to ${restaurant.workingHours.saturdayClose} |
                Sunday: ${restaurant.workingHours.sundayOpen} to ${restaurant.workingHours.sundayClose} |
            </p>          
        </section>
        <hr>
        <section>
            <h4>Menu</h4>
            <c:forEach items="${restaurant.restaurantMenus}" var="menu">
                ${menu.menuItem.title}: ${menu.description} | Price: ${menu.price}&euro;<br>                
            </c:forEach>
        </section>
        <hr>
        <section>
            <h4>Reviews</h4>
            <h5>Average Rating: ${restaurant.ratingAverage}</h5>
            <c:forEach items="${restaurant.reviews}" var="review">
                <section>
                    ${review.customer.username}<br>
                    <p>
                        Food = ${review.foodRating} | Service = ${review.serviceRating} | Value = ${review.valueRating}<br><br>            
                        ${review.comments}
                    </p>
                    <hr>
                </section>                  
            </c:forEach>
        </section>
        <p>
            <a href="${pageContext.request.contextPath}/customer">Back</a>
        </p>  
    </body>
</html>