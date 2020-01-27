require 'rails_helper'

RSpec.describe Invitation, type: :model do
	let(:invitation) { Invitation.create(user_id:1, creator_id: 2, event_id: 1) }
	
	it 'should be unique' do
		should validate_uniqueness_of(:user_id).case_insensitive.scoped_to(:event_id).with_message('Can\'t send the same invitation twice')
	end

  	it 'belongs to creator' do
		invitation = Invitation.reflect_on_association(:creator)
		expect(invitation.macro).to eq(:belongs_to)
	end

	it 'belongs to user' do
		invitation = Invitation.reflect_on_association(:user)
		expect(invitation.macro).to eq(:belongs_to)
	end

	it 'belongs to event' do
		invitation = Invitation.reflect_on_association(:event)
		expect(invitation.macro).to eq(:belongs_to)
	end
end
