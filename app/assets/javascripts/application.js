// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).ready(function(){
  $(".main-container").on('click', ".topic-tab", function(e){
    e.preventDefault();
    var topicId = $(this).attr('id').replace(/topic/, "");
    var vacationId = window.location.href.replace(/.*vacations./, "")
    var url = "/vacations/"+ vacationId +"/topics/"+ topicId +""
    console.log(vacationId)
    var request = $.ajax({
      url: url,
      type: 'get',
      dataType: 'json'
    })

    request.done(function(response){
      $(".comments-container").empty();
      $(".comments-container").append(response["html"]);
    });
  }); // end of topic-tab handler
});
