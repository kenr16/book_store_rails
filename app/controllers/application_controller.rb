class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :cart_items
  helper_method :cart_cost

  def cart_items
    current_user.account.orders.last.order_items.sum { |item| item.quantity }
  end

  def cart_cost
    cost = 0
    current_user.account.orders.last.order_items.each do |item|
      cost += (item.book.price * item.quantity)
    end
    cost
  end

end
