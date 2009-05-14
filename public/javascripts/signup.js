function collapse_signup_header(id)
{
  $("#" + id + " .content").slideUp();
  $("#" + id).addClass("collapsed");
}

function expand_signup_header(id)
{
  $(".signup .info").each(function(i){
    collapse_signup_header($(this).attr("id"));
  });
  $("#" + id + " .content").slideDown();
  $("#" + id).removeClass("collapsed");
}

function toggle_signup_header(id)
{
  if($("#" + id).hasClass("collapsed"))
  {
    expand_signup_header(id);
  }
  else { collapse_signup_header(id); }
}

function init_signup_headers()
{
  $(".signup .info").each(function(i){
    $(this).attr({id: "signup_header_" + i});
    $(this).click(function(){
      toggle_signup_header($(this).attr("id"));
    });
    collapse_signup_header($(this).attr("id"));
  });
}