<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="shortcut icon" href="resources/images/titleicon/favicon.png" />
        <link rel="stylesheet" href="resources/css/bootstrap.css" />
        <link rel="stylesheet" href="resources/css/fontawesome.css" />
        <link href="resources/css/googlefonts.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="resources/css/login.css" />
        <link rel="stylesheet" href="resources/css/jquery-ui.min.css" />
        <link rel="stylesheet" href="resources/css/client-information.css" />
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
        <link rel="stylesheet" href="/resources/demos/style.css" />
    </head>

    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
            if (session.getAttribute("clientlogger") == null) {
                response.sendRedirect("/");
            }
        %>
        <!-- START OF CLIENT INFORMATION -->
        <div class="login-container text-center">
            <div class="login col-10">
                <div class="row">
                    <h2 class="col">Your Information</h2></div>
                    <form:form modelAttribute="clientlogger" method="post" action="editReservation">
                    <div class="row"><h3>FullName</h3>
                        <form:input
                            path="fullName"
                            class="form-control mb-2"
                            autocomplete="off"
                            title=""/>
                        <P><form:errors path="fullName" cssClass="col error"/></p>
                    </div>
                    <div class="row">
                        <h3>Reservation Date</h3>
                        <form:input
                            path="appointmentDate"
                            id="datepicker"
                            class="form-control mb-2"
                            autocomplete="off"
                            title=""
                            readonly="true"
                            />
                        <P><form:errors path="appointmentDate" cssClass="col error"/></p>
                    </div>
                    <div class="row">
                        <h3>Message</h3>
                        <form:textarea
                            path="message"
                            rows="2"
                            class="form-control mb-2"
                            cssStyle="resize: none;"
                            autocomplete="off"
                            />
                        <P><form:errors path="message" cssClass="error"/></p>
                    </div>
                    <form:hidden path="email"/>
                    <span><button class="btn btn-outline-success" ><i class="fas fa-check"></i></button></span>
                    <span><a href="cancelReservation?email=${clientlogger.email}" class="btn btn-outline-secondary" onclick="return confirm('Are You Sure You Want To Cancel Your Resrvation?')"><i class="fas fa-trash-alt"></i></a></span>
                    <span><a href="logout" class="btn btn-outline-danger" ><i class="fas fa-sign-out-alt">&nbsp;Sign Out</i></a></span>
                    <span><a href="home" class="btn btn-primary primCustom"><i class="fas fa-home">&nbsp;&nbsp;Home</i></a></span>
                </form:form>
            </div>
        </div>
        <!-- END OF CLIENT INFORMATION -->
        <script type="text/javascript" src="resources/js/jquery-1.12.4.js"></script>
        <script type="text/javascript" src="resources/js/bootstrap.js"></script>
        <script type="text/javascript" src="resources/js/popper.js"></script>
        <script type="text/javascript" src="resources/js/jquery-ui.js"></script>
        <script type="text/javascript" src="resources/js/custom.js"></script>
    </body>
</html>
