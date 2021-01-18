<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Home Page</title>
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
        <jsp:include page="navAdmin.jsp" />

        <main class="container">
            <section class="jumbotron textArea text-center mt-5">             
                <ul class="mx-auto">
                    <li class=" p-2 my-5">
                        Click <a href="${pageContext.request.contextPath}/admin/restaurants">here</a> to see a list of all registered restaurants.
                    </li>
                    <li class="p-2 my-5">
                        Click  <a href="${pageContext.request.contextPath}/admin/users">here</a> to see a list of all registered users.
                    </li>
                </ul>        
            </section>
        </main>  
    </body>

</html>
