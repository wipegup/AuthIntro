require 'rails_helper'
RSpec.describe 'welcome page', type: :feature do
  before :each do
    @user_1 = User.create(full_name: "Will Pete",
      email: "myaddy@server.net",
      password: "letmein")
  end
  context 'logging in' do
    it 'Clicking the login link takes you to the login page' do
      visit root_path
      click_link "Log In"
      # save_and_open_page
      expect(current_path).to eq(login_path)
    end

    it 'The Login page takes email and password' do
      visit login_path
      fill_in 'user[email]', with: @user_1.email
      fill_in 'user[password]', with: @user_1.password
      click_button "Log In"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Someone is logged in")
    end
  end
end
