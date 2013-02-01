# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->

  $.datepicker.setDefaults
    showOn: 'focus'
    dateFormat: "yy-mm-dd"
  $('.best_in_place').best_in_place()

  $('.user-link').click (e)->
  #  $('.user-link').removeClass('active')
  #  $(e.target).closest('li').addClass('active')
    e.stopPropagation()

  $('.team').click (e)->
    routie('usr-all')

  $('.right a').on 'ajax:success', (e)->
    $(e.target).closest('tr').remove()

  $('.add-new').click (e)->
    id = $(e.target).data("user")
    if !id 
      alert("no team member selected")
      return
    $.ajax 
      url:"projects.json"
      type: "POST"
      dataFormat: "json"
      data: 
        project:
          user_id: id
      success: (a)->
        if a.html
          newRow = $(a.html)
          newRow.find('.best_in_place').best_in_place()

          newRow.find('a').on 'ajax:success', (e)->
            $(e.target).closest('tr').remove()
          $('.data').append(newRow)
  data=$('tbody.data')
  data.sortable()
    #$.dialog($('div'))

route_all = () ->
  $('.user-link').removeClass('active')
  data=$("tbody.data")
  data.find("tr").show()
  data.sortable('disable') if data.hasClass('ui-sortable')
  $('.add-new').data("user",null)

routie "usr:id", (id)->
  if id == '-all'
    $ ->
      route_all()
    return
  $ ->
    $('.user-link').removeClass('active')
    $("#ul-#{id}").addClass('active')
    data=$("tbody.data")
    data.find("tr").hide()
    data.find("tr.#{id}").show()
    $('.add-new').data("user",id)
    if data.hasClass('ui-sortable')
      data.sortable('enable')
  #  else
  #    # set element to sortable if it hasn't been done
#    setTimeout ()->
#      data=$("tbody.data")
#    ,300
