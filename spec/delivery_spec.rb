require './src/delivery'

describe "Delivery" do
  it "initialize delivery for a command" do
    delivery = Delivery.new("5x5 (1, 3) (4, 4), (0, 2)")
    expect(delivery.command).to eq("5x5 (1, 3) (4, 4), (0, 2)")
  end

  context "command for parsing grid" do
    it "succeed with grid in command" do
      delivery = Delivery.new("5x5 (1, 3) (4, 4), (0, 2)")
      grid = delivery.get_grid(delivery.command)
      expect(grid).to eq("5x5")
    end

    it "raises error without grid in command" do
      expect { Delivery.new("(1, 3) (4, 4), (0, 2)") }.to raise_error(ArgumentError)
    end
  end

end