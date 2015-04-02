# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$( "#submit" ).click(function() {

  var product = $( "#product" ).val();
  var quantity = $( "#quantity" ).val() || [];
  var drop_off = $( "#drop_off").val();

  $( "body" ).append( "<li>" + product + " " + quantity + " " + drop_off + "</li>");
});
