function minify_project(project_id)
{
  var project_body = $("#" + project_id + " .body");
  $(project_body).slideUp("normal");
  $(project_body).addClass("minified");
}

function minify_projects()
{
  $(".project").each(
    function(i)
    {
      minify_project($(this).attr("id"));
    }
  );
}

function expand_project(project_id)
{
  var project_body = $("#" + project_id + " .body");
  $(project_body).slideDown("normal");
  $(project_body).removeClass("minified");
}

function init_projects()
{
  $(".project").each(
    function()
    {
      $("#" + $(this).attr("id") + ".name").click(
        function()
        {
          if($(this).hasClass("minified")) {expand_project($(this).attr("id"));}
          else {minify_project($(this).attr("id"));}
        }
      );
    }
  );
  
  minify_projects();
}

$().ready( function() {init_projects();} );