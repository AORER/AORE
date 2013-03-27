class PurchasesController < ApplicationController

  def index
  end

  def create
  	@user = User.find(params[:purchase][:user_id])
    @original_price  = params[:purchase][:original_price].to_i
    @used_points = 100
    @price_after_discount =  (@original_price - @used_points / 100)
    @new_points = @original_price / 10
    @deal = @user.outgoing_deals.build(purchaser_bonus_points: @new_points - 1, points_for_distribution: @new_points)
  	@purchase = @user.purchases.build(original_price: @original_price, used_points: @used_points, price_after_discount: @price_after_discount, new_points: @new_points)
    if @purchase.save &&  @deal.save
      flash[:success] = "purchase created!"
      redirect_to user_path(@user)
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end
end