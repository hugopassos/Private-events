require 'rails_helper'

RSpec.describe Event, type: :model do
	let(:event) { Event.create(title: 'event', description: 'description of the event', date: '30/01/2020') }
  let(:user) { User.create(name: 'user', email: 'user@mail.com') }

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

  it 'can have many attendees' do
    #pending
  end

  it 'can have many invitations' do
		event = Event.reflect_on_association(:invitations)
		expect(event.macro).to eq(:has_many)
	end
end
