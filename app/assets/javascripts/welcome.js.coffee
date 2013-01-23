# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.best_in_place').best_in_place().bind "ajax:success", () ->
    alert('Name updated for '+$(this).data('userName'))

  $('.user-link').click (e)->
    $('.user-link').removeClass('active')
    $(e.target).addClass('active')

  $('.add-new').click (e)->
    alert "ADD!"
    #$.dialog($('div'))

routie "usr:id", (id)->
  data=$("tbody.data")
  data.find("tr").hide()
  data.find("tr.#{id}").show()
