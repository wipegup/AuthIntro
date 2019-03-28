require 'rails_helper'

RSpec.describe 'User Logoff', type: :feature do
  before :each do
    @user_1 = User.create(full_name: "Will Pete",
      email: "myaddy@server.net",
      password: "letmein")

      visit login_path
      fill_in 'user[email]', with: @user_1.email
      fill_in 'user[password]', with: @user_1.password
      click_button "Log In"
  end

  it 'goes to default after logging off' do
    visit root_path
    expect(page).to have_content("Someone is logged in")

    click_link "Log Off"
    expect(page).to have_content("No one is logged in")


  end
end
