class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map { |food_truck| food_truck.name }
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all { |food_truck| food_truck.check_stock(item) != 0 }
  end

  def sorted_item_list
    @food_trucks.flat_map { |food_truck|
      food_truck.inventory.keys  }.uniq.sort_by{|item| item.name}
  end

  def duplicate_item_list
    duplicates = {}
    @food_trucks.flat_map { |food_truck|
      food_truck.inventory.keys  }.each do |item|
        duplicates[item] = false if duplicates[item].nil?
        duplicates[item] = true if !duplicates[item].nil?
      end
      duplicates
  end

  def overstocked_items
    # item_hash = {}
    # sorted_item_list.each do |item|
    #   @food_trucks.each do |food_truck|
    #     item_hash[item] = food_truck.check_stock(item) if item_hash[item].nil?
    #     item_hash[item] += food_truck.check_stock(item) if !item_hash[item].nil?
    #   end
    # end
    # output = duplicate_item_list.flat_map do |dup_item, duplicate|
    #   item_hash.find_all do |item, quantity|
    #     dup_item == item && quantity > 50 && duplicate == true
    #   end[0]
    # end
    # output.flatten
    overstocked_list = []
    total_inventory.map do |item, attributes|
      if total_inventory[item][:food_trucks].length > 1 &&
        total_inventory[item][:quantity] > 50
          overstocked_list << item
      end
    end
    overstocked_list.flatten
  end

  def total_inventory
    inventory_hash = {}
    sorted_item_list.map do |item|
      inventory_hash[item] = {
        :food_trucks => food_trucks_that_sell(item),
        :quantity => food_trucks_that_sell(item).map {
          |food_truck| food_truck.check_stock(item) }.sum }
    end
    inventory_hash
  end

end
