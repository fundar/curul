// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery.tweet
//= require entiende


$(document).ready(function(){
  $('.carousel').carousel({
    direction: "vertical",
    dispItems: 30,
    loop: true,
    nextBtn: '<span class="button-down">&nbsp;</span>',
    prevBtn: '<span class="button-up">&nbsp;</span>'
  });
  
  $('#comment_comment').keyup(function(){
   $('#comment_comment').trimTxt(); 
  });
});