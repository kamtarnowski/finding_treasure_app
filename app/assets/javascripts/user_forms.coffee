# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#simpleform').validate
    rules: {
      'user_form[latitude]': { required: true, number: true },
      'user_form[longitude]': { required: true, number: true },
      'user_form[email]': { required: true, email: true },
    }