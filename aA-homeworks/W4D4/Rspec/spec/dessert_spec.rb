require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  let(:dessert) {Dessert.new("dessert",10, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("dessert")
    end

    it "sets a quantity" do 
      expect(dessert.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new("d","a",chef)}.to raise_error
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      
      dessert.add_ingredient("ingredient")
      expect(dessert.ingredients).to include("ingredient")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.add_ingredient("i1")
      dessert.add_ingredient("i2")
      dessert.add_ingredient("i3")
      dessert.add_ingredient("i4")
      dessert.add_ingredient("i5")
      dessert.mix!
      expect(dessert.ingredients).not_to eq(["i1","i2","i3","i4","i5"])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(10)
      expect(dessert.quantity).to eq(0)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(12)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Title")
      expect(dessert.serve).to eq("Title has made 10 desserts!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
