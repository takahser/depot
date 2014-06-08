class StoreController < ApplicationController

	# invoke the Layout
	include CurrentCart
	before_action :set_cart
  
  def index
  	@products = Product.order(:title)
  end
end
