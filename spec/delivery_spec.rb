require './src/delivery'
require './src/pizzabot'

describe "Delivery" do
  it "initialize delivery for a command" do
    delivery = Delivery.new("5x5 (1, 3), (4, 4), (0, 2)")
    expect(delivery.command).to eq("5x5 (1, 3), (4, 4), (0, 2)")
  end

  context "command for parsing grid" do
    it "succeed with grid in command" do
      delivery = Delivery.new("5x5 (1, 3) (4, 4) (0, 2)")
      grid = delivery.get_grid(delivery.command)
      expect(grid).to eq("5x5")
    end

    it "raises error without grid in command" do
      expect { Delivery.new("(1, 3) (4, 4), (0, 2)") }.to raise_error(ArgumentError)
    end
  end

  context "command for parsing points" do
    it "successfuly parses points" do
      delivery = Delivery.new("5x5 (1, 3), (4, 4), (0, 2)")
      points = delivery.get_drop_points(delivery.command)
      expect(points).to include("(4, 4)")
    end

    it "raises error without points in command" do
      expect { Delivery.new("5x5") }.to raise_error(ArgumentError)
    end
  end

  context "successfuly" do
    it "delivers to required points" do
      delivery = Delivery.new("5x5 (1, 3), (4, 4), (0, 2)")
      expect(delivery.run).to eq("WNNNDWWWNDEEEESSD")
    end

    it "delivers to require points skipping points out of bounds" do
      delivery = Delivery.new("5x5 (1, 3), (4, 4), (6, 4), (0, 2)")
      expect(delivery.run).to eq("WNNNDWWWNDEEEESSD")
    end
  end
end