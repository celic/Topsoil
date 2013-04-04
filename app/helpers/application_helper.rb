module ApplicationHelper

	def descending_order
		'created_at DESC'
	end

	def popularity_order
		'rating DESC'
	end

	def user_popularity_order
		''
	end

	def alphabetical_order
		'name DESC'
	end

	def creator_order
		''
	end

end
