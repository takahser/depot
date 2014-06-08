class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	# method to check wheter the added product already exists in cart
	def add_product(product_id)
		current_item = line_items.find_by(product_id: product_id)
		
		# if exist, bump quantity
		if current_item
		    current_item.quantity += 1
		
		# else, add new LineItem
		else
		    current_item = line_items.build(product_id: product_id)
		end
		
		current_item
	end
	def total_price
		line_items.to_a.sum { |item| item.total_price }
	end
end
