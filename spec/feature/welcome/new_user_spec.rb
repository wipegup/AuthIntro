require 'rails_helper'

RSpec.describe "welcome page", type: :feature do
  context 'New User Creation' do
    it 'shows option to create new user' do
      visit root_path
      # save_and_open_page
      expect(page).to have_link("Log In", href: login_path)
      expect(page).to have_link("New User", href: new_user_path)
    end

    it 'create new user link directs to correct path' do
      visit root_path
      click_link "New User"

      expect(current_path).to eq(new_user_path)

    end

    it 'Filling in new user info creates new user' do
      visit(new_user_path)

      user_full_name = "Will Peterson"
      user_email = "my.email@server.com"
      user_password = "letmein"

      fill_in 'user[full_name]', with: user_full_name
      fill_in 'user[email]', with: user_email
      fill_in 'user[password]', with: user_password

      click_button "Create User"

      expect(User.count).to eq(1)

      user = User.last

      expect(user.full_name).to eq(user_full_name)
      expect(user.email).to eq(user_email)
      expect(user.password).to eq(user_password)
    end

    it 'Trying to Create a new user with the same e-mail fails' do
      visit(new_user_path)

      user_full_name = "Will Peterson"
      user_email = "my.email@server.com"
      user_password = "letmein"

      fill_in 'user[full_name]', with: user_full_name
      fill_in 'user[email]', with: user_email
      fill_in 'user[password]', with: user_password

      click_button "Create User"

      visit(new_user_path)

      fill_in 'user[full_name]', with: "a"
      fill_in 'user[email]', with: user_email
      fill_in 'user[password]', with: "user_password"

      click_button "Create User"

      expect(page).to have_content("E-mail already in use")

      expect(User.count).to eq(1)

    end
  end
end
