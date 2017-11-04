require 'rspec'
require_relative '../src/room/room_collision'

describe RoomCollision do
	before :each do
		@room = RoomCollision.new
	end

	describe '.add_rectangle' do
		it 'should be able to add rects' do
			@room.add_rectangle(Rect.new(0,0,5,5))
		end
	end

	describe '.contains?' do
		it 'should be able to detect a rect inside of it' do
			player = Rect.new(1,1,1,1)
			@room.add_rectangle(Rect.new(0,0,5,5))
			expect(@room.contains?(player)).to be_truthy
			player.position = Vector2.new(10,10)
			expect(@room.contains?(player)).to be_falsey
		end
		it 'should be able to check all of its collision points' do
			player = Rect.new(6,4,1,1)
			@room.add_rectangle(Rect.new(0,0,5,3))
			@room.add_rectangle(Rect.new(5,0,3,5))
			expect(@room.contains?(player)).to be_truthy
			player.position = Vector2.new(10,10)
			expect(@room.contains?(player)).to be_falsey
		end
	end
end
