require './src/pizzabot'

describe "Pizzabot" do
  it "initialize pizzabot with grid size" do
  	pizzabot = Pizzabot.new("5x5")
    expect(pizzabot.grid_size).to eq("5x5")
  end
end