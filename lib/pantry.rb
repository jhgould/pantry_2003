require './lib/recipe'

class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, amount)
    @stock[ingredient] += amount
  end

  def  enough_ingredients_for?(recipe)
    recipe.ingredients_required.each do |item, amount|
      if @stock.keys.include?(item) && @stock[item] >= amount
        return true
      else
        return false
      end
    end
  end

end
  #   recipe.ingredients_required.each do |item, amount|
  #     binding.pry
  #     if @stock.keys.include?(item) && @stock[item] >= amount
  #       return true
  #     else
  #       return false
  #     end
  #   end
  # end


    # recipe.ingredients_required.each do |ingredient, amount|
    #   @stock.each do |stock_ingredient, stock_amount|
    #     binding.pry
    #     if ingredient == stock_ingredient && amount <= stock_amount
    #       return true
    #     else
    #       return false
    #     end
    #   end
    # end
