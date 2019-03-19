# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $ ->
    $('.comments_block small').on 'click', 'btn.reply',->
      $parent = $(this).parents('.comments_block')
      $parent.children('.replies_form').toggleClass('d-none')