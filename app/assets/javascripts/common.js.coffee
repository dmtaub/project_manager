window.isNumeric = (n) ->
    return !isNaN(parseFloat(n)) && isFinite(n)
window.flash = (msg, alsoAlert = false, title="Alert!")->
  if alsoAlert
    alert(msg)
  console.log(msg)

$ ->
  a=$('.alert')
  n=$('.notice')
  fc = $('.flash-container')

  fc.hide()

  if a.text()
    show = true
  else
    a.hide()

  if n.text()
    show = true
  else 
    n.hide()
  
  if !!show
    fc.slideDown()
    setTimeout =>
      fc.slideUp()
    ,5000
    
