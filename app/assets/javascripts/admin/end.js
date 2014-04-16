$(document).ready(function() {
  // Set redactor textareas
  $('textarea.redactor').redactor({
    linebreaks: true,
    buttons: ['html', '|', 'formatting', '|', 'bold', 'italic', 'underline', '|',
'unorderedlist', 'orderedlist', 'outdent', 'indent', '|', 'link']
  });

  // Set redactor-pictures textareas
  var csrf_token = $('meta[name=csrf-token]').attr('content'),
      csrf_param = $('meta[name=csrf-param]').attr('content'),
      post_slug = $('#post_form').data('slug'),
      params;

  if (csrf_param !== undefined && csrf_token !== undefined) {
    params = csrf_param + "=" + encodeURIComponent(csrf_token);
  }

  $('textarea.redactor_pictures').redactor({
    linebreaks: true,
    buttons: ['html', '|', 'formatting', '|', 'bold', 'italic', 'underline', '|',
'unorderedlist', 'orderedlist', 'outdent', 'indent', '|', 'image', 'link'],
    imageUpload: '/admin/posts/'+post_slug+'/post_pictures?' + params,
    imageGetJson: '/admin/posts/'+post_slug+'/post_pictures'
  });
});