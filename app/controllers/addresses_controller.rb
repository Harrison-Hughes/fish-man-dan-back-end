class AddressesController < ApplicationController

  before_action :require_login

  def create
    invalid_fields = {}

    invalid_fields["recipient_name"]="Please enter the name of the recipient." if address_params[:recipient_name]==""
    invalid_fields["postcode"]="Please enter a valid postcode." if address_params[:postcode].length < 5 ||address_params[:postcode].length > 8
    invalid_fields["line_one"]="Please enter an address." if address_params[:line_one]==""
    invalid_fields["town_city"]="Please enter a town/city." if address_params[:town_city]==""
    invalid_fields["county"]="Please enter a county." if address_params[:county]==""
    invalid_fields["contact_number"]="Please enter a phone number so we can call if there are any issues with delivery." if address_params[:contact_number]==""
    
    if invalid_fields.length > 0
      render json: { error: "invalid form fields", invalid_fields: invalid_fields }
    else
      address = Address.new(
        recipient_name: address_params[:recipient_name],
        postcode: address_params[:postcode], 
        line_one: address_params[:line_one], 
        line_two: address_params[:line_two], 
        town_city: address_params[:town_city], 
        county: address_params[:county], 
        contact_number: address_params[:contact_number], 
      )
      address.user = @current_user
      if address.save
        render json: address
      else 
        render json: { error: "could not add address" }, status: :not_acceptable
      end
    end
  end

  def update
    address = Address.find_by(id: params[:id])
    if address.update(address_params) && address.user == @current_user
      render json: address
    else 
      render json: { error: "could not update address" }
    end
  end

  def destroy
    address = Address.find_by(id: params[:id])
    if address.destroy
      render json: { success: "address destroyed"}
    else
      render json: { error: "could not destroy address" }
    end 
  end 

  private

  def address_params
    params.require(:address).permit(:id, :recipient_name, :postcode, :line_one, :line_two, :town_city, :county, :contact_number)
  end

end
