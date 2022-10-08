class OrdersController < ApplicationController
  before_action :item_find, only: [:index, :create]
  
  def index
    redirect_to root_path unless user_signed_in?
    redirect_to root_path if current_user == @item.user
    redirect_to root_path if current_user != @item.user && @item.order.present?
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(donation_params)
    #binding.pry
    if @donation.valid?
      pay_item
      @donation.save
      redirect_to root_path
    else
      #@item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def donation_params
    params.require(:donation).permit(:price, :post_code, :prefecture_id, :municipalities, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id,token: params[:token])
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: donation_params[:token],
      currency: 'jpy'
    )
  end
end