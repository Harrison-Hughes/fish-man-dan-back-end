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
      if !Request.make_requests(order, request_objects).any? { |r| r.nil? }
        render json: order
      else 
        order.destroy
        render json: { error: "could not make requests" }, status: :not_acceptable
      end
    else 
      render json: { error: "could not place order" }, status: :not_acceptable
    end
  end

  def update

    address = Address.find_by(id: order_params[:address_id])
    request_objects = JSON.parse(order_params[:request_objects]) # request objects => [{item_id: ~, amount: ~, note: ~}, ...]

    order = Order.find_by(id: params[:id])
    originalStatus, originalUser, originalAddress = order.status, order.user, order.address
    order.assign_attributes(status: order_params[:status], user: @current_user, address: address)

    if order.save
      if !Request.update_requests(request_objects).any? { |r| !!r }
        render json: order
      else 
        #  rollback update to original values
        order.update(status: originalStatus, user: originalUser, address: originalAddress)
        render json: { error: "could not make requests" }, status: :not_acceptable
      end
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
    params.require(:order).permit(:request_objects, :address_id, :note_from_buyer, :status)
  end

  def find_item_by_id(id)
    return Item.find_by(id: id)
  end
end
