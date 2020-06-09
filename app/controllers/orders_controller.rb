class OrdersController < ApplicationController

  def placeOrder
    user = User.find_by(id: project_params[:user_id])
    address = Address.find_by(id: address_id[:address_id])
    items = JSON.parse(address_id[:item_ids]).map{ |id| Item.find_by(id: id)}
    order = Order.new()
  end

  private

  def order_params
    params.require(:order).permit(:item_ids, :user_id, :address_id)
  end
end
