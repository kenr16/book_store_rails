class ChargesController < ApplicationController

  def new
    @amount = params[:amount].to_f
  end

  def create
    # byebug
    # Amount in cents
    amount = params[:amount].to_f
    @amount = amount/100

    # customer = Stripe::Customer.create(
    #   :email => params[:stripeEmail],
    #   :source  => params[:stripeToken]
    # )
    charge = Stripe::Charge.create(
      :amount      => amount.to_i,
      :source => params[:stripeToken],
      :currency    => 'usd',
      # :customer => customer.id,
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
