function show_archived_courses() {
  // Get new data and add it to the bottom of the page
  $.get('/admin/course/archived', {}, function(data) {
          data = "<div id=\"archived-courses\">" +
            "<div class=\"pushdown\"></div>" +
            "<h1>Archived Courses</h1>" +
            data +
            "</div>";
          $("#center-box").append(data);
        });
  // Change button text and bind it to new function
  $("#archive-button").attr('onclick', '').click(hide_archived_courses);
  $("#archive-button").text("Hide Archived");
};

function show_deactivated_users() {
  $.get('/admin/user/deactivated', {}, function(data) {
          data = "<div id=\"deactivated-users\">" +
            "<div class=\"pushdown\"></div>" +
            "<h1>Deactivated Users</h1>" +
            data +
            "</div>";
          $("#center-box").append(data);
        });
  $("#reactivate-button").attr('onclick', '').click(hide_deactivated_users);
  $("#reactivate-button").text("Hide Deactivated");
};


function hide_archived_courses() {
  // Remove archived course listing.
  $("#archived-courses").toggle();
  // Change button text and bind it to new function
 var text = $("#archive-button").text() === "Show Archived" ? "Hide Archived" : "Show Archived";
  $("#archive-button").text(text);
};

function hide_deactivated_users() {
  $("#deactivated-users").toggle();
  //$("#reactivate-button").click(show_deactivated_users);
  var text = $("#reactivate-button").text() === "Show Deactivated" ? "Hide Deactivated" : "Show Deactivated";
  $("#reactivate-button").text(text);
};
