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
  $("#archive-button").text("Hide Archived");
};

function hide_archived_courses() {
  $("#archived-courses").remove();
  $("#archive-button").click(show_archived_courses);
  $("#archive-button").text("Show Archived");
};
