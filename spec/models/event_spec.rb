require 'rails_helper'

RSpec.describe Event, type: :model do
	let(:event) { Event.new }

  describe '#title' do
		it 'should have a title' do
			event.title = ''
			event.valid?
			expect(event.errors[:title]).to include("can't be blank")
		end

		it 'is not valid with a title shorter than 3 characters' do
			event.title = "aa"
			event.valid?
			expect(event.errors[:title]).to include('is too short (minimum is 3 characters)')
		end
	end

  describe '#description' do
		it 'should have a description' do
			event.description = ''
			event.valid?
			expect(event.errors[:description]).to include("can't be blank")
		end

		it 'is not valid with a title shorter than 10 characters' do
			event.description = "a" * 9
			event.valid?
			expect(event.errors[:description]).to include('is too short (minimum is 10 characters)')
		end
	end

  describe '#date' do
		it 'should have a date' do
			event.date = ''
			event.valid?
			expect(event.errors[:date]).to include("can't be blank")
		end
	end

  it 'should h'
end
