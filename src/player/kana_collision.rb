require_relative '../room/room_collision'
class KanaCollision
	def initialize
		@room = RoomCollision.new
		@player = Rect.new
		@objects = RoomCollision.new
	end

	def register_room_collision(room)
		@room = room
	end
	def update_position(player)
		@player = player
	end
	def register_active_collision(room)
		@objects = room
	end

	def position
		@player.position
	end

	def get_move_pos(xspeed,yspeed)
		new_position = Rect.new
		new_position.position = (position + Vector2.new(xspeed,yspeed))
		new_position.size = @player.size
		new_position
	end

	private def position_iterator(speed)
		if(speed > 0)
			speed.downto(0)
		else
			speed.upto(0)
		end
	end

	def is_valid_space?(rect)
		@room.contains?(rect) && !@objects.intersects?(rect)
	end

	def move(xspeed,yspeed)
		new_position = get_move_pos(xspeed,yspeed)
		if is_valid_space? new_position
			@player.position = new_position.position
		else
			final_xspeed = 0
			final_yspeed = 0
			position_iterator(xspeed).each do |x|
				new_position = get_move_pos(x,0)
				if is_valid_space? new_position
					final_xspeed = x
					break
				end
			end
			position_iterator(yspeed).each do |y|
				new_position = get_move_pos(0,y)
				if is_valid_space? new_position
					final_yspeed = y
					break
				end
			end
			@player.position += Vector2.new(final_xspeed,final_yspeed)
		end
	end
end
