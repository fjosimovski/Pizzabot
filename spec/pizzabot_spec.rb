require './src/pizzabot'

describe "Pizzabot" do
  it "initialize pizzabot with grid size" do
    pizzabot = Pizzabot.new("5x5")
    expect(pizzabot.grid_size).to eq("5x5")
  end

  it "moves the pizzabot to position" do
    pizzabot = Pizzabot.new("5x5")
    path = pizzabot.move([0,0], [1,1])
    expect(path).to eq("WND")
  end
end