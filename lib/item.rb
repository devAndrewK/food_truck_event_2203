class Item
attr_reader :name, :price

def initialize(attributes)
  @name = attributes[:name]
  #require 'pry';binding.pry
  @price = attributes[:price].delete("$").to_f
end

end
