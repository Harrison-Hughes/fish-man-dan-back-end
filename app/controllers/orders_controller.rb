class OrdersController < ApplicationController

  before_action :require_login
  before_action :require_admin, only: [:index]

  def index
    render json: Order.all
  end

  def create
    address = Address.find_by(id: order_params[:address_id])
    request_objects = JSON.parse(order_params[:request_objects]) # request objects => [{item_id: ~, amount: ~, note: ~}, ...]
    order = Order.new(status: 'pending confirmation', user: @current_user, address: address)
    if order.save
      items
      # create requests
      if request_objects.map{ |r| Request.create(order: order, item: find_item_by_id(r[:id]), amount: r[:amount], note: r[:note])}
        render json: order
      else 
        render json: { error: "could not place order" }, status: :not_acceptable
      end
    else 
      render json: { error: "could not place order" }, status: :not_acceptable
    end
  end

  def update
    order = Order.find_by(id: params[:id])

    if order.save
      render json: order
    else 
      render json: { error: "could not update order" }, status: :not_acceptable
    end
  end

  def destroy
    order = Order.find_by(id: params[:id])
    if order.destroy
      render json: { success: "order destroyed"}
    else
      render json: { error: "could not destroy order" }, status: :not_acceptable
    end 
  end

  private

  def order_params
    params.require(:order).permit(:request_objects, :address_id)
  end

  def find_item_by_id(id)
    return Item.find_by(id: id)
  end
end
