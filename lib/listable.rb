module Listable
  # Listable methods go here
  def format_description(description)
    "#{description}".ljust(30)
  end
  def format_name(site_name)
    site_name ? "#{site_name}" : ""
  end
  # def format_priority(priority)
  #   value = " ⇧".colorize(:red) if priority == "high"
  #   value = " ⇨".colorize(:yellow) if priority == "medium"
  #   value = " ⇩".colorize(:green) if priority == "low"
  #   value = "" if !priority
  #   return value
  # end
 def format_priority(priority)
  	if priority == "high"
	    value = " ⇧".colorize(:red)
	    return value
	elsif priority == "medium"
	    value = " ⇨".colorize(:yellow)
	    return value
	elsif priority == "low"
	    value = " ⇩".colorize(:green)
	    return value
	elsif !priority
		value = ""
		return value
	else
	    raise UdaciListErrors::InvalidPriorityValue, "#{priority} is not a valid priority"
	end
 end
end
