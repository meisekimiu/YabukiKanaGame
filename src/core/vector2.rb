class Vector2
	attr_accessor :x,:y
	def initialize(x=0,y=0)
		@x = x
		@y = y
	end

	def +(vector)
		if vector.respond_to?(:x) && vector.respond_to?(:y)
			Vector2.new(@x+vector.x,@y+vector.y)
		else
			self
		end
	end

	def -(vector)
		self+(vector*-1)
	end

	def *(scalar)
		if scalar.is_a? Numeric
			Vector2.new(@x*scalar,@y*scalar)
		else
			self
		end
	end

	def /(scalar)
		if scalar.is_a? Numeric
			Vector2.new(@x/scalar,@y/scalar)
		else
			self
		end
	end
end
