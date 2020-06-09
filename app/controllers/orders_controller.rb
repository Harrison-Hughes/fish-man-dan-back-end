class OrdersController < ApplicationController

  before_action :require_login

  def placeOrder
    address = Address.find_by(id: address_id[:address_id])
    order = Order.new(status: 'pending confirmation', user: @current_user, address: address)
    order.items = JSON.parse(address_id[:item_ids]).map{ |id| Item.find_by(id: id)}
    if order.save
      render json: order
    else 
      render json: { error: "could not place order" }, status: :not_acceptable
    end

  end

  private

  def order_params
    params.require(:order).permit(:item_ids, :address_id)
  end
end
