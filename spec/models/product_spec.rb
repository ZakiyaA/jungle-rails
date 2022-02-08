require 'rails_helper'

#   validates :name, presence: true
#   validates :price, presence: true
#   validates :quantity, presence: true
#   validates :category, presence: true


RSpec.describe Product, type: :model do
  # describe 'Validations' do
  #   # validation tests/examples here
  #   it "is valid" do
  #     @product = Product.new
  #     @cat = Category.new
  #     @cat.name = 'Test'
  #     @product.name = 'Test' # invalid state
  #     @product.price_cents = 12311
  #     @product.quantity = 3
  #     @product.category = @cat
  #     expect(@product.valid?).to be true
  #   end
  #   it "name presence" do
  #     @product = Product.new
  #     @product.name = nil
  #     @product.valid?
  #     expect(@product.valid?).to be false
  #     expect(@product.errors.messages[:name]).to include "can't be blank"
  #   end
  # end
  describe "Validations" do
    it "is valid " do
      @category = Category.create(name: "Apparel")
      # @product = Product.create(name: "dress", price_cents: 2345, quantity: 4, category: "Apparel")
      @product = Product.new
      @category = Category.new
      # @category.name = "Apparel"
      @product.name = 'Test' # invalid state
      @product.price_cents = 12311
      @product.quantity = 5
      @product.category = @category
      @product.save
      expect(@product).to be_valid
    end

    it "name presence" do
      @product = Product.new
      # @category.name = "Apparel"
      @product.price_cents = 12311
      @product.quantity = 5
      @product.category = @category

      @product.name = nil
      @product.save
      expect(@product).to_not be_valid

      
      expect(@product.errors.full_message(:name, "cannot be blank"))
    end

    it "price_cents presence" do
      @product = Product.new
      # @category.name = "Apparel"
      @product.name = 'Test' # invalid state
      @product.quantity = 5
      @product.category = @category

      @product.price_cents = nil
      @product.save
      expect(@product).to_not be_valid
      expect(@product.errors.full_message(:price_cents, "cannot be blank"))
    end

    it "quantity presence" do
      @product = Product.new
      # @category.name = "Apparel"
      @product.name = 'Test' # invalid state
      @product.price_cents = 12311
      @product.category = @category

      @product.quantity = nil
      @product.save
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:quantity]).to include "can't be blank"

      @product.quantity = 5 # valid state
      @product.valid? 
      expect(@product.errors[:quantity]).not_to  include("can't be blank")
    end


    it "category presence" do
      @product = Product.new
      @category = Category.new
      # @category.name = "Apparel"
      @product.name = 'Test' # invalid state
      @product.price_cents = 12311
      @product.quantity = 5
      
      @product.category = nil
      @product.save
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:category]).to include "can't be blank"

      @product.category = @category # valid state
      @product.valid? 
      expect(@product.errors[:category]).not_to  include("can't be blank")
    end
  end
    



end
