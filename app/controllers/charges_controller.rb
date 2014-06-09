class ChargesController < ApplicationController

	Stripe.api_key = "sk_test_gp9PsCjvj6MyLYVhdxW93qCs"

	def new
	end

	# creating a Stripe::Charge object with various POST parameters
	def create

		# Get the credit card details submitted by the form
		token = params[:stripeToken]

		# Amount in cents
		@amount = 500

		customer = Stripe::Customer.create(
			:email => 'example@stripe.com',
			:card  => params[:stripeToken]
		)

		# Create the charge on Stripe's servers - this will charge the user's card
		charge = Stripe::Charge.create(
			:customer    => customer.id,
			:amount      => @amount,
			:description => 'Rails Stripe customer',
			:currency    => 'usd',
			:card => token
		)

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end

end
