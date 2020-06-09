class AddressesController < ApplicationController

  def create
    user = User.find_by(id: address_params[:user_id])
  end

  private

  def address_params
    params.require(:address).permit(:user_id, :line_one, :line_two, :town_city, :county, :contact_number, :extra_info)
  end

end
