class ChargesController < ApplicationController


before_action :authenticate_user!

def new
	@post = Post.find params[:post_id]
end

def create
  # Amount in cents
  @amount = 500

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Print of #{@post.id}',
    :currency    => 'usd'
  )

 	Order.create(user: current_user, post: @post)
 	flash[:notice] = 'Thanks for your order'
 	redirect_to '/posts'

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to post_charges_path(@post)
	end


end
