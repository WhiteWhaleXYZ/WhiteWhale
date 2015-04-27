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

}

//Click functions don't need to be initiated if window is resized, or else flickering will occur
$( document ).ready(function() {

    $( window ).scroll(function() {
        if( ($(window).scrollTop() != 0) ){
            $('.menu .menu-icons').hide();
        }   else {
            $('.menu .menu-icons').show();
        }
    });


    /* Every time the window is scrolled fadeIn Effect... */
    $(window).scroll( function(){

        /* Check the location of each desired element */
        $('.fadeInBlock').each( function(i){

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