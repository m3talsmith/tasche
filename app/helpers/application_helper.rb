# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  # -- Truncate was failing in version 2.1.0 so we hacked this out
  def truncate(text, *args)
    options = args.extract_options!
    unless args.empty?
      ActiveSupport::Deprecation.warn('truncate takes an option hash instead of separate ' +
        'length and omission arguments', caller) 
      
      options[:length]      = args[:length]     || 30
      options[:omission]    = args[:omission]   || "..."
      options[:word_count]  = args[:word_count] || false
    end
    
    options.reverse_merge!(:length => 30, :omission => "...", :word_count => false)
  
    if text
      final_text = text.to_s
      
      unless options[:word_count]
        l = options[:length] - options[:omission].length
        chars = text
        final_text = (chars.length > options[:length] ? chars[0...l] + options[:omission] : text).to_s
      else
        l = options[:length] - options[:omission].split(" ").length
        words = text.split(" ")
        final_text = (text.split(" ").length > options[:length] ? words[0..l].join(" ") + options[:omission] : text).to_s
      end
      return final_text
    end
  end
  # --
end
