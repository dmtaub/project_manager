# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->

  $.datepicker.setDefaults
    showOn: 'both'
    buttonImageOnly: true
    buttonImage: 'images/calendar.gif'
    buttonText: 'Calendar'
  
  $('.best_in_place').best_in_place().bind "ajax:success", () ->
    alert('Name updated for '+$(this).data('userName'))

  $('.user-link').click (e)->
    $('.user-link').removeClass('active')
    $(e.target).closest('li').addClass('active')
    e.stopPropagation()

  $('.team').click (e)->
    routie('usr-all')

  $('.add-new').click (e)->
    alert "ADD!"
    #$.dialog($('div'))

route_all = () ->
  $('.user-link').removeClass('active')
  data=$("tbody.data")
  data.find("tr").show()
  data.sortable('disable') if data.hasClass('ui-sortable')

routie "usr:id", (id)->
  if id == '-all'
    route_all()
    return
  data=$("tbody.data")
  data.find("tr").hide()
  data.find("tr.#{id}").show()
  if data.hasClass('ui-sortable')
    data.sortable('enable')
  else
    # set element to sortable if it hasn't been done
    setTimeout ()->
      data=$("tbody.data")
      data.sortable()
    ,300
