class LinkItem
  include Listable
  attr_reader :description, :site_name

  def initialize(url, options={})
    @description = url
    @site_name = options[:site_name]
  end
  def details
    "Type: Link".ljust(15) + format_description(@description) + "site name: " + format_name(@site_name)
  end
end
