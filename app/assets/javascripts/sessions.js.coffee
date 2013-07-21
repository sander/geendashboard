$ ->
  $('#persona_form').submit ->
    input = $('input[name=assertion]')
    unless input.val()
      navigator.id.get (assertion) =>
        if assertion
          input.val assertion
          @submit()
        else
          location = "#{failure_path}"
      false
