class ItemsController < ApplicationController
  before_action :item_find, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :redirect_root, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path if @item.order.present?
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
  private
  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :delivery_date_id, :price, :image).merge(user_id: current_user.id)
  end

  def redirect_root
    redirect_to root_path unless current_user == @item.user
  end

  def item_find
    @item = Item.find(params[:id])
  end
end
