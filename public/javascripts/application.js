function show_archived_courses() {
  // Get new data and add it to the bottom of the page
  $.get('/course/archived', {}, function(data) {
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


function hide_archived_courses() {
  // Remove archived course listing.
  $("#archived-courses").remove();

  // Change button text and bind it to new function
  $("#archive-button").click(show_archived_courses);
  $("#archive-button").text("Show Archived");
};
