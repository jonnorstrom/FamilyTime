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
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require_tree .
function removeActive(){
  $(".topic-tabs").find(".topic-tab").removeClass("active")
}

function getComments(topicId){
  var vacationId = window.location.href.replace(/.*vacations./, "")
  var url = "/vacations/"+ vacationId +"/topics/"+ topicId +""
  var request = $.ajax({
    url: url,
    type: 'get',
    dataType: 'json'
  })

  request.done(function(response){
    $(".all-comments-container").empty();
    $(".all-comments-container").append(response["html"]);
  });
  // take the prvious ajax request and put here
}

function getTopic(){
  var vacationId = window.location.href.replace(/.*vacations./, "")
  var request = $.ajax({
    url: "/vacations/"+ vacationId +"",
    type: 'get',
    dataType: 'json'
  });

  request.done(function(response){
    $("#topic"+response.topic_id).addClass("active")
    getComments(response.topic_id)
  });
}

$(document).ready(function(){
  setTimeout(getTopic, 500);

  $(".right-side").on('click', ".topic-tab", function(e){
    e.preventDefault();
    var topicId = $(this).attr('id').replace(/topic/, "");

    removeActive();
    $(this).addClass("active");
    getComments(topicId);
  }); // end of topic-tab handler
});
