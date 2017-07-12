class OrderItemsController < ApplicationController
  before_action only: [:show] do
    redirect_to books_path unless current_user.account_id == params[:account_id].to_i || current_user.admin
  end

  def new
    order = Order.find(params[:order_id])
    book_id = params[:format].to_i

    book = order.order_items.find {|item| item.book_id == book_id}
    unless book
      item = order.order_items.create(quantity: 1, book_id: book_id)
    else
      book.update_attribute :quantity, book.quantity + 1
    end
    #
    # new_order_item = OrderItem.new(quantity:1, order_id: order_id, book_id: book_id )
    #
    #
    # if !current_user.account.orders.last.order_items.any?
    #   new_order_item.save
    # end
    #
    # new_item = true
    #
    # current_user.account.orders.last.order_items.each do |item|
    #   if new_order_item.book_id.to_i == item.book.id.to_i
    #     value = item.quantity += 1
    #     item.update(quantity: value)
    #     new_item = false
    #   end
    #   byebug
    # end
    #
    # if new_item == true
    #   new_order_item.save
    # end
    #
    #
    redirect_to account_order_path(current_user.account, current_user.account.orders.last)

  end




end
