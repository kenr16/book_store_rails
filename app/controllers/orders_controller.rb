class OrdersController < ApplicationController
  before_action only: [:show] do
    redirect_to books_path unless current_user.account_id == params[:account_id].to_i || current_user.admin
  end

  def show
    @account = Account.find(params[:account_id])
    @order = Order.find(params[:id])
  end




end
