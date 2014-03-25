class Product < ActiveRecord::Base

	# make sure that title, description, image_url are not empty
	validates :title, :description, :image_url, presence: true

	# make sure that price is a positive number
	validates :price, numericality: {greater_than_or_equal_to: 0.01}

	# make sure that title is unique
	validates :title, uniqueness: true

	# make sure that image_url either ends with .gif, .jpg or .png
	# expression: 	%r = "regular expression", \Z = "End of String", i = "case insensitive"
	# see also: 	http://rubular.com
	validates :image_url, allow_blank: true, format: { 
		with: %r{\.(gif|jpg|png)\Z}i,
		message: 'must be a URL for GIF, JPG or PNG image.'
	}

	# make sure only 0.05 CHF steps are used
	validate :validate_five_rappen

	def validate_five_rappen
		return unless self.price.present?	# necessary, because if price is empty, the next rule will throw an error, because a nr is expected;
		return unless self.price*100%5 != 0
		errors.add(:price, "price check failed")
	end
end
