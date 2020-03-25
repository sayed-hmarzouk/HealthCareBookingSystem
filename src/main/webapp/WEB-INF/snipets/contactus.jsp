<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .conViewer, .conError{
                font-family: "Roboto", sans-serif;
                color: #222;
                font-weight: bolder;
                display: none;
            }
            .conViewer{
                padding-top: 5%;
            }
            .conError{
                padding-top: 3px;
                width: 100%;
                text-align: center;
                font-size: 12px;
            }

        </style>

    </head>
    <body>
        <!-- START OF CONTACT US -->
        <div class="contact-container" id="contactus">
            <div class="container contact-form">
                <div class="contact-image">
                    <img src="resources/images/contact/contact.png" alt="rocket_contact" />
                </div>
                <h6 class="mb-3 conViewer text-center">SDFSD</h6>
                <form:form name="clientContact" modelAttribute="contactUs">
                    <h3>Drop Us a Message</h3>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <form:input
                                    path="fullName"
                                    class="form-control conTransparentBorder"
                                    placeholder="Full Name"  ></form:input>
                                    <div class="confullName conError"></div>
                                </div>
                                <div class="form-group">
                                <form:input
                                    path="email"
                                    class="form-control conTransparentBorder"
                                    placeholder="Email Address"></form:input>
                                    <div class="conemail conError"></div>
                                </div>
                                <div class="form-group">
                                    <input
                                        type="hidden"
                                        name="clientPhone"
                                        class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <input type="submit" id="contacter" name="btnSubmit" style="width: 100%" class="btnContact" value="Send Message" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                <form:textarea
                                    path="message"
                                    class="form-control conTransparentBorder"
                                    placeholder="Message"
                                    style="width: 100%; height: 150px;"></form:textarea>
                                    <div class="conmessage conError"></div>
                                </div>
                            </div>
                    </form:form>
                </div>
            </div>
        </div>
        <!-- END OF CONTACT US -->
    </body>
</html>
