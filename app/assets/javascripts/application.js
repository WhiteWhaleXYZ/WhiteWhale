// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .
/***JS & JQUERY***/

//General functions are executed on ready or window resize
$( document ).ready( readyFn );
// OR
$( window ).resize( readyFn );

//Functions that need to be re-initiated if window is resized
function readyFn( jQuery ) {

    var nav_height = $('#main-nav .navbar').innerHeight(); //Gets the height of header for processing how much to push down the page
    var widthofscreen = $(window).width(); //Gets the side of the current window screen

    $('.push-down-content').css("height", nav_height); //pushes down the content by the calculated height

    //If user scrolls it should also redo the calculation, and push down the content by that amount
    $(window).scroll(function () {
        //If it's not a mobile device and there's a visible carousel, (which also means it's the homepage) then it shouldn't pushdown the body, which is done by setting the pushdown height to 0
        if ((widthofscreen > 767) && $("#myCarousel").length) {
            $('.push-down-content').css("height", "0px");
        }
        //if it is a mobile device then we should push down the body by that calculated height
        else {
            $('.push-down-content').css("height", nav_height);
        }
    });


    //If it's not a mobile device and there's a visible carousel, which also means it's the homepage then it shouldn't pushdown the body, which is by setting the pushdown height to 0
    if ((widthofscreen > 767) && $("#myCarousel").length) {
        $('.push-down-content').css("height", "0px");
    }

    //To enhance User Experience and give users more room, for mobile we make navbar static only for mobile devices
    if (widthofscreen < 499) {
        $('.navbar-static-top').removeClass('navbar-fixed-top');
    }
    //If it's not mobile we add it back
    else {
        $('.navbar-static-top').addClass('navbar-fixed-top');
    }

}

//Functions that don't need to be re-initiated if window is resized, or else flickering will occur
$( document ).ready(function() {

    $( window ).scroll(function() {
        /*
        =====Enhance UX by hiding or displaying MENU ICONS, based on user's scrolling position=====
        */
        //Set at 30 so animation can look smoother, meaning if the scroll is more than 30 pixels from the top of the page
        if( ($(window).scrollTop() > 30) ){
            $('.menu .menu-icons').fadeOut("fast"); //Fadeout the menu icons
            if ($('#main-body').length <= 0){
                $('#main-nav .navbar').addClass('addbottom10',1000, "easeOutBounce"); //Adds a little extra space in the bottom for spacing the header and body
            }
        }
        //If the user is currently at 30 or less pixels away, then we fadeIn the menu icons once again
        else {
            $('.menu .menu-icons').fadeIn("fast");
            //$('#main-nav .navbar').removeClass('addbottom10'); //Gets rid of it if the user scrolled down
            $('#main-nav .navbar').removeClass('addbottom10',1000, "easeOutBounce");
        }

        /*
        ======Function to display "back to top" button=======
        */
        var heightOfScreen = $('body').height(); //Size of the screen
        var currentScrollPosition = $(window).scrollTop() //Current Scroll position

        //If the user scrolled 1/3rd of the way then it's visible
        if ( (heightOfScreen / 1.5) > (heightOfScreen - currentScrollPosition) ){
            $(".back-to-top").fadeIn("slow");
        }
        else{
            $(".back-to-top").fadeOut("slow");
        }

    });

    //Scroll Back to Top, automatic animated scrolling Function
    $(".back-to-top").click(function(e) {
        e.preventDefault();
        $('html,body').animate({scrollTop:0},'slow');
        return false;
    });


});