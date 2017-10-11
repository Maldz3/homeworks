require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:cupcake) { Dessert.new('cupcake', 12, chef)}
  let(:chef) { double("chef", name: 'Maliha') }

  describe "#initialize" do
    it "sets a type" do
      expect(cupcake.type).to eq('cupcake')
    end

    it "sets a quantity" do
      expect(cupcake.quantity).to eq(12)
    end

    it "starts ingredients as an empty array" do
      expect(cupcake.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new('cupcake', 'heaps', 'maliha') }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(cupcake.ingredients).to_not include('vanilla')
      cupcake.add_ingredient('vanilla')
      expect(cupcake.ingredients).to include('vanilla')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ings_arr = ['flour', 'sugar', 'butter', 'eggs', 'vanilla']
      ings_arr.each { |ing| cupcake.add_ingredient(ing) }
      expect(cupcake.ingredients).to eq(ings_arr)
      cupcake.mix!
      expect(cupcake.ingredients).not_to eq(ings_arr)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cupcake.eat(3)
      expect(cupcake.quantity).to eq(9)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {cupcake.eat(15)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return('Chef Maliha the Great Baker')
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cupcake)
      cupcake.make_more
    end
  end
end
