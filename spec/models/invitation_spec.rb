require 'rails_helper'

RSpec.describe Invitation, type: :model do
	let(:invitation) { Invitation.create(user_id:1, creator_id: 2, event_id: 1) }
	describe '#index_invitations' do
		it 'should be unique' do
			invitation_2 = Invitation.create(user_id:1, creator_id: 2, event_id: 1)
			expect(invitation_2[:user_id][:event_id]).to include('sdfs')
		end
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
