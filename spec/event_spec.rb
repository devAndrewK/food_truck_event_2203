require './lib/event'
require './lib/item'
require './lib/food_truck'
RSpec.describe Event do
  before :each do
    @event = Event.new("South Pearl Street Farmers Market")
    @item1 = Event.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Event.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
  end

  it 'exists' do
    expect(@event).to be_an(Event)
  end

  it 'has attributes' do
    expect(@event.name).to eq("South Pearl Street Farmers Market")
    expect(@event.food_trucks).to eq([])
  end

end
