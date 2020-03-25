<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .resError,.resViewer{
                font-family: "Roboto", sans-serif;
                color: #000;
                font-size: 13px;
                font-weight: 600;
                display: none;
            }
            .resViewer{
                font-family: "Roboto", sans-serif;
                font-size: 18px;
                font-weight: 800;
            }
            textArea{
                resize: none
            }
        </style>
    </head>
    <body>
        <!-- START OF TESTIMONIALS AND RESERVATION -->
        <div class="testimonials-container" id="testimonialsAndreservation">
            <div class="container">
                <div class="row">
                    <div class="header-info">
                        <h2>Patient are saying</h2>
                        <p>
                            Green above he cattle god saw day multiply under fill in the cattle fowl a all, living, tree word link available in the service for subdue fruit.                        </p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-12">
                        <div class="patient">
                            <div class="image">
                                <img src="resources/images/testimonials/patient1.webp" />
                            </div>
                            <div class="info">
                                <h3>DAREN JHONSON</h3>
                                <h5>Hp Specialist</h5>
                                <p>
                                    Elementum libero hac leo integer. Risus hac road parturient feugiat. Litora cursus hendrerit bib elit Tempus inceptos posuere metus.                                </p>
                            </div>
                        </div>
                        <br />
                        <div class="patient">
                            <div class="image">
                                <img src="resources/images/testimonials/patient2.webp" />
                            </div>
                            <div class="info">
                                <h3>DAREN JHONSON</h3>
                                <h5>Hp Specialist</h5>
                                <p>
                                    Elementum libero hac leo integer. Risus hac road parturient feugiat. Litora cursus hendrerit bib elit Tempus inceptos posuere metus.                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-12">
                        <div class="appointment-container">
                            <div class="image">
                                <div class="overlay text-center">
                                    <h3 class="mb-5">appointment now</h3>
                                    <h6 class="mb-3 resViewer" style="color: #000"></h6>
                                    <!--<form method="post" name="clientReservation">-->
                                    <form:form name="clientReservation" modelAttribute="clientReserver" id="xx">
                                        <div class="form-group">
                                            <form:input
                                                path="fullName"
                                                autocomplete="off"
                                                class="resTransparentBorder"
                                                placeholder="Full Name"
                                                ></form:input>
                                                <div class="resfullName resError"></div>
                                            </div>
                                            <div class="form-group">
                                            <form:input
                                                path="email"
                                                autocomplete="off"
                                                class="resTransparentBorder resemail"
                                                placeholder="Email Address"
                                                ></form:input>
                                                <div class="resemail resError"></div>
                                            </div>

                                            <div class="form-group">
                                            <form:input
                                                path="appointmentDate"
                                                id="datepicker"
                                                autocomplete="off"
                                                class="resTransparentBorder"
                                                placeholder="Resevation Date"
                                                ></form:input>
                                                <div class="resappointmentDate resError"></div>
                                            </div>
                                            <div class="form-group">
                                            <form:textarea
                                                path="message"
                                                cols="23"
                                                rows="4"
                                                class="resTransparentBorder"
                                                autocomplete="off"
                                                placeholder="Message"
                                                ></form:textarea>
                                                <div class="resmessage resError"></div>
                                            </div>
                                            <button class="template-btn" id="reserve">take appointment</button>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
