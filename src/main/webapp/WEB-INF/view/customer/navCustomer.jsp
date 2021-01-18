<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<nav class="navbar navbar-expand-lg bg-dark navbar-dark">
    <a class="navbar-brand mx-5" href="#">EasyDine</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav text-center">
            <li class="nav-item col px-2 py-auto mx-2 my-auto">
                <a class="nav-link" href="${pageContext.request.contextPath}/customer">Home</a>
            </li>
            <li class="nav-item col px-2 py-auto mx-2 my-auto">
                <a class="nav-link" href="${pageContext.request.contextPath}/customer/info">My Account</a>
            </li>
            <li class="nav-item col px-2 py-auto mx-2 my-auto">
                <a class="nav-link" href="${pageContext.request.contextPath}/customer/restaurants">Restaurants</a>
            </li>
            <li class="nav-item col px-2 py-auto mx-2 my-auto">
                <a class="nav-link" href="${pageContext.request.contextPath}/customer/search">Search Restaurant</a>
            </li>
            <li class="nav-item col px-2 py-auto mx-2 my-auto">
                <a class="nav-link" href="${pageContext.request.contextPath}/customer/reservations">Reservations</a>
            </li>
            <li class="nav-item col px-2 py-auto mx-2 my-auto">
                <a class="nav-link" href="${pageContext.request.contextPath}/customer/reviews">Reviews</a>
            </li>
            <li class="nav-item px-2 py-auto mx-2 my-auto">
                <form:form class="nav-link" action="${pageContext.request.contextPath}/logout" method="post">
                    <input class="bg-danger text-light p-1 border-0" type="submit" value="Logout"/>
                </form:form>
            </li>
        </ul>
    </div>
</nav>
