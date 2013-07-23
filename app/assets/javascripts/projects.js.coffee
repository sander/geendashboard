$(document).on 'DOMContentLoaded page:change', ->
  $('.project .tasks').each ->
    tasks = $ @
    completed = tasks.find('li.completed').length
    total = tasks.find('li').length
    tasks.find('h1').click(->
      tasks.toggleClass 'open'
    ).get(0).innerHTML += " (#{completed}/#{total})"
