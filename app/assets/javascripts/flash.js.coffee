$ ->
  $("#flash").on "click", ".close", ->
    $(this).parent('.flash-message').remove()
