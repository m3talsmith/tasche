function minify_project(project_id)
{
  var project_body = $("#" + project_id + " .body");
  $(project_body).slideUp("normal");
  $(project_body).addClass("minified");
}

function minify_projects()
{
  $(".project").each( function(i) {
      minify_project($(this).attr("id"));
  });
}

function expand_project(project_id)
{
  var project_body = $("#" + project_id + " .body");
  $(project_body).slideDown("normal");
  $(project_body).removeClass("minified");
}

function minify_class(ui, klass) {
  $("." + ui).click( function() {
    var parent_id = $(this).parent().attr("id");
    if($("#" + parent_id).find("." + klass).hasClass("minified")) { expand_project(parent_id); }
    else { minify_project(parent_id); }
  });
}

function make_projects_minifiable()
{
  minify_class("header", "body");
  minify_class("user_header", "users");
}

function init_projects()
{
  make_projects_minifiable();
  minify_projects();
}

$().ready( function() {init_projects(); init_signup_headers();} );