#---LEFT BAR ACCORDION----
$ ->
  $("#nav-accordion").dcAccordion
    eventType: "click"
    autoClose: true
    saveState: true
    disableLink: true
    speed: "slow"
    showCount: false
    autoExpand: true
    
    #        cookie: 'dcjq-accordion-1',
    classExpand: "dcjq-current-parent"
    # custom scrollbar
    $("#sidebar").niceScroll
      styler: "fb"
      cursorcolor: "#4ECDC4"
      cursorwidth: "3"
      cursorborderradius: "10px"
      background: "#404040"
      spacebarenabled: false
      cursorborder: ""

    $("html").niceScroll
      styler: "fb"
      cursorcolor: "#4ECDC4"
      cursorwidth: "6"
      cursorborderradius: "10px"
      background: "#404040"
      spacebarenabled: false
      cursorborder: ""
      zindex: "1000"
  
  responsiveView = ->
    wSize = $(window).width()
    if wSize <= 768
      $("#container").addClass "sidebar-close"
      $("#sidebar > ul").hide()
    if wSize > 768
      $("#container").removeClass "sidebar-close"
      $("#sidebar > ul").show()
  
  #    sidebar toggle
   
  $(window).on "load", responsiveView
  $(window).on "resize", responsiveView
  

  
  $(".fa-bars").click ->
    if $("#sidebar > ul").is(":visible") is true
      $("#main-content").css "margin-left": "0px"
      $("#sidebar").css "margin-left": "-210px"
      $("#sidebar > ul").hide()
      $("#container").addClass "sidebar-closed"
    else
      $("#main-content").css "margin-left": "210px"
      $("#sidebar > ul").show()
      $("#sidebar").css "margin-left": "0"
      $("#container").removeClass "sidebar-closed"
    

  
  

  
  # widget tools
  jQuery(".panel .tools .fa-chevron-down").click ->
    el = jQuery(this).parents(".panel").children(".panel-body")
    if jQuery(this).hasClass("fa-chevron-down")
      jQuery(this).removeClass("fa-chevron-down").addClass "fa-chevron-up"
      el.slideUp 200
    else
      jQuery(this).removeClass("fa-chevron-up").addClass "fa-chevron-down"
      el.slideDown 200
    

  jQuery(".panel .tools .fa-times").click ->
    jQuery(this).parents(".panel").parent().remove()
    

  
  #    tool tips
  $(".tooltips").tooltip()
  
  #    popovers
  $(".popovers").popover()
  
  # custom bar chart
  if $(".custom-bar-chart")
    $(".bar").each ->
      i = $(this).find(".value").html()
      $(this).find(".value").html ""
      $(this).find(".value").animate
        height: i
      , 2000
      

  