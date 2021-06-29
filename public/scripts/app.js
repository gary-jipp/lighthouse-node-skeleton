// State: Current logged in user
let user = {};

// Document.ready - runs when page loads
$(() => {
  $('#show').on('click', onClick);
  $('#clear').on('click', onClear);
  $('#login').on('submit', onLogin);
  $('#logout').on('click', onLogout);
});

const onClear = function (event) {
  $("#list").empty();
};

const onClick = function (event) {
  // console.log('click');
  // res.json(stubData);

  $.get("/api/users")
    .then((res) => {
      // console.log(res);
      const container = $("#list");
      container.empty();
      for (user of res.users) {
        $("<li>").text(user.name).appendTo(container);
      }
    });
};

const onLogin = function (event) {
  event.preventDefault();
  form = $(this);
  const data = form.serialize();

  $.post("/api/users", data)
    .then(data => {
      console.log(data);
      user = data;
      showUser();
    });
};

const onLogout = function (event) {
  user.name = "";
  user.id = 0;
  showUser();
};

const showUser = function () {
  $("#name").html(user.name);
};