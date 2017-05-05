$(document).ready(function() {
  $("#rhyme-word-form").on("submit", function(event) {
    event.preventDefault();

    var url = $(this).attr("action");
    var method = $(this).attr("method");
    var data =$(this).serialize();

    $.ajax({
      url: url,
      data: data,
      method: method
    })
    .done(function(response) {
      $(".rhymes-go-here").html(response);
      $(this).trigger("reset");
    }.bind(this))

  })
})
