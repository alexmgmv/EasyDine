<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en"> 
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Confirm</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            .textArea {
                background-color: white;
                min-height: 100%;
                min-height: 100vh;
            }
            #terms {
                height: 40%;
                height: 40vh;
                overflow: auto;
            }
        </style>
    </head>

    <body>
        <main class="container">
            <div class="jumbotron textArea">
                <section class="text-center px-auto py-2 mx-auto my-2"><h1>Welcome to Easy Dine Web Application!</h1></section>
                <article id="terms">
                    <h4>Terms of use</h4>
                    Lorem, ipsum dolor sit amet consectetur adipisicing elit. Rerum incidunt unde sit natus eos, illo ea eveniet asperiores inventore aut soluta 
                    quam quod obcaecati pariatur a iste neque porro similique quibusdam! Rerum iure ipsa vitae at, esse odit neque tempora fuga ea ullam optio repudiandae 
                    autem ut nam qui eos laborum ipsum atque hic sapiente laboriosam animi porro! Maiores, sequi, consequatur aspernatur molestias totam voluptatem ex obcaecati 
                    provident aut necessitatibus architecto corrupti dolores! Repellendus vel optio incidunt illum porro. Doloribus beatae deserunt unde deleniti quibusdam 
                    nesciunt repudiandae ipsa sequi? Autem, voluptatibus explicabo doloremque porro saepe impedit cupiditate accusamus dicta rerum.
                    Lorem, ipsum dolor sit amet consectetur adipisicing elit. Rerum incidunt unde sit natus eos, illo ea eveniet asperiores inventore aut soluta 
                    quam quod obcaecati pariatur a iste neque porro similique quibusdam! Rerum iure ipsa vitae at, esse odit neque tempora fuga ea ullam optio repudiandae 
                    autem ut nam qui eos laborum ipsum atque hic sapiente laboriosam animi porro! Maiores, sequi, consequatur aspernatur molestias totam voluptatem ex obcaecati 
                    provident aut necessitatibus architecto corrupti dolores! Repellendus vel optio incidunt illum porro. Doloribus beatae deserunt unde deleniti quibusdam 
                    nesciunt repudiandae ipsa sequi? Autem, voluptatibus explicabo doloremque porro saepe impedit cupiditate accusamus dicta rerum.
                    Lorem, ipsum dolor sit amet consectetur adipisicing elit. Rerum incidunt unde sit natus eos, illo ea eveniet asperiores inventore aut soluta 
                    quam quod obcaecati pariatur a iste neque porro similique quibusdam! Rerum iure ipsa vitae at, esse odit neque tempora fuga ea ullam optio repudiandae 
                    autem ut nam qui eos laborum ipsum atque hic sapiente laboriosam animi porro! Maiores, sequi, consequatur aspernatur molestias totam voluptatem ex obcaecati 
                    provident aut necessitatibus architecto corrupti dolores! Repellendus vel optio incidunt illum porro. Doloribus beatae deserunt unde deleniti quibusdam 
                    nesciunt repudiandae ipsa sequi? Autem, voluptatibus explicabo doloremque porro saepe impedit cupiditate accusamus dicta rerum.
                    Lorem, ipsum dolor sit amet consectetur adipisicing elit. Rerum incidunt unde sit natus eos, illo ea eveniet asperiores inventore aut soluta 
                    quam quod obcaecati pariatur a iste neque porro similique quibusdam! Rerum iure ipsa vitae at, esse odit neque tempora fuga ea ullam optio repudiandae 
                    autem ut nam qui eos laborum ipsum atque hic sapiente laboriosam animi porro! Maiores, sequi, consequatur aspernatur molestias totam voluptatem ex obcaecati 
                    provident aut necessitatibus architecto corrupti dolores! Repellendus vel optio incidunt illum porro. Doloribus beatae deserunt unde deleniti quibusdam 
                    nesciunt repudiandae ipsa sequi? Autem, voluptatibus explicabo doloremque porro saepe impedit cupiditate accusamus dicta rerum.
                </article>
                <section class="text-center px-auto mx-auto mt-3 py-2">
                    <h3>Do you accept EasyDine application terms of use?</h3>
                </section>
                <section class="text-center px-auto mx-auto my-2 py-2">
                    <security:authorize access="hasRole('admin')">  
                        <form:form id="aNo" action="${pageContext.request.contextPath}/logout" method="post">                    
                        </form:form>
                        <a class="btn btn-success mx-3" href="${pageContext.request.contextPath}/admin">Accept</a>
                        <input type="submit" value="Decline" class="btn btn-danger mx-3" form="aNo"/>
                    </security:authorize>
                    <security:authorize access="hasRole('manager')">
                        <form:form id="mNo" action="${pageContext.request.contextPath}/logout" method="post">
                        </form:form>
                        <a class="btn btn-success mx-3" href="${pageContext.request.contextPath}/manager">Accept</a>
                        <input type="submit" value="Decline" class="btn btn-danger mx-3" form="mNo"/>
                    </security:authorize>
                    <security:authorize access="hasRole('customer')">
                        <form:form id="cNo" action="${pageContext.request.contextPath}/logout" method="post">
                        </form:form>
                        <a class="btn btn-success mx-3" href="${pageContext.request.contextPath}/customer">Accept</a>
                        <input type="submit" value="Decline" class="btn btn-danger mx-3" form="cNo"/>
                    </security:authorize>
                </section>
            </div>
        </main>
    </body>

</html>
