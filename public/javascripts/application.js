function show_archived_courses() {
  $.get('/course/archived', {}, function(data) {
          data = "<div id=\"archived-courses\">" +
            "<div class=\"pushdown\"></div>" +
            "<h1>Archived Courses</h1>" +
            data +
            "</div>";
          $("#center-box").append(data);
        });
  $("#archive-button").attr('onclick', '').click(hide_archived_courses);
};

function show_deactivated_users() {
  $.get('/admin/admin/user/deactivated', {}, function(data) {
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
$("#archived-courses").toggle();

};

function hide_deactivated_users() {
$("#deactivated-users").toggle();
};