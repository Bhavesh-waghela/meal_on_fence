class HomeController < ApplicationController
  def index
  	@top_items = FoodItem.joins("LEFT OUTER JOIN Likes ON likes.food_item_id = food_items.id").group("food_items.id").order("COUNT(likes.id) DESC").limit(3)
  end
end
