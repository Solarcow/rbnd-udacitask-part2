class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title] || "Untitled List"
    @items = []
  end
  def add(type, description, options={})
    type = type.downcase
    if type == "todo"
      @items.push TodoItem.new(description, options)
    elsif type == "event"
      @items.push EventItem.new(description, options)
    elsif type == "link"
      @items.push LinkItem.new(description, options)
    else
      raise UdaciListErrors::InvalidItemType, "#{type} is not a valid item type"
    end
  end
  def delete(index)
    if index > @items.length
      raise UdaciListErrors::IndexExceedsListSize, "item #{index} does not exist"
    else
      @items.delete_at(index - 1)
    end
  end
  def all
    ascii = Artii::Base.new :font => 'big'
    puts "-" * @title.length
    puts ascii.asciify(@title)
    puts "-" * @title.length
    @items.each_with_index do |item, position|
      Formatador.display_line('[blue]' "#{position + 1}) #{item.details}")
    end
  end
  def filter(type)
    @items.each do |item| 
      if item.type == type
        puts "#{item.details}"
      end
    end
  end
  def delete_type(type)
    @items.delete_if {|item| item.type == type}
  end
end
