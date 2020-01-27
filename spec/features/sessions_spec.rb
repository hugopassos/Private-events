require 'rails_helper'

RSpec.feature 'Sessions', type: :feature do
	before :each do
		User.create(name: 'john', email: 'john@mail.com')
	end

	context 'User Login' do
		scenario 'Successful login' do
			visit new_session_path
			fill_in 'Email', with: 'john@mail.com'
			click_button 'Login'
			expect(page).to have_content('Welcome')
		end

		scenario 'Invalid login' do
			visit new_session_path
			fill_in 'Email', with: 'another_user@mail.com'
			click_button 'Login'
			expect(page).to have_content('Invalid email')
		end
	end
end
