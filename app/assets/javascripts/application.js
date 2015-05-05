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

function readyFn( jQuery ) {

    //if( $(window).scrollTop() === 0)  {
        var nav_height = $('#main-nav .navbar').innerHeight(); //Gets the height of header for processing
        $('.push-down-content').css("height", nav_height);

        console.log(nav_height);
         //dynamically gets the padding height, the -6 was a helper px to make it exact
        //$('body .push-down-content').add({"height": nav_height+"px !important;"});
        $(window).scroll(function () {
            $('.push-down-content').css("height", nav_height);
        });
    //}
}

//Click functions don't need to be initiated if window is resized, or else flickering will occur
$( document ).ready(function() {

    $( window ).scroll(function() {
        //Set at 30 so animation can look smoother
        if( ($(window).scrollTop() > 30) ){
            $('.menu .menu-icons').fadeOut("fast");
            if ($('#main-body').length <= 0){
                $('#main-nav .navbar').addClass('addbottom10',1000, "easeOutBounce"); //Adds a little extra space in the bottom
                //$('.push-down-content').css("padding-top",nav_height-6);
                //console.log('add bottom 10');
            }
        }   else {
            $('.menu .menu-icons').fadeIn("fast");
            //$('#main-nav .navbar').removeClass('addbottom10'); //Gets rid of it if the user scrolled down
            $('#main-nav .navbar').removeClass('addbottom10',1000, "easeOutBounce");
        }

        /* Every time the window is scrolled fadeIn Effect... */
        /* Check the location of each desired element */
        $('.fadeInBlock').each( function(e){

            var bottom_of_object = $(this).offset().top + $(this).outerHeight();
            var bottom_of_window = $(window).scrollTop() + $(window).height();

            /* If the object is completely visible in the window, fade it it */
            if( bottom_of_window > bottom_of_object ){

                $(this).animate({'opacity':'1'},"fast");

            }

        });

    });

    /*$("#hide").click(function(){
        $(".target").hide( "scale", {percent: 200, direction: 'horizontal'}, 2000 );
    });

    $("#show").click(function(){
        $(".target").show( "scale", {percent: 200, direction: 'vertical' }, 2000 );
    });*/

});