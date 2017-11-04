require_relative '../core/rect'

class RoomCollision
	def initialize
		@rects = []
	end

	def add_rectangle(rect)
		@rects.push(rect)
	end

	def contains?(val)
		@rects.map do |rect|
			rect.contains?(val)
		end.any?
	end
end
