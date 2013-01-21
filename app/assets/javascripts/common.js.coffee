$ ->
  a=$('.alert').text("B")
  n=$('.notice').text("D")

  a.hide()
  n.hide()

  if a.text() 
    n.css('top',a.height()+4)
    a.slideDown()
    setTimeout =>
      a.slideUp()
    ,5000
  if n.text() 
    n.slideDown()
    setTimeout =>
      n.slideUp()
    ,5000
    
