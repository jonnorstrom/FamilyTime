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
function submitEditedComment(clicked){
  var $edit = clicked;
  var $commentContainer = $edit.closest('.comment-container');
  var url = $commentContainer.find('form').attr('action')
  var data = $commentContainer.find('form').serialize()
  var request = $.ajax({
    url: url,
    type: 'PUT',
    dataType: 'json',
    data: data
  })

  request.done(function(response){
    $commentContainer.empty();
    $commentContainer.append(response['html']);
  })
}

function editCommentForm(clicked){
  var $edit = clicked;
  var $commentContainer = $edit.closest('.comment-container');
  var content = $commentContainer.find('.p-content').text();
  var commentId = $commentContainer.find('.p-content').attr('id').replace(/comment/, "");
  var topicId = $(".topic-tabs").find('.active').attr('id').replace(/topic/, "");
  var vacationId = $('ul.topic-tabs').attr('id').replace(/vacation/, "");
  var url = "/vacations/"+vacationId+"/topics/"+topicId+"/comments/"+commentId+"/edit";
  var request = $.ajax({
    url: url,
    type: 'get',
    dataType: 'json'
  })

  request.done(function(response){
    $commentContainer.empty();
    $commentContainer.append(response['html']);
  })
}


function removeActive(){
  $(".topic-tabs").find(".topic-tab").removeClass("active")
}

function mealSignUp(clicked){
  var $thumbnail = clicked;
  var $form = $thumbnail.find('form');
  var url = $form.attr('action');
  var data = $form.serialize();
  var method = $form.attr('method')

  var request = $.ajax({
    url: url,
    type: method,
    data: data
  })

  request.done(function(response){
    $form.remove();
    $thumbnail.append(response['html']);
  });
}

function addGuestAttraction(clicked){
  var $button = clicked;
  var $parentDiv = $button.parent()
  var $form = $button.find('form');
  var url = $form.attr('action');
  var data = $form.serialize();
  var method = $form.attr('method')

  var request = $.ajax({
    url: url,
    type: method,
    data: data
  })

  request.done(function(response){
    $parentDiv.find('.inner-list').append(response['html']);
    $parentDiv.find('form')[0].reset()
    $parentDiv.find('.guest-attraction-form').addClass('hidden')
    $parentDiv.children().last().removeClass('hidden')
  })
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

function closeForm($form) {
  var $container = $form.parent().parent()
  var data = $form.serialize();
  var url = $form.attr('action');

  var request = $.ajax({
    url: url,
    type: 'put',
    data: data
  })

  request.done(function(response) {
    // updated: true
    if (response.updated === true) {
      $form.parent().prev().remove()
      $form.remove();
      $container.append('<p class="form-close-notice">This forum has been successfully closed!</p>')
    }
  })
}

$(document).ready(function(){
  setTimeout(getTopic, 200);

  $(".right-side").on('click', ".topic-tab", function(e){
    e.preventDefault();
    var topicId = $(this).attr('id').replace(/topic/, "");

    removeActive();
    $(this).addClass("active");
    getComments(topicId);
  }); // end of topic-tab handler

  $(".meal-item").on('submit', function(e){
    e.preventDefault();
    mealSignUp($(this));
  });

  $('.guest-attractions-container').on('click', '.guest-attraction-button', function(){
    $(this).addClass('hidden')
    $(this).parent().find('.guest-attraction-form').removeClass('hidden')
  })

  $('.guest-attraction-form').on('submit', function(e){
    e.preventDefault();
    addGuestAttraction($(this));
  })

  $('.all-comments-container').on('click', '.edit-comment', function(e){
    e.preventDefault();
    editCommentForm($(this));
  })

  $('.all-comments-container').on('submit', '.edit-comment-form', function(e){
    e.preventDefault()
    submitEditedComment($(this));
  })

  $('.all-comments-container').on('submit', '.edit_topic', function(e){
    e.preventDefault();
    closeForm($(this));
  })
});
