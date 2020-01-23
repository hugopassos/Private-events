require 'rails_helper'

RSpec.describe User, type: :model do
	let(:user) { User.new }
	let(:another_user) { User.new }
	let(:event) { Event.create(title: 'test', description: 'testing dependency', date: '30/01/2019') }

	describe '#name' do
		it 'is not valid without a name' do
			user.name = ''
			user.valid?
			expect(user.errors[:name]).to include("can't be blank")
		end

		it 'is not valid with a name longer than 50 characters' do
			user.name = "a" * 51
			user.valid?
			expect(user.errors[:name]).to include('is too long (maximum is 50 characters)')
		end
	end

	describe '#email' do
		it 'is not valid without an email' do
			user.email = ''
			user.valid?
			expect(user.errors[:email]).to include("can't be blank")
		end

		it 'should have a valid format' do
			user.email = 'john'
			user.valid?
			expect(user.errors[:email]).to include('is invalid')
		end

		it 'should be unique' do
			user.name = 'john'
			user.email = 'john@email.com'
			user.save
			another_user.name = 'john'
			another_user.email = 'john@email.com'
			another_user.valid?
			expect(another_user.errors[:email]).to include ('has already been taken')
		end
	end

	it 'can have many events' do
		creator = User.reflect_on_association(:events)
		expect(creator.macro).to eq(:has_many)
	end

	it 'can have many event attendances' do
		creator = User.reflect_on_association(:event_attendances)
		expect(creator.macro).to eq(:has_many)
	end

	it 'can have many invitations' do
		creator = User.reflect_on_association(:invitations)
		expect(creator.macro).to eq(:has_many)
	end

	it 'should destroy dependencies' do
		user.save
		event = user.events.build(title: 'test', description: 'testing dependency', date: '30/01/2019')
		user.destroy
		expect(event).to be(nil)
 	end
end
