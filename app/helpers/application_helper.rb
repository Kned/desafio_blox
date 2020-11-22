module ApplicationHelper
  def flash_message
    messages = ""
    [:success, :danger].each {|type|
      if flash[type]
        messages += "<div class=\"alert alert-#{type}\" role=\"alert\">#{flash[type]}</div>"
      end
    }

    messages
  end
end