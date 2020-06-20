class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_food_item
  before_action :find_like, only: [:destroy]
  
  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @food_item.likes.create(user_id: current_user.id)
    end
    redirect_to food_items_path
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to food_items_path
  end

  def find_like
    @like = @food_item.likes.find(params[:id])
  end

  private
  def find_food_item
    @food_item = FoodItem.find(params[:food_item_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, food_item_id: params[:food_item_id]).exists?
  end
end
