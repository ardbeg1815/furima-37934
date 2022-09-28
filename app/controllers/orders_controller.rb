class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @donation = Donation.new
  end

  def create
    @item = Item.find(params[:item_id])
    @donation = Donation.new(donation_params)
    binding.pry
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

  def pay_item
    Payjp.api_key = "sk_test_dd6ef05a179ed8d89b847189" 
    Payjp::Charge.create(
      amount: @item.price,
      card: donation_params[:token],
      currency: 'jpy'
    )
  end
end