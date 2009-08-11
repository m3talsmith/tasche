module ToolboxHelper
  def render_toolbox(options = {}, &html_block)
    html  = "<div class='toolbox'"
    html += " id='#{options[:id]}'" if options[:id]
    html += ">"
    
    html += capture(&html_block)
    
    html += "</div>"
    
    return html
  end
end