$(() => {
  
  console.log("document ready!");

  $.ajax({
    method: "GET",
    url: "/api/users"
  }).done((users) => {    // Note the bug here!  Res is not an array
    for(user of users) {
      $("<div>").text(user.name).appendTo($("body"));
    }
  });;
});
