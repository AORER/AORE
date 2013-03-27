class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @purchases = @user.purchases
    @outgoing_deals = @user.outgoing_deals
    @incoming_deals = @user.incoming_deals
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def index
    @users = User.all
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

end