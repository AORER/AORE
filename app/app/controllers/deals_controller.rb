class DealsController < ApplicationController

  def edit
  	@deal = Deal.find(params[:id])
  end

 def update
    @deal = Deal.find(params[:id])
    if @deal.update_attributes(params[:deal])
      flash[:success] = "Deal assigned"
      redirect_to User.find(@deal.purchaser_id)
    else
      render 'edit'
    end
  end
end