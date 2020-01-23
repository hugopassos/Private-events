require 'rails_helper'

RSpec.describe User, type: :model do
	let(:user) { User.create(name: 'john', email: 'john@mail.com') }
	let(:another_user) { User.new }

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
			user.email = 'john@mail.com'
			another_user.email = 'john@mail.com'
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
		event = user.events.build(title:'title',description:'description',date:'20/01/2020')
    user.events << event
    expect { user.destroy }.to change { Event.count }.by(-1)
 	end
end
