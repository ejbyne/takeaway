require 'menu'

describe Menu do

let (:menu) { Menu.new }
let (:dish1) { double :dish }
let (:dish2) { double :dish }

  it "should allow dishes to be added" do
    menu.add(dish1)
    menu.add(dish2)
    expect(menu.dishes).to eq([dish1, dish2])
  end

  it "should allow dishes to be removed" do
    menu.add(dish1)
    menu.add(dish2)
    menu.remove(dish1)
    expect(menu.dishes).to eq([dish2])
  end

end