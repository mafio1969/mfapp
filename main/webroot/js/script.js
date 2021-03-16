document.addEventListener('DOMContentLoaded', function () {

    //


});


$(document).ready(function () {

    $('#top-slider').slick({
        dots: true,
        slidesToShow: 3,
        slidesToScroll: 3,
        responsive: [
            {
                breakpoint: 767,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 2
                }
            },
            {
                breakpoint: 480,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            }
        ]
    });

    $(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });

    $('input[type="checkbox"]').click(function () {
        if ($(this).is(':checked')) {
            $(this).addClass('checked');
        } else {
            $(this).removeClass('checked');
        }
    });

    $('input[type="file"]').change(function (e) {
        var fileName = e.target.files[0].name;
        document.getElementById("file-name").innerHTML = fileName;
    });

    $('.role-inner input[type="checkbox"]').click(function () {
        if ($(this).is(':checked')) {
            $(this).parent().addClass('active-role');
        } else {
            $(this).parent().removeClass('active-role');
        }
    });

    if ($('.settings-email').hasClass('checked')) {
        $newsletterEmail = $('.settings-email.checked');
        $newsletterEmail.attr('checked', 'checked');
        $newsletterEmail.parent().parent().parent().find('.emailSelect').addClass('active-select');
    }

    $('.settings-email').click(function () {
        if ($(this).is(':checked')) {
            $(this).parent().parent().parent().find('.emailSelect').addClass('active-select');
        } else {
            $(this).parent().parent().parent().find('.emailSelect').removeClass('active-select');
        }
    });

    $('.new-message .glyphicon').removeClass('glyphicon-eye-open').addClass('glyphicon-eye-close').attr('data-original-title', 'Oznacz jako przeczytane');
    $('.inbox-page .actions button').click(function () {
        if ($(this).parent().parent().hasClass('new-message')) {
            $(this).parent().parent().removeClass('new-message');
            $(this).find('.glyphicon').removeClass('glyphicon-eye-close').addClass('glyphicon-eye-open').attr('data-original-title', 'Oznacz jako nieprzeczytane');
        } else {
            $(this).parent().parent().addClass('new-message');
            $(this).find('.glyphicon').removeClass('glyphicon-eye-open').addClass('glyphicon-eye-close').attr('data-original-title', 'Oznacz jako przeczytane');
        }
    });


    // ===== Scroll to Top ====
    // $(window).scroll(function() {
    //     if ($(this).scrollTop() >= 200) {        // If page is scrolled more than 50px
    //         $('#return-to-top').fadeIn(200);    // Fade in the arrow
    //     } else {
    //         $('#return-to-top').fadeOut(200);   // Else fade out the arrow
    //     }
    // });
    // $('#return-to-top').click(function() {      // When arrow is clicked
    //     $('body,html').animate({
    //         scrollTop : 0                       // Scroll to top of body
    //     }, 500);
    // });


});

$(function() { 

    var header = $(".navbar"); 
    $(window).scroll(function() {
        var scroll = $(window).scrollTop();
        if (scroll >= 300) {
          header.addClass("sm-header");
          $("body").addClass("sm-body");
        } else {
          header.removeClass("sm-header");
          $("body").removeClass("sm-body");
        }
    });
});

$(function () {

});


$(window).resize(function () {


});
