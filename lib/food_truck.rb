class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def stock(item, quantity)
    if @inventory[item].nil?
      @inventory[item] = quantity
    else
      @inventory[item] += quantity
    end
  end

  def check_stock(item)
      if @inventory[item].nil?
       0
     else
      @inventory[item]
    end
  end

  def potential_revenue
    @inventory.map { |item, quantity| item.price * quantity }.sum
  end
end
