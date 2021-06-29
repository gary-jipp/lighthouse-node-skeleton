$(() => {
  $.ajax({
    method: "GET",
    url: "/api/users"
  }).done((users) => {
    for(user of users) {    // This assumes data is an array.  - broken!
      $("<div>").text(user.name).appendTo($("body"));
    }
  });;
});
