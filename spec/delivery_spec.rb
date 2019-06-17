require './src/delivery'

describe "Delivery" do
  it "initialize delivery for a command" do
    delivery = Delivery.new("5x5 (1, 3) (4, 4), (0, 2)")
    expect(delivery.command).to eq("5x5 (1, 3) (4, 4), (0, 2)")
  end
end