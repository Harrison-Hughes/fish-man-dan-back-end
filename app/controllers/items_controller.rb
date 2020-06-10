class ItemsController < ApplicationController

  before_action :require_admin

  def create 
    item = Item.new(itemParams)
    if item.save
      render json: item
    else 
      render json: { error: "item could not be created" }, status: :not_acceptable
    end
  end

  private

  def itemParams
    params.require(:item).permit(:name, :description, :valid_until)
  end

end
