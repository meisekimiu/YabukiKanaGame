require 'rspec'
require_relative '../src/player/kana_collision'

describe KanaCollision do
	before :each do
		@kana = KanaCollision.new
		@room = RoomCollision.new
		@room.add_rectangle(Rect.new(0,0,5,5))
		@player = Rect.new(2,2,1,1)
		@kana.register_room_collision(@room)
		@kana.update_position(@player)
	end
	describe '.position' do
		it 'should get player position' do
			expect(@kana.position.x).to eq(2)
			expect(@kana.position.y).to eq(2)
		end
	end
	describe 'Moving through empty room' do
		it 'can move around' do
			@kana.move(1,0)
			expect(@kana.position.x).to eq(3)
			@kana.move(0,1)
			expect(@kana.position.y).to eq(3)
			@kana.move(-2,0)
			expect(@kana.position.x).to eq(1)
			@kana.move(0,-2)
			expect(@kana.position.x).to eq(1)
		end
		it 'hits walls' do
			@kana.move(10,0)
			expect(@kana.position.x).to eq(4)
			@kana.move(0,10)
			expect(@kana.position.y).to eq(4)
			@kana.move(-10,0)
			expect(@kana.position.x).to eq(0)
			@kana.move(0,-10)
			expect(@kana.position.y).to eq(0)
		end
		it 'hits walls in a complex room' do
			@room = RoomCollision.new
			@room.add_rectangle(Rect.new(0,0,2,10))
			@room.add_rectangle(Rect.new(0,0,10,2))
			@room.add_rectangle(Rect.new(8,0,2,10))
			@room.add_rectangle(Rect.new(0,8,10,2))
			@kana.register_room_collision(@room)
			@player = Rect.new(1,1,1,1)
			@kana.update_position(@player)

			@kana.move(20,0)
			expect(@kana.position.x).to eq(9)
			@kana.move(-4,0)
			@kana.move(0,5)
			expect(@kana.position.y).to eq(1)
			@kana.move(4,0)
			@kana.move(0,10)
			expect(@kana.position.x).to eq(9)
			expect(@kana.position.y).to eq(9)
		end
	end
	describe 'Moving through a room with collision boxes' do
		it 'hits objects and walls in a room' do
			@room = RoomCollision.new
			@room.add_rectangle(Rect.new(0,0,10,10))
			objects = RoomCollision.new
			objects.add_rectangle(Rect.new(2,2,6,6))
			@kana.register_active_collision(objects)
			@kana.register_room_collision(@room)
			@player = Rect.new(1,1,1,1)
			@kana.update_position(@player)
			
			@kana.move(20,0)
			expect(@kana.position.x).to eq(9)
			@kana.move(-4,0)
			@kana.move(0,5)
			expect(@kana.position.y).to eq(1)
			@kana.move(4,0)
			@kana.move(0,10)
			expect(@kana.position.x).to eq(9)
			expect(@kana.position.y).to eq(9)
		end
	end
end
