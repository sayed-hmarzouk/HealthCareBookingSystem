///<reference path="../typings/globals/jquery/index.d.ts" />

$(document).ready(function () {

//START OF CHANGE ACTIVE CLASS POSITION AND NAVIGATE TO SECTION
    $('.bottom-navbar-container .bottom-navbar .navbar-light .navbar-nav a').click(function () {
        $('.bottom-navbar-container a').removeClass('active');
        $(this).addClass('active');
        $('html,body').animate({
            scrollTop: $("#" + $(this).data('navigator')).offset().top
        }, 2000);
    });
    //END OF CHANGE ACTIVE CLASS POSITION AND NAVIGATE TO SECTION

    //START OF CHANGE THE POSITION OF NAVBAR TO TOP AND DOWN WHEN SCROLLING DOWN
    $(window).scroll(function () {
        if ($(document).scrollTop() > ($('.upper-navbar').innerHeight()) * 0.75) {
            $('.bottom-navbar-container .bottom-navbar').css({"top": '0px', "background-color": "#F9F9FD"});
        } else {
            $('.bottom-navbar-container .bottom-navbar').css({top: $('.upper-navbar').innerHeight(), "background-color": "transparent"});
        }
    });
    // ENDING OF CHANGE THE POSITION OF NAVBAR TO TOP AND DOWN WHEN SCROLLING DOWN


// START OF DATEPICKERCUSTOMIZATION
    $(function () {
        $("#datepicker").datepicker({
            dateFormat: 'dd-mm-yy',
            showAnim: ''
        });
    });
    $(window).resize(function () {
        var field = $(document.activeElement);
        if (field.is('.hasDatepicker')) {
            field.datepicker('hide').datepicker('show');
        }
    });
// END OF DATEPICKERCUSTOMIZATION


// START RESERVATION AJAX
    $('#reserve').click(function (event) {
        event.preventDefault();
        $.fn.myFunction('.resError', '.resTransparentBorder', 'POST', 'reserve', 'form[name=clientReservation]', '.res', '.resemail', '.resViewer');
    });
// END RESERVATION AJAX


// START CONTACT US AJAX
    $('#contacter').click(function (event) {
        event.preventDefault();
        $.fn.myFunction('.conError', '.conTransparentBorder', 'POST', 'contact', 'form[name=clientContact]', '.con', '.conemail', '.conViewer');
    });
// END CONTACT US AJAX


//START CONTACT US AJAX FUNCTION
    $.fn.myFunction = function (errorMessages, transparentBorder, methodType, url, formData, prefix, duplicateEmail, operationResult) {
        $(errorMessages).fadeOut();
        if (prefix === '.res') {
            $(transparentBorder).css('border', '2px solid transparent');
        } else {
            $(transparentBorder).css('border', '1px solid #ced4da');
        }
        $.ajax({
            type: methodType,
            url: url,
            data: $(formData).serialize(),
            success: function (res) {
                if (res["Message"] === "SORRY") {
                    $.each(res, function (key, value) {
                        $(prefix + key + '').fadeIn().text(value).prev().css('border', '3px solid #D93025');
                    });
                } else if (res["Message"] === "Sorry Try With Another Mail Please") {
                    $(duplicateEmail).text(res["Message"]).fadeIn().prev().css('border', '3px solid #D93025');
                } else {
                    $(operationResult).text(res["Message"]).fadeIn(5000).fadeOut(5000);
                    $(formData).each(function () {
                        this.reset();
                    });
                }
            }
        });
    };
    //START CONTACT US AJAX FUNCTION
});
//++++++++++++++++++++++++++++++++++++++