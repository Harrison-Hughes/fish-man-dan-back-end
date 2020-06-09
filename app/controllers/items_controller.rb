class ItemsController < ApplicationController

  before_action :require_admin

  def create 
    
  end

  private

  def itemParams
    params.require(:item).permit(:name, :description, :valid_until)
  end

end
