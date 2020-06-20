class FoodItemsController < InheritedResources::Base

  def index
    @food_items = FoodItem.all
  end

  private
  def food_item_params
    params.require(:food_item).permit(:title, :food_type, :description)
  end

end
