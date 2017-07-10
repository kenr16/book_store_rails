class OrderItemsController < ApplicationController
  before_action only: [:show] do
    redirect_to books_path unless current_user.account_id == params[:account_id].to_i || current_user.admin
  end

  def new
    book_id = params[:format].to_i
    order_id = params[:order_id].to_i
    new_order = OrderItem.create(quantity:1, order_id: order_id, book_id: book_id )
    redirect_to account_order_path(current_user.account, current_user.account.orders.last)
  end




end
