# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  renderCardInfo = (id) ->
    
    $.get "cards/" + id, (data) ->
      
      rendered_template = Mustache.render($('#card_info_template').html(), data)
      $('#card_info').html(rendered_template).show()
      alert data.ocr_info

  # renderCardInfo()
  
  $(".view_card").on "click", ->
    id = $(this).attr("data-id")
    renderCardInfo(id)