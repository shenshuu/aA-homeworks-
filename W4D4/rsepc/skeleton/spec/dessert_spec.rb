require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) {Dessert.new("brownie", 10, chef)}

  describe "#initialize" do

    it "sets a type" do 
      expect(dessert.type).to eq("brownie")
    end

    it "sets a quantity" do 
      expect(dessert.amount).to eq(10)
    end

    it "starts ingredients as an empty array" do 
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do 
      expect{Dessert.new("brownie", "foo", chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do 
      dessert.add_ingredient("chocolate")
      expect(dessert.ingredients).to include("chocolate")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do 
      ingredients = ["chocolate", "egg", "flour", "sugar"]
      
      ingredients.each do |ingredient|
        dessert.ingredients << ingredient
      end

      expect(dessert.ingredients).to eq(ingredients)
      dessert.mix!
      expect(dessert.ingredients).not_to eq(ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do 
      dessert.eat(20)
      expect(dessert.amount).to eq(dessert.amount - 20)
    end

    it "raises an error if the amount is greater than the quantity" do 
      dessert.eat(1000000)
      expect{dessert.amount}.to raise_error("Not enough")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do 
      expect(dessert.serve).to include(chef.titleized)
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do 
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
