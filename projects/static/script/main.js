$(function() {
  // Expand and collapse the task list.
  $('.project .tasks').each(function() {
    var tasks = $(this);
    var completed = tasks.find('li.completed').length;
    var total = tasks.find('li').length;
    tasks.find('h1').click(function() {
      tasks.toggleClass('open');
    }).get(0).innerHTML += ' (' + completed + '/' + total + ')';
  });
});
