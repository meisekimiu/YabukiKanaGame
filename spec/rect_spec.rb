require 'rspec'
require_relative '../src/core/rect'

describe Rect do
	before :each do
		@rect = Rect.new(0,0,1,1)
		@big_rect = Rect.new(0,0,10,10)
	end
	describe 'getters and setters' do
		it 'should have gettable properties' do
			expect(@rect.x).to eq(0)
			expect(@rect.y).to eq(0)
			expect(@rect.w).to eq(1)
			expect(@rect.h).to eq(1)
			expect(@big_rect.x).to eq(0)
			expect(@big_rect.y).to eq(0)
			expect(@big_rect.w).to eq(10)
			expect(@big_rect.h).to eq(10)
		end
		it 'should have settable properties' do
			expect(@rect.x).to eq(0)
			expect(@rect.y).to eq(0)
			expect(@rect.w).to eq(1)
			expect(@rect.h).to eq(1)
			@rect.x = 5
			@rect.y = 5
			@rect.w = 10
			@rect.h = 10
			expect(@rect.x).to eq(5)
			expect(@rect.y).to eq(5)
			expect(@rect.w).to eq(10)
			expect(@rect.h).to eq(10)
		end
	end
	describe 'contains?' do
		it 'should be able to see if a Vector2 is contained within it' do
			vector = Vector2.new(0.5,0.5)
			outer_vector = Vector2.new(2,2)
			expect(@rect.contains? vector).to be_truthy
			expect(@rect.contains? outer_vector).to be_falsey
		end
		it 'should be able to see if a Rect is completely contained within it' do
			rect = Rect.new(0.25,0.25,0.5,0.5)
			expect(@rect.contains? rect).to be_truthy
			expect(@rect.contains? @big_rect).to be_falsey
		end
	end
	describe 'intersects?' do
		it 'should detect two rects intersecting' do
			outer_rect = Rect.new(-5,-5,4,4)
			expect(@rect.intersects? @big_rect).to be_truthy
			expect(@rect.intersects? outer_rect).to be_falsey
		end
	end
end
