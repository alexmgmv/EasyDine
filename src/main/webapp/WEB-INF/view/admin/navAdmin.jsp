<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<nav class="navbar navbar-expand-md bg-dark navbar-dark">
    <a class="navbar-brand mx-5" href="#">EasyDine</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav text-center">
            <li class="nav-item col px-3 py-auto mx-3 my-auto">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin">Home</a>
            </li>
            <li class="nav-item col px-3 py-auto mx-3 my-auto">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/restaurants">Restaurants</a>
            </li>
            <li class="nav-item col px-3 py-auto mx-3 my-auto">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/users">Users</a>
            </li>
            <li class="nav-item px-3 py-auto mx-3 my-auto">
                <form:form class="nav-link" action="${pageContext.request.contextPath}/logout" method="post">
                    <input class="bg-danger text-light p-1 border-0" type="submit" value="Logout"/>
                </form:form>
            </li>
        </ul>
    </div>
</nav>
