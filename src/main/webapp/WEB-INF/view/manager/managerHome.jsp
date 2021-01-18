<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manager Home Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            .textArea {
                background-color: white;
                min-height: 100%;
                min-height: 100vh;
            }
        </style>
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
            <section class="jumbotron textArea text-center mt-5">
                <ul class="mx-auto">
                    <li class=" p-2 my-5">
                        Click <a href="${pageContext.request.contextPath}/manager/restaurant">here</a> to manage your restaurant.
                    </li>
                    <li class=" p-2 my-5">
                        Click <a href="${pageContext.request.contextPath}/manager/info">here</a> to manage your account.
                    </li>
                </ul>
            </section>
        </main>
    </body>

</html>
