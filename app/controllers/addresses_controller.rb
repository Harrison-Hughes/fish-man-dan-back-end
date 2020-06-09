class AddressesController < ApplicationController

  before_action :require_login

  def create
    address = Address.new(address_params)
    address.user = @current_user
    if address.save
      render json: address
    else 
      render json: { error: "could not add address" }, status: :not_acceptable
    end
  end

  def delete
    

  private

  def address_params
    params.require(:address).permit(:line_one, :line_two, :town_city, :county, :contact_number, :extra_info)
  end

end
