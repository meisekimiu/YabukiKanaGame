require_relative 'vector2'
class Rect
	attr_accessor :position,:size
	def initialize(x=0,y=0,w=0,h=0)
		@position = Vector2.new(x,y)
		@size = Vector2.new(w,h)
	end

	def x
		@position.x
	end
	def x=(value)
		@position.x=value
	end
	def y
		@position.y
	end
	def y=(value)
		@position.y=value
	end
	def w
		@size.x
	end
	def w=(value)
		@size.x=value
	end
	def h
		@size.y
	end
	def h=(value)
		@size.y=value
	end

	def corners
		return [
			Vector2.new(@position.x,@position.y),
			Vector2.new(@position.x+@size.x,@position.y),
			Vector2.new(@position.x,@position.y+@size.y),
			Vector2.new(@position.x+@size.x,@position.y+@size.y)
		]
	end

	def contains?(val)
		if(is_vector?(val) && !is_rect?(val))
			val.x >= @position.x && val.y >= @position.y && val.x <= @position.x+@size.x && val.y <= @position.y+@size.y
		elsif(is_rect?(val))
			val.corners.map do |vect|
				contains? vect
			end.all?
		end
	end

	def is_rect?(val)
		if val.respond_to?(:position) && val.respond_to?(:size)
			return is_vector?(val.position) && is_vector?(val.size)
		end
		false
	end

	private def is_vector?(val)
		val.respond_to?(:x) && val.respond_to?(:y)
	end

	def intersects?(rect)
		if(is_rect? rect)
			return rect.corners.map do |vect|
				contains? vect
			end.any?
		end
		false
	end
end
