<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
    </head>
    <body>
        <div align="center">
            <h1>${customerMsg}</h1>
            <br>
            <button onclick="location.href = '${pageContext.request.contextPath}/loginPage'" type="button">OK</button>
        </div> 
    </body>
</html>
