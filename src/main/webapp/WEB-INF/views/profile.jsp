<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>HealthCare</title>
        <link rel="shortcut icon" href="resources/images/titleicon/favicon.png" />
        <link rel="stylesheet" href="resources/css/bootstrap.css"/>
        <link rel="stylesheet" href="resources/css/fontawesome.css"/>
        <link rel="stylesheet" href="resources/css/googlefonts.css"/>
        <link rel="stylesheet" href="resources/css/profile.css" />
        <link rel="stylesheet" href="resources/css/upper-navbar.css" />
        <link rel="stylesheet" href="resources/css/footer.css" />
        <style>
            .footer {
                padding: 2% 0%;
            }
            .footer li a i {
                font-size: 20px !important;
            }
        </style>
    </head>
    <body>
        <div class="login-container text-center">
            <!--<h1>Sign in</h1>-->
            <!--            <h1>Sign into Your Profile</h1>-->
            <div class="login col-6 border border-info">
                <h6 class="mb-3 text-center">${SORRY}</h6>
                <form:form method="POST" action="login" modelAttribute="clientlogger">
                    <p class="row"> <form:input path="fullName"
                                cssClass="col-8 form-control mb-2"
                                placeholder="Full Name"
                                autocomplete="off"
                                autofocus="true"
                                />
                    </p>
                    <p><form:errors path="fullName" cssClass="col-4 error" /></p>
                    <p class="row"><form:input path="email"
                                cssClass="col-8 form-control mb-2"
                                placeholder="Email Address"
                                autocomplete="off"
                                />
                    </p>
                    <p><form:errors path="email" cssClass="col-4 error" /> </p>
                    <button class="btnContact col-4" type="submit">Sign in</button>
                    <a href="home" class="btnContact col-4">Home Page</a>
                </div>
            </form:form>
        </div>
        <jsp:include page="../snipets/footer.jsp"/>

        <!-- Bootstrap -->
        <script type="text/javascript" src="resources/js/jquery.js"></script>
        <script type="text/javascript" src="resources/js/bootstrap.js"></script>
        <script type="text/javascript" src="resources/js/popper.js"></script>
    </body>
</html>
