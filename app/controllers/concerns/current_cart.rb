module CurrentCart

	extend ActiveSupport::Concern
	
	private
	
	def set_cart
		@cart = Cart.find(session[:cart_id])	# check if cart_id exists
	rescue ActiveRecord::RecordNotFound			# if not:
		@cart = Cart.create 					# create cart_id and
		session[:cart_id] = @cart.id 			# store in session
	end 
end