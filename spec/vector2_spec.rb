require 'rspec'
require_relative '../src/core/vector2'

describe Vector2 do
	before :each do
		@zero = Vector2.new
		@one = Vector2.new(1,1)
	end
	describe '.x .y' do
		it 'should be gettable' do
			expect(@zero.x).to eq(0)
			expect(@zero.y).to eq(0)
			expect(@one.x).to eq(1)
			expect(@one.y).to eq(1)
		end
		it 'should be settable' do
			expect(@zero.x).to eq(0)
			expect(@zero.y).to eq(0)
			@zero.x = 5
			@zero.y = 5
			expect(@zero.x).to eq(5)
			expect(@zero.y).to eq(5)
		end
	end
	describe 'vector arithmetic' do
		it 'should be able to add vectors' do
			sum = @zero+@one
			expect(sum.x).to eq(1)
			expect(sum.y).to eq(1)
			sum2 = Vector2.new(5,5) + Vector2.new(-10,24)
			expect(sum2.x).to eq(-5)
			expect(sum2.y).to eq(29)
		end
		it 'should be able to scalar multiply' do
			product = @one*2
			expect(product.x).to eq(2)
			expect(product.y).to eq(2)
			product *= 3
			expect(product.x).to eq(6)
			expect(product.y).to eq(6)
		end
		it 'should be able to subtract vectors' do
			diff = @zero-@one
			expect(diff.x).to eq(-1)
			expect(diff.y).to eq(-1)
		end
		it 'should be able to scalar divide' do
			quotient = Vector2.new(4,4)/2
			expect(quotient.x).to eq(2)
			expect(quotient.y).to eq(2)
		end
	end
	describe '.magnitude' do
		it 'should be able to get vector magnitude' do
			expect(@zero.magnitude).to eq(0)
			expect(Vector2.new(3,4).magnitude).to eq(5)
		end
	end
end
