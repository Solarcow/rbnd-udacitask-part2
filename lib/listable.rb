module Listable
  # Listable methods go here
  def format_description(description)
    "#{description}".ljust(25)
  end
  def format_name(site_name)
    site_name ? "#{site_name}" : ""
  end
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
  def format_date(options={})
  	@due = options[:due_date]
  	@start_date = options[:start_date]
  	@end_date = options[:end_date]

  	if @due != nil
	    @due ? @due.strftime("%D") : "No due date"
	else
	    dates = @start_date.strftime("%D") if @start_date
	    dates << " -- " + @end_date.strftime("%D") if @end_date
	    dates = "N/A" if !dates
	    return dates
	end
  end
  def format_type(type)
  	"Type: #{type}".ljust(15)
  end
end
