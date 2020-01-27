require 'rails_helper'

RSpec.feature 'Events', type: :feature do
	before :each do
		User.create(name: 'john', email: 'john@mail.com')
	end

	context 'Event creation' do
		scenario 'Create a valid event' do
			visit new_session_path
			fill_in 'Email', with: 'john@mail.com'
			click_button 'Login'
			visit new_event_path
      fill_in 'Title', with: 'Event title'
      fill_in 'Description', with: 'Event description'
      fill_in 'Date', with: '30/01/2019'
      click_button 'Create Event'
      expect(page).to have_content('Your event was created')
		end

    scenario 'Create an invalid event with empty fields' do
			visit new_session_path
			fill_in 'Email', with: 'john@mail.com'
			click_button 'Login'
			visit new_event_path
      fill_in 'Title', with: ''
      fill_in 'Description', with: ''
      fill_in 'Date', with: ''
      click_button 'Create Event'
      expect(page).to have_content("Title can't be blank")
      expect(page).to have_content("Title is too short (minimum is 3 characters)")
      expect(page).to have_content("Description can't be blank")
      expect(page).to have_content("Description is too short (minimum is 10 characters)")
      expect(page).to have_content("Date can't be blank")
		end
	end
end
