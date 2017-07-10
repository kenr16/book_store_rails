class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :cart_items
  helper_method :current_user

  def cart_items
    current_user.account.orders.last.order_items.count
  end

end
