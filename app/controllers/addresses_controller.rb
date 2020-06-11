class AddressesController < ApplicationController

  before_action :require_login

  def create
    address = Address.new(
      postcode: address_params[:postcode], 
      line_one: address_params[:line_one], 
      line_two: address_params[:line_two], 
      town_city: address_params[:town_city], 
      county: address_params[:county], 
      contact_number: address_params[:contact_number], 
      extra_info: address_params[:extra_info])
    address.user = @current_user
    if address.save
      render json: address
    else 
      render json: { error: "could not add address" }, status: :not_acceptable
    end
  end

  def update
    address = Address.find_by(id: address_params[:id])
    if address.update(address_params)
      render json: address 
    else 
      render json: { error: "could not update address" }, status: :not_acceptable
    end
  end

  def destroy
    address = Address.find_by(id: address_params[:id])
    if address.destroy
      render json: { success: "address destroyed"}
    else
      render json: { error: "could not destroy address" }, status: :not_acceptable
    end 
  end 

  private

  def address_params
    params.require(:address).permit(:id, :postcode, :line_one, :line_two, :town_city, :county, :contact_number, :extra_info)
  end

end
