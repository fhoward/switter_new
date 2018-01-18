# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  content = $('#swit_content')
  counter = $('#counter')
  max_length = counter.data('maximum-length')
  counter.text max_length - (content.val().length)
  content.keyup ->
    counter.text max_length - ($(this).val().length)
    return
  return