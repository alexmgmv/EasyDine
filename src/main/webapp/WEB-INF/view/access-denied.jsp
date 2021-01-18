<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en"> 
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Security Alert</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            .textArea {
                background-color: white;
                min-height: 100%;
                min-height: 100vh;
                display: flex;
                align-items: center;
            }
        </style>
    </head>

    <body>
        <main class="container">
            <div class="jumbotron textArea">
                <section class="px-auto mx-auto text-center">
                    <h1 class="text-danger">You are NOT authorized to view this page!</h1>
                    <br><br>
                    <h3 class="text-info">Spring Security is not impressed!</h3>
                </section>
            </div>

        </main>
    </body>

</html>
