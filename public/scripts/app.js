$(() => {

  $('#show').on('click', onClick);
  $('#clear').on('click', onClear);

});

const onClear = function (event) {
  console.log('clear');
  $("#list").empty();
};

const onClick = function (event) {
  // console.log('click');

  // res.json(stubData);

  $.ajax({
    method: "GET",
    url: "/api/users"
  })
    .then((res) => {
      // console.log(res);
      const container = $("#list");
      container.empty();
      for (user of res.users) {
        $("<li>").text(user.name).appendTo(container);
      }
    });
};
